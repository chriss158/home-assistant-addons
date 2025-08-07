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

### Custom Configuration File

The add-on supports using a custom configuration file that takes precedence over the add-on configuration interface. This is useful for advanced users who want more control over the configuration or need to use features not exposed in the add-on UI.

#### How to use config_custom.json:

1. Create a file named `config_custom.json` in your Home Assistant Addon configuration directory (usually `/addon_configs\xxxxxxx_ddns-updater`)
2. Use the standard DDNS-Updater JSON configuration format
3. The add-on will automatically detect and use this file instead of generating the configuration from the add-on settings

#### Example config_custom.json:
```json
{
  "settings": [
    {
      "provider": "cloudflare",
      "zone_identifier": "zone123456789",
      "domain": "example.com",
      "host": "@",
      "ttl": 300,
      "token": "your_cloudflare_token",
      "ip_version": "ipv4"
    },
    {
      "provider": "duckdns",
      "domain": "mydomain.duckdns.org",
      "token": "your_duckdns_token",
      "ip_version": "ipv4"
    }
  ]
}
```

**Note:** When using `config_custom.json`, the provider configuration in the add-on interface will be ignored. Make sure your custom configuration file is valid JSON and follows the DDNS-Updater configuration schema.

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