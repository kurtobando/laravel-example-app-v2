# Use the base image specified in docker-compose.yml
FROM serversideup/php:8.2-fpm-nginx

# Expose the port specified in docker-compose.yml
EXPOSE 8080

# Copy application code and change ownership
COPY --chown=www-data:www-data . /var/www/html

# Drop privileges back to www-data
USER www-data
