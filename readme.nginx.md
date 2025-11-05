# NGINX

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
5. ``cp docker-compose.nginx.yaml docker-compose.yaml``
6. ``cp -r configs-nginx configs``

Now you have to change a few configurations. We'll go through them one by one

## Config: .env file
In the .env file that is now in your ``~/laci`` folder, change what needs changing. You will have to configure
anything that is not explicitly commented with ``# OPTIONAL:``

Please refer to the comments in the ``.env`` file for full information

## Config: nginx configs
In the ``~/laci/configs/conf.d`` are two ``.conf`` files. Each of them have references to ``mydomain.com``. Change
all those references to your own domain. Keep the ``files.`` subdomain.

## Starting
1. ``cd ~/laci``
2. ``docker compose --env-file .env pull``
3. ``docker compose --env-file .env up -d``