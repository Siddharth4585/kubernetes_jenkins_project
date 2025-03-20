FROM centos:7
LABEL MAINTAINER="siddharthsri401@gmail.com"

# Update the CentOS mirrors to use Vault
RUN sed -i 's|http://mirrorlist.centos.org|http://vault.centos.org|g' /etc/yum.repos.d/CentOS-Base.repo

# Install dependencies and clean up to reduce image size
RUN yum update -y && \
    yum install -y httpd zip unzip && \
    yum clean all && \
    rm -rf /var/cache/yum

# Add and extract files
ADD https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip /var/www/html/
WORKDIR /var/www/html/
RUN unzip photogenic.zip
RUN cp -rvf photogenic/* .
RUN rm -rf photogenic photogenic.zip

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
