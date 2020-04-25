# docker-compose-laravel
A pretty simplified docker-compose workflow that sets up a LEMP network of containers for local Laravel development. You can view the full article that inspired this repo [here](https://medium.com/@aschmelyun).


## Usage

To get started, make sure you have [Docker installed](https://docs.docker.com/docker-for-mac/install/) on your system, and then clone this repository.

First add your entire Laravel project to the `src` folder, then open a terminal and from this cloned respository's root run `docker-compose up -d --build`. Open up your browser of choice to [http://localhost:8080](http://localhost:8080) and you should see your Laravel app running as intended. **Your Laravel app needs to be in the src directory first before bringing the containers up, otherwise the artisan container will not build, as it's missing the appropriate file.** 

**New:** Three new containers have been added that handle Composer, NPM, and Artisan commands without having to have these platforms installed on your local computer. Use the following command templates from your project root, modifiying them to fit your particular use case:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate` 

Containers created and their ports (if used) are as follows:

- **nginx** - `:8080`
- **phpmyadmin** - `:8081`
- **mysql** - `:3306`
- **php** - `:9000`
- **npm**
- **composer**
- **artisan**

## Persistent MySQL Storage

By default, whenever you bring down the docker-compose network, your MySQL data will be removed after the containers are destroyed. If you would like to have persistent data that remains after bringing containers down and back up, do the following:

1. Create a `mysql` folder in the project root, alongside the `nginx` and `src` folders.
2. Under the mysql service in your `docker-compose.yml` file, add the following lines:

```
volumes:
  - ./mysql:/var/lib/mysql
```
## How to use this
Either for when I inadvertently forget or if someone stumbles upon this.

Clone the repository into a folder
```
git clone https://github.com/LewisLarsen/docker-compose-laravel.git
```
src folder likely doesn't exist, better make that and go into it!
```
mkdir src && cd src
```
Lets pull in laravel
```
docker-compose run --rm --user `id -u`:`id -g` composer create-project laravel/laravel .
```
Once that has done, head into the main folder (where Dockerfile lives)
```
cd ..
```
Build the container
```
docker-compose up --d --build
```

## Notes
Sometimes with lower-specced Digital Ocean droplets, you may encounter issues where Composer complains about a lack of memory, to resolve this you need to assign swap space so its happy again.
https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04

Also sometimes when running composer, it looks like its hung, don't worry and just wait it out!
