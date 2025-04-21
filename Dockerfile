# Utiliser l'image officielle PHP avec FPM
FROM php:8.1-fpm

# Installer les dépendances système
RUN apt-get update && apt-get install -y \
    git \
    unzip \
    zip \
    curl \
    libicu-dev \
    libonig-dev \
    libzip-dev \
    libxml2-dev \
    libpq-dev \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    procps \
    && docker-php-ext-install \
        intl \
        pdo \
        pdo_mysql \
        zip \
        gd \
        opcache

# Installer Composer (version stable officielle)
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Définir le dossier de travail dans le conteneur
WORKDIR /var/www

# Copier les fichiers du projet
COPY . .

# Donner les bons droits à Symfony
RUN chown -R www-data:www-data /var/www \
    && chmod -R 755 /var/www

# Installer les dépendances PHP avec Composer
RUN composer install --prefer-dist --no-progress --no-suggest --no-interaction || true

# Exposer le port utilisé par PHP-FPM
EXPOSE 9000

# Lancer PHP-FPM
CMD ["php-fpm"]
