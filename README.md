# Hosting
# Common Requirements
In order to use the container deployment, you must meet these requirements:
- ``git`` must be installed, see https://git-scm.com/downloads/linux
- ``docker`` must be installed, see https://docs.docker.com/engine/install/. Also follow the [Linux Post-Install Guide](https://docs.docker.com/engine/install/linux-postinstall/)
- Your user needs ``sudo`` permissions
Once you have these requirements, you can pick a deployment type.

# Choosing Deployments
After that, pick a setup you prefer and follow its readme. The following deployments are available:
- nginx: Simple, no prometheus or grafana, LetsEncrypt for certificates. No sharding, no file server replication, no metrics. Not suited for large-scale (1000+ users)
