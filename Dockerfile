# Stage: registration
FROM ubuntu:22.04 AS registration
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY registration.html /var/www/html/index.html
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage: login
FROM ubuntu:22.04 AS login
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY login.html /var/www/html/index.html
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

# Stage: resume
FROM ubuntu:22.04 AS resume
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get install -y apache2 && \
    rm -rf /var/www/html/*
COPY resume.html /var/www/html/index.html
EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
