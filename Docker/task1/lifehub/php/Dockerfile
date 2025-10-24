FROM php:8.2-cli-alpine

WORKDIR /lifehub/php/

COPY src /lifehub/php/src


EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80", "-t", "/lifehub/php/src"]