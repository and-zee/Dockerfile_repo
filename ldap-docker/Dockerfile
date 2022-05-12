#
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:20.04

#
# Identify the maintainer of an image
LABEL maintainer="hello.andre@email.com"

#
# Update the image to the latest packages
RUN apt-get update -y && apt-get upgrade -y

#
# Install all required services to run openldap.
RUN apt-get install -y cron openssh-server
# cron openssh-server
# slapd ldap-utils
# gnutls-bin ssl-cert
# apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear
# ldap-account-manager
RUN mkdir -p /home/zee
RUN touch /home/zee/service.log
COPY cron_config /home/zee/cron_config
COPY service.sh /home/zee/service.sh
RUN chmod -R 0744 /home
RUN chmod -R +x /home
RUN crontab /home/zee/cron_config
WORKDIR /home

EXPOSE 80
EXPOSE 22
EXPOSE 443
EXPOSE 389
EXPOSE 636

CMD cron -f
