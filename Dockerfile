# Use an Ubuntu base image
FROM ubuntu:22.04

# Update and install dependencies
RUN apt-get update && apt-get install -y \
    apache2 \
    unzip \
    wget \
 && apt-get clean

# Add the web files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Set up Apache
RUN sed -i 's|/var/www/html|/var/www/html/index.html|' /etc/apache2/sites-available/000-default.conf

