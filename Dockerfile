FROM php:7.4-apache

# Install PDO MySQL extension and other dependencies
RUN docker-php-ext-install pdo pdo_mysql

# Enable Apache mod_rewrite and PHP handling
RUN a2enmod rewrite

# Install curl extension
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    && docker-php-ext-install curl

# Configure PHP to handle PHTML files
RUN echo "AddType application/x-httpd-php .php .phtml" >> /etc/apache2/apache2.conf
RUN echo "AddHandler application/x-httpd-php .php .phtml" >> /etc/apache2/apache2.conf

# Set working directory
WORKDIR /var/www/html

# Create and set up PHP configuration for PHTML
RUN { \
    echo '<FilesMatch ".+\.phtml$">'; \
    echo '    SetHandler application/x-httpd-php'; \
    echo '</FilesMatch>'; \
    } > /etc/apache2/conf-available/phtml.conf

# Enable PHTML configuration
RUN a2enconf phtml

# Copy Apache configuration
COPY ./config/apache.conf /etc/apache2/sites-available/000-default.conf
COPY ./htdocs /var/www/html

# Set permissions
RUN chown -R www-data:www-data /var/www/html

# Restart Apache to apply changes
RUN service apache2 restart
