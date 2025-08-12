FROM ubuntu as login
RUN apt-get update -y && apt-get install apache2 -y
COPY login.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

FROM ubuntu as registration
RUN apt-get update -y && apt-get install apache2 -y
COPY registration.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

FROM ubuntu as resume
RUN apt-get update -y && apt-get install apache2 -y
COPY resume.html /var/www/html/index.html
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
