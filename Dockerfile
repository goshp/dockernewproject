FROM ubuntu:20.04

# Install Apache2 and required utilities
RUN apt-get update && \
    apt-get install -y apache2 && \
    apt-get clean

# Copy HTML files to Apache's web root
COPY login.html /var/www/html/
COPY registration.html /var/www/html/
COPY resume.html /var/www/html/

# Expose port 80
EXPOSE 80

# Start Apache2 in foreground
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
