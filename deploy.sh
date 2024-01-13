#!/bin/bash

# Pull changes from the Git repository
git pull origin master

# Install or update dependencies (Composer)
composer install --no-interaction --prefer-dist --optimize-autoloader

# php artisan db:seed --force  # Uncomment if you have seeders

# Clear the cache
php artisan cache:clear
php artisan config:cache

# Optimize Laravel for better performance
php artisan optimize

# Set proper ownership and permissions (adjust as needed)
chmod -R 775 "$APP_PATH/storage" "$APP_PATH/bootstrap/cache"

echo "Deployment completed."