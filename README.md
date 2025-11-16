# Hosting
# Common Requirements
In order to use the container deployment, you must meet these requirements:
- ``git`` must be installed, see https://git-scm.com/downloads/linux
- ``docker`` must be installed, see https://docs.docker.com/engine/install/. Also follow the [Linux Post-Install Guide](https://docs.docker.com/engine/install/linux-postinstall/)
- Your user needs ``sudo`` permissions
Once you have these requirements, you can pick a deployment type.

# Choosing Deployments
After that, pick a setup you prefer. **Please read the advantages and disadvantages carefully**.
If you are uncertain what to pick, please ask!

Afterward, **follow the steps outlined in the specific readme carefully!** If you do, the deployment should work out of
the box.

Again, if you have questions on a specific step, feel free to ask!

## Reverse-Proxy Bases
These are all deployments based around a reverse proxy, meaning your server will have a service as traffic ingress point, 
providing HTTPs and a layer of security.

**Advantages** 
- Reverse-proxy deployments are simple. They do not require any additional services or software beyond your server and a domain name. 
- Point of failures are limited to the Laci deployment. 
- Full control over security and machine access: Elevate your proxies features to do things like Geo-Blocking

**Disadvantages**
- Full control over security and machine access: Machine security is your own responsibility
- Requires server accessible from the internet

## Cloudflare Bases
Cloudflare deployments leverage Cloudflare's free for non-commercial [Cloudflare Tunnel](https://developers.cloudflare.com/cloudflare-one/networks/connectors/cloudflare-tunnel/)
to provide secure access to your deployment. HTTPs is and security is handled for you.

**Advantages**
- Server does not require access from the internet: Suitable for hosting at home or on locked down servers
- Security is handled for you, your server is not accessible from the internet
- Additional security features available through Cloudflare if needed (usually at a cost)

**Disadvantages**
- Extra service that is required, extra sign-up and a potentially new point of failure
- Free tier has certain limitations: No second-level subdomains, not all TLDs are supported
- Cloudflare may change terms of service at any time, or force you to upgrade to a paid tier (when traffic exceeds certain limitations)

# Available deployments
- **nginx**: Simple, no prometheus or grafana. Backups included. No sharding, no file server replication, no metrics. Not suited for large-scale (1000+ users)
- **Caddy**: Simple, no prometheus or grafana. Backups included. No sharding, no file server replication, no metrics. Not suited for large-scale (1000+ users
- **Cloudflare**: Compile from source, prometheus and grafana included. Security and certificates through cloudflare.