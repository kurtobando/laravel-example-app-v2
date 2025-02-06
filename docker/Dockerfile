# https://serversideup.net/open-source/docker-php/docs
FROM serversideup/php:8.2-fpm-nginx

# Set root as initial user to remove permission errors
# USER root

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application code and change ownership
COPY --chown=www-data:www-data . /var/www/html

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Expose the port specified in docker-compose.yml
EXPOSE 8080

# Drop privileges back to www-data
USER www-data

#
CMD php artisan storage:link && php artisan migrate && php-fpm
