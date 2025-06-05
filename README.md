# server_docker_ku
## settingan frankenphp laravel

### setting .env
ganti path untuk ganti routing folder public laravel => /app/{folder_name_laravel}/public/

### copy website
copy folder website ke folder www

### setting .env pada laravel
DB_CONNECTION=mysql<br>
DB_HOST=db<br>
DB_DATABASE=laravel<br>
DB_USERNAME=root<br>
DB_PASSWORD=password

### ke container frankenphp
docker exec -it {container_name_franken} bash<br>
composer install<br>
php artisan key:generate --ansi<br>
php artisan migrate<br>

### akses url
http://localhost:3000
