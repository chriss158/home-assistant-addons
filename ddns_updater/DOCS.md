# Home Assistant Add-on: DDNS Updater

DDNS Updater features:

- Updates periodically A records for different DNS providers
- Web user interface (Desktop)
- Web user interface (Mobile)
- Send notifications with Shoutrrr using SHOUTRRR_ADDRESSES

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Supervisor** -> **Add-on Store**.
2. Find the "DDNS Updater" add-on and click it.
3. Click on the "INSTALL" button.
4. Check the logs of the "DDNS Updater" add-on to see if everything went well.

## Configuration

For configuration please see: https://github.com/qdm12/ddns-updater

Documentation for your DNS provider:
- [Aliyun](https://github.com/qdm12/ddns-updater/blob/master/docs/aliyun.md)
- [Allinkl](https://github.com/qdm12/ddns-updater/blob/master/docs/allinkl.md)
- [ChangeIP](https://github.com/qdm12/ddns-updater/blob/master/docs/changeip.md)
- [Cloudflare](https://github.com/qdm12/ddns-updater/blob/master/docs/cloudflare.md)
- [Custom](https://github.com/qdm12/ddns-updater/blob/master/docs/custom.md)
- [DDNSS.de](https://github.com/qdm12/ddns-updater/blob/master/docs/ddnss.de.md)
- [deSEC](https://github.com/qdm12/ddns-updater/blob/master/docs/desec.md)
- [DigitalOcean](https://github.com/qdm12/ddns-updater/blob/master/docs/digitalocean.md)
- [DD24](https://github.com/qdm12/ddns-updater/blob/master/docs/dd24.md)
- [Domeneshop](https://github.com/qdm12/ddns-updater/blob/master/docs/domeneshop.md)
- [DonDominio](https://github.com/qdm12/ddns-updater/blob/master/docs/dondominio.md)
- [DNSOMatic](https://github.com/qdm12/ddns-updater/blob/master/docs/dnsomatic.md)
- [DNSPod](https://github.com/qdm12/ddns-updater/blob/master/docs/dnspod.md)
- [Dreamhost](https://github.com/qdm12/ddns-updater/blob/master/docs/dreamhost.md)
- [DuckDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/duckdns.md)
- [DynDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/dyndns.md)
- [Dynu](https://github.com/qdm12/ddns-updater/blob/master/docs/dynu.md)
- [DynV6](https://github.com/qdm12/ddns-updater/blob/master/docs/dynv6.md)
- [EasyDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/easydns.md)
- [FreeDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/freedns.md)
- [Gandi](https://github.com/qdm12/ddns-updater/blob/master/docs/gandi.md)
- [GCP](https://github.com/qdm12/ddns-updater/blob/master/docs/gcp.md)
- [GoDaddy](https://github.com/qdm12/ddns-updater/blob/master/docs/godaddy.md)
- [GoIP.de](https://github.com/qdm12/ddns-updater/blob/master/docs/goip.md)
- [He.net](https://github.com/qdm12/ddns-updater/blob/master/docs/he.net.md)
- [Infomaniak](https://github.com/qdm12/ddns-updater/blob/master/docs/infomaniak.md)
- [INWX](https://github.com/qdm12/ddns-updater/blob/master/docs/inwx.md)
- [Ionos](https://github.com/qdm12/ddns-updater/blob/master/docs/ionos.md)
- [Linode](https://github.com/qdm12/ddns-updater/blob/master/docs/linode.md)
- [Loopia](https://github.com/qdm12/ddns-updater/blob/master/docs/loopia.md)
- [LuaDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/luadns.md)
- [Myaddr](https://github.com/qdm12/ddns-updater/blob/master/docs/myaddr.md)
- [Name.com](https://github.com/qdm12/ddns-updater/blob/master/docs/name.com.md)
- [Namecheap](https://github.com/qdm12/ddns-updater/blob/master/docs/namecheap.md)
- [NameSilo](https://github.com/qdm12/ddns-updater/blob/master/docs/namesilo.md)
- [Netcup](https://github.com/qdm12/ddns-updater/blob/master/docs/netcup.md)
- [NoIP](https://github.com/qdm12/ddns-updater/blob/master/docs/noip.md)
- [Now-DNS](https://github.com/qdm12/ddns-updater/blob/master/docs/nowdns.md)
- [Njalla](https://github.com/qdm12/ddns-updater/blob/master/docs/njalla.md)
- [OpenDNS](https://github.com/qdm12/ddns-updater/blob/master/docs/opendns.md)
- [OVH](https://github.com/qdm12/ddns-updater/blob/master/docs/ovh.md)
- [Porkbun](https://github.com/qdm12/ddns-updater/blob/master/docs/porkbun.md)
- [Selfhost.de](https://github.com/qdm12/ddns-updater/blob/master/docs/selfhost.de.md)
- [Servercow.de](https://github.com/qdm12/ddns-updater/blob/master/docs/servercow.md)
- [Spdyn](https://github.com/qdm12/ddns-updater/blob/master/docs/spdyn.md)
- [Strato.de](https://github.com/qdm12/ddns-updater/blob/master/docs/strato.md)
- [Variomedia.de](https://github.com/qdm12/ddns-updater/blob/master/docs/variomedia.md)
- [Vultr](https://github.com/qdm12/ddns-updater/blob/master/docs/vultr.md)
- [Zoneedit](https://github.com/qdm12/ddns-updater/blob/master/docs/zoneedit.md)

If you provider is not in the list, you can also try to use a [Custom provider](https://github.com/qdm12/ddns-updater/blob/master/docs/custom.md).

### Example Provider Configuration - Cloudflare (Update IPv4 and IPv6)
```yaml
- provider: cloudflare
  zone_identifier: aas32132sdsdsahg3d3243s26652hada
  domain: example.com
  ttl: 1
  token: "!secret cloudflare_dns_token"
  ip_version: ipv4
- provider: cloudflare
  zone_identifier: aas32132sdsdsahg3d3243s26652hada
  domain: example.com
  ttl: 1
  token: "!secret cloudflare_dns_token"
  ip_version: ipv6
```