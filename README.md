# Laravel + Docker

## Set up Laravel project

You can either create a new Laravel project or move the [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml) to the existing project.

### Create a new Laravel project

-   Create a container that has composer and initialize a laravel project

```bash
docker run -it --rm -v $(PWD):/data composer \
    sh -c "cd /data && composer create-project --prefer-dist laravel/laravel laravel"
```

-   Move laravel project to the same directory as Docker files

```bash
bash -c "shopt -s dotglob && mv -n ./laravel/* ."
```

NOTE: Or you can move all files and folders (including hidden files) from the newly created folder `laravel` to the folder where contains [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml).

### Apply to an existing project

-   Copy [Dockerfile](Dockerfile) and [docker-compose.yml](docker-compose.yml) and paste to the existing Laravel project.

## Set up environments

Edit `.env` database connection credentials

```
DB_CONNECTION=mysql
DB_HOST=database
DB_PORT=3306
DB_ROOT_PASS=secure_root_password
DB_DATABASE=example_database
DB_USERNAME=example_user
DB_PASSWORD=example_password
```

NOTE: This step should be done before running `docker-compose`, since Docker will create MySQL from the environment variables.

## Server commands

### Build docker image

```bash
docker-compose build
```

NOTE: You only need to build at the first time or when [Dockerfile](Dockerfile) changes.

### Start server

```bash
docker-compose up -d
```

The site will be on http://localhost:8000/.

### Execute commands in container

```bash
docker-compose exec app sh
```

NOTE: If you have `php` / `composer` locally, you can run `php` / `composer` commands locally without shell into container.

### Stop server

```bash
docker-compose down
```
