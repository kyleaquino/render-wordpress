#!/usr/bin/env bash
su www-data
cd /tmp && wget https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && cp -R wordpress /var/www/html/
