FROM centos:7

LABEL MAINTAINER="siddharthsri401@gmail.com"

# Install dependencies and clean up to reduce image size
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Download and extract the template
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/

# Unzip, move contents, and clean up
WORKDIR /var/www/html/
RUN unzip photogenic.zip && \
    cp -rvf photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Set non-root user (recommended)
RUN useradd -r -u 1001 -m -s /bin/bash webuser
USER webuser

# Expose port and run httpd
EXPOSE 80
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

