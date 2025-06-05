# server_docker_ku
## settingan frankenphp laravel

### setting .env
ganti path untuk ganti routing folder public laravel => /app/{folder_name_laravel}/public/

### copy website
copy folder website ke folder www

### setting .env pada laravel
DB_CONNECTION=mysql
DB_HOST=db
DB_DATABASE=laravel
DB_USERNAME=root
DB_PASSWORD=password

### ke container frankenphp
docker exec -it {container_name_frankern} bash
composer install
php artisan key:generate --ansi
php artisan migrate

### akses url
http://localhost:3000
