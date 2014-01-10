FROM ubuntu:12.04
MAINTAINER Daekwon Kim <propellerheaven@gmail.com>

# Run upgrades
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# Install basic packages
RUN apt-get -qq -y install git curl build-essential

# Install apache2
RUN apt-get -qq -y install apache2
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
RUN a2enmod rewrite 

# Install php
RUN apt-get -qq -y install php5
RUN apt-get -qq -y install libapache2-mod-php5 php5-mysql php5-gd

# Install XpressEngine
RUN git clone https://github.com/xpressengine/xe-core.git /var/www/xe
RUN cd /var/www/xe; git checkout `git describe --tags`
RUN chown -R www-data:www-data /var/www/xe
RUN chmod 707 /var/www/xe

EXPOSE 80
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
