FROM php:7.4-apache

WORKDIR /lifehub/php/

COPY src /lifehub/php/src
RUN a2enmod rewrite

EXPOSE 8001

CMD ["apache2-foreground"]