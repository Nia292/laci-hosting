# Caddy
This guide assumes you have read and performed steps 1 and 2 of the self hosting starter guide. If you did not, please
first [do steps 1 and 2 as outlined in our wiki.](https://lacisynchroni.github.io/wiki/docs/hosting/intro)

## About Updating
This deployment comes with an automate update path. In order for that path to work, it's **important that you do not
make any changes to the resulting docker-compose.yaml file!**

Any configuration changes you wish to do have to be done via ``appsettings.json``!

## Requirements
1. You must have a domain registered, for example ``my-fun-sync.eu`` or ``elegant-venue.party``
   1. With your registrar, register two subdomain for that domain that point to the IP of your server:
      1.``laci.<my-domain>.<tld>``, for example ``laci.elegant-venue.party``
      2.``cdn.<my-domain>.<tld>``, for example ``cdn.elegant-venue.party``
   2. Any subdomain works, of course, and any depth works, too, but we recommend sticking to these two basics.
2. Verify that both domains resolve by using ``nslookup <domain>``. It needs to point back to your server
3. You must have a discord bot registered

## Installation
Make sure all dependencies are installed and the domains are registered properly.
The following steps assume that you are installing in your **home directory** (``cd ~``)
1. ``cd ~``
2. ``git clone https://github.com/LaciSynchroni/hosting.git laci``
3. ``cd laci``
4. ``cp sample.env .env``
5. ``cp docker-compose.caddy.yaml docker-compose.yaml``
6. ``cp -r configs-caddy configs``

Now you have to change a few configurations. We'll go through them one by one

## Config: .env file
In the .env file that is now in your ``~/laci`` folder, change what needs changing. You will have to configure
anything that is not explicitly commented with ``# OPTIONAL:``

Please refer to the comments in the ``.env`` file for full information

## Config: Caddyfile
In the ``~/laci/configs/conf`` is a file called ``Caddyfile``. This caddyfile contains two domains:
- ``cdn.mydomain.com``
- ``laci.mydomain.com``

Please replace both instances with your own domain. **Be sure to keep the ``cdn.`` and ``laci.`` subdomains!**

## Starting
1. ``cd ~/laci``
2. ``docker compose --env-file .env pull``
3. ``docker compose --env-file .env up -d``

# Updating this deployment
Updating the deployment is only possible if you did not do any changes to the composefile itself. If you did,
you have to manually update the deployment.

1. ``cd ~/laci``
2. ``git pull``
3. ``docker compose --env-file .env down``
4. ``cp docker-compose.caddy.yaml docker-compose.yaml``
5. ``docker compose --env-file .env pull``
6. ``docker compose --env-file .env up -d``

You should now be on the latest release! Please perform any post-update steps mandated by the release if applicable!

# Further Controls
Additional controls you might need.

## Stopping
1. ``cd ~/laci``
2. ``docker compose --env-file .env stop``

## Stopping
Stops the deployment without deleting anything
1. ``cd ~/laci``
2. ``docker compose --env-file .env stop``

## Restart
Restarts the deployments. **Be aware that changes in .env are not added when restarting!**
1. ``cd ~/laci``
2. ``docker compose --env-file .env resatart``

## Recreating
Recreating is needed when you changed environment variables or anything in the composefile
1. ``cd ~/laci``
2. ``docker compose --env-file .env down``
3. ``docker compose --env-file .env up -d``

## Uninstalling
If you want to uninstall Laci you just have to erase the entire compose deployment, aswell
as the checked out folder

1. ``cd ~/laci``
2. ``docker compose --env-file .env down -v``
3. ``cd ..``
4. ``rm -rf ./laci``

Afterward, you might want to uninstall docker and git, too
