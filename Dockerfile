# https://serversideup.net/open-source/docker-php/docs
FROM serversideup/php:8.2-fpm-nginx

# Set env variables from serversideup image
ENV AUTORUN_ENABLED=true
ENV PHP_MEMORY_LIMIT=512M
ENV PHP_MAX_EXECUTION_TIME=300

# Set root as initial user to remove permission errors
USER root

# Install the intl extension with root permissions
RUN install-php-extensions intl

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy application code and change ownership
COPY --chown=www-data:www-data . /var/www/html

# Install dependencies
RUN composer install --no-dev --optimize-autoloader

# Drop privileges back to www-data
USER www-data

# Expose the port specified in docker-compose.yml
EXPOSE 8080


