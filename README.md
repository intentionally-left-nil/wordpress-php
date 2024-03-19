# Wordpress php-fpm container

# Installing wordpress

```sh
docker exec -it php /bin/sh
# inside the container:
su www-data
wp core download
wp config create --dbname=wordpress --dbuser=root --dbpass="$MARIADB_ROOT_PASSWORD" --dbhost=db
```
