FROM quay.io/centos/centos:stream9

RUN dnf install -y httpd && dnf clean all

# Redirect logs to stdout/stderr for container compatibility with read-only filesystem
RUN sed -i \
    -e 's|ErrorLog "logs/error_log"|ErrorLog /dev/stderr|' \
    -e 's|CustomLog "logs/access_log" combined|CustomLog /dev/stdout combined|' \
    /etc/httpd/conf/httpd.conf

COPY index.html /var/www/html/index.html

EXPOSE 80

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
