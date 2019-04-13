# Laravel + Docker

1. Create a container that has composer and initialize a laravel project

```bash
docker run -it --rm -v $(PWD):/data -d composer sh -c "cd /data && composer create-project --prefer-dist laravel/laravel laravel"
```

2. Move laravel project to the same directory as Docker files

```bash
bash -c "shopt -s dotglob && mv -n ./laravel/* ."
```

3. Docker compose

```bash
docker-compose up --build -d
```

The site is now on http://localhost:8000/

4. Connect database

Edit `.env` file to connect database

```
DB_CONNECTION=mysql
DB_HOST=database
DB_PORT=3306
DB_DATABASE=exampledb
DB_USERNAME=exampleuser
DB_PASSWORD=examplepassword
```

5. Open shell in container

```bash
docker-compose exec app sh
```

6. Stop docker compose

```bash
docker-compose down
```
