#!/usr/bin/with-contenv bashio

CERT_DIR=/data/ca
WORK_DIR=/data/workdir

# SSL certificate Last Update
CA_UPDATE="0"

# DuckDNS
if bashio::config.has_value "ipv4"; then IPV4=$(bashio::config 'ipv4'); else IPV4=""; fi
if bashio::config.has_value "ipv6"; then IPV6=$(bashio::config 'ipv6'); else IPV6=""; fi
TOKEN=$(bashio::config 'token')
DOMAINS=$(bashio::config 'domains | join(",")')
WAIT_TIME=$(bashio::config 'seconds')
ALGO=$(bashio::config 'ca_options.algo')
CA=$(bashio::config 'ca')

# Function that performe a renew
function ca_renew() {
    local domain_args=()
    local domains=''
    local aliases=''

    domains=$(bashio::config 'domains')

    # Prepare domain for SSL certificate
    for domain in ${domains}; do
        for alias in $(jq --raw-output --exit-status "[.aliases[]|{(.alias):.domain}]|add.\"${domain}\" | select(. != null)" /data/options.json) ; do
            aliases="${aliases} ${alias}"
        done
    done

    aliases="$(echo "${aliases}" | tr ' ' '\n' | sort | uniq)"

    bashio::log.info "Renew certificate with ${CA} for domains: $(echo -n "${domains}") and aliases: $(echo -n "${aliases}")"

    for domain in $(echo "${domains}" "${aliases}" | tr ' ' '\n' | sort | uniq); do
        domain_args+=("--domain" "${domain}")
    done
	
	local pref_chain=''
	case "$CA" in
		letsencrypt) pref_chain='ISRG Root X1';;
		letsencrypt-test) pref_chain='(STAGING) Pretend Pear X1';;
	esac
	
	if [ ! -z "$pref_chain" ]; then
		bashio::log.info 'Using Preferred Chain "${pref_chain}"'
		dehydrated --cron --algo "${ALGO}" --hook ./hooks.sh --challenge dns-01 "${domain_args[@]}" --preferred-chain "${pref_chain}" --out "${CERT_DIR}" --config "${WORK_DIR}/config" || true
    else
		dehydrated --cron --algo "${ALGO}" --hook ./hooks.sh --challenge dns-01 "${domain_args[@]}" --out "${CERT_DIR}" --config "${WORK_DIR}/config" || true
	fi
	    
    CA_UPDATE="$(date +%s)"
}

# Register/generate certificate if terms accepted
if bashio::config.true 'ca_options.accept_terms'; then
	current_ca=${CA}
	if test -f "${WORK_DIR}/config"; then
		current_ca=`grep CA ${WORK_DIR}/config | cut -d'=' -f2`
	fi
	if [ "$current_ca" != "$CA" ]; then
		bashio::log.info "Changed CA from ${current_ca} to ${CA}. Reset dehydrated working and cert files"
		rm -rf "${WORK_DIR}"
		rm -rf "${CERT_DIR}"
	fi

    # Init folder structs
    mkdir -p "${CERT_DIR}"
    mkdir -p "${WORK_DIR}"

    # Clean up possible stale lock file
    if [ -e "${WORK_DIR}/lock" ]; then
        rm -f "${WORK_DIR}/lock"
        bashio::log.warning "Reset dehydrated lock file"
    fi

    # Generate new certs	
    if [ ! -d "${CERT_DIR}/live" ]; then
        # Create empty dehydrated config file so that this dir will be used for storage
		touch ${WORK_DIR}/config
		contact_email=$(bashio::config 'ca_options.contact_email')
		echo "CONTACT_EMAIL=${contact_email}" > ${WORK_DIR}/config
		echo "CA=${CA}" >> ${WORK_DIR}/config
		
        dehydrated --register --accept-terms --config "${WORK_DIR}/config"
    fi
fi

# Run duckdns
while true; do

    [[ ${IPV4} != *:/* ]] && ipv4=${IPV4} || ipv4=$(curl -s -m 10 "${IPV4}")
    [[ ${IPV6} != *:/* ]] && ipv6=${IPV6} || ipv6=$(curl -s -m 10 "${IPV6}")

    if answer="$(curl -s "https://www.duckdns.org/update?domains=${DOMAINS}&token=${TOKEN}&ip=${ipv4}&ipv6=${ipv6}&verbose=true")" && [ "${answer}" != 'KO' ]; then
        bashio::log.info "${answer}"
    else
        bashio::log.warning "${answer}"
    fi

    now="$(date +%s)"
    if bashio::config.true 'ca_options.accept_terms' && [ $((now - CA_UPDATE)) -ge 43200 ]; then
        ca_renew
    fi

    sleep "${WAIT_TIME}"
done