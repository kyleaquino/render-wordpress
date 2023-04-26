# You can change this to a different version of Wordpress available at
# https://hub.docker.com/_/wordpress
FROM wordpress:6.2.0-apache

RUN apt-get update && apt-get install -y magic-wormhole nano wget
RUN usermod -s /bin/bash www-data
RUN chown www-data:www-data /var/www
USER www-data:www-data

ENTRYPOINT ["entrypoint.sh"]
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
