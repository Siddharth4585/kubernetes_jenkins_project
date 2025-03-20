FROM ubuntu:20.04
LABEL MAINTAINER="siddharthsri401@gmail.com"

# Install dependencies and clean up to reduce image size
RUN apt-get update -y && \
    apt-get install -y apache2 unzip && \
    apt-get clean

# Add and extract files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]
EXPOSE 80

