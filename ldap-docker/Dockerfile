#
# The line below states we will base our new image on the Latest Official Ubuntu 
FROM ubuntu:20.04

#
# Identify the maintainer of an image
LABEL maintainer="hello.andre@email.com"

#
# Update the image to the latest packages
RUN apt update && apt upgrade -y

#
# Install all required services to run openldap.
RUN apt install openssh-server slapd ldap-utils gnutls-bin ssl-cert apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear ldap-account-manager -y

#
# Expose port 80 - HTTP
EXPOSE 80

#
# Expose port 22 - SSH
EXPOSE 22

#
# Expose port 443 - HTTPS
EXPOSE 443

#
# Expose port 389 - LDAP
EXPOSE 389

#
# Expose port 636 - LDAPS
EXPOSE 636

#
# Last is the actual command to start up NGINX within our Container
CMD service ssh start && service slapd start && service apache2 start
