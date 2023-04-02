## Docker Image For [BookStack](https://github.com/ssddanbrown/BookStack)

Forked from https://github.com/solidnerd/docker-bookstack with more frequent updates.

## Current Version: [23.2.2](https://github.com/neuroforgede/docker-bookstack/blob/master/Dockerfile)

### Changes

In 0.28.0 we changed the container http port from 80 to 8080 to allow root privileges to be dropped
In 0.12.2 we removed `DB_PORT` . You can now specify the port via `DB_HOST` like `DB_HOST=mysql:3306`

### Quickstart

With Docker Compose is a Quickstart very easy. Run the following command:

```
docker-compose up
```

and after that open your Browser and go to [http://localhost:8080](http://localhost:8080) . You can login with username 'admin@admin.com' and password 'password'.

### Issues

If you have any issues feel free to create an [issue on GitHub](https://github.com/neuroforgede/docker-bookstack/issues).


### How to use the Image without Docker compose

Note that if you want to use LDAP, `$` has to be escape like `\$`, i.e. `-e "LDAP_USER_FILTER"="(&(uid=\${user}))"`

Networking changed in Docker v1.9, so you need to do one of the following steps.

#### Docker < v1.9

1. MySQL Container:

```bash
docker run -d \
-p 3306:3306 \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_DATABASE=bookstack \
-e MYSQL_USER=bookstack \
-e MYSQL_PASSWORD=secret \
--name bookstack_db \
mysql:5.7.21
```
2. BookStack Container:

```bash
docker run -d --link bookstack_db_:mysql \
-p 8080:8080 \
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
--name bookstack_22.04.02 \
neuroforgede/bookstack:22.04.02
=======
--name bookstack_22.11.0 \
solidnerd/bookstack:22.11.0
>>>>>>> solidnerd/master
=======
--name bookstack_23.02.0 \
solidnerd/bookstack:23.02.0
>>>>>>> solidnerd/master
=======
--name bookstack_23.2.2 \
solidnerd/bookstack:23.2.2
>>>>>>> solidnerd/master
```

#### Docker 1.9+

1. Create a shared network:

```bash
docker network create bookstack_nw
```

2. Run MySQL container :

```bash
docker run -d --net bookstack_nw  \
-e MYSQL_ROOT_PASSWORD=secret \
-e MYSQL_DATABASE=bookstack \
-e MYSQL_USER=bookstack \
-e MYSQL_PASSWORD=secret \
 --name="bookstack_db" \
 mysql:5.7.21
```

3. Run BookStack Container

```bash
docker run -d --net bookstack_nw \
-e DB_HOST=bookstack_db:3306 \
-e DB_DATABASE=bookstack \
-e DB_USERNAME=bookstack \
-e DB_PASSWORD=secret \
-e APP_URL=http://example.com \
-p 8080:8080 \
<<<<<<< HEAD
--name="bookstack_23.02.0" \
 neuroforgede/bookstack:23.02.0
=======
--name="bookstack_23.2.2" \
 solidnerd/bookstack:23.2.2
>>>>>>> solidnerd/master
```

The APP_URL parameter should be the base URL for your BookStack instance without a trailing slash. For example:
APP_URL=http://example.com

#### Volumes
To access your `.env` file and important bookstack folders on your host system change `<HOST>` in the following line to your host directory and add it then to your run command:

```bash
--mount type=bind,source=<HOST>/.env,target=/var/www/bookstack/.env \
-v <HOST>:/var/www/bookstack/public/uploads \
-v <HOST>:/var/www/bookstack/storage/uploads
```
In case of a windows host machine the .env file has to be already created in the host directory otherwise a folder named .env will be created.

After these steps you can visit [http://localhost:8080](http://localhost:8080) . You can login with username 'admin@admin.com' and password 'password'.

### Inspiration

This is a fork of [Kilhog/docker-bookstack](https://github.com/Kilhog/docker-bookstack). Kilhog did the intial work, but I want to go in a different direction.
