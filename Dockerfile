FROM ubuntu as login
RUN apt-get update -y && apt-get install apache2 -y
COPY login.html /var/www/html/
RUN echo "DirectoryIndex login.html" > /etc/apache2/conf-available/custom-index.conf && \
    a2enconf custom-index && \
    service apache2 restart
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

FROM ubuntu as registration
RUN apt-get update -y && apt-get install apache2 -y
COPY registration.html /var/www/html/
RUN echo "DirectoryIndex login.html" > /etc/apache2/conf-available/custom-index.conf && \
    a2enconf custom-index && \
    service apache2 restart
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]

FROM ubuntu as resume
RUN apt-get update -y && apt-get install apache2 -y
COPY resume.html /var/www/html/
RUN echo "DirectoryIndex login.html" > /etc/apache2/conf-available/custom-index.conf && \
    a2enconf custom-index && \
    service apache2 restart
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]
