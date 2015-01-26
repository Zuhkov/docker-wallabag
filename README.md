# docker-wallabag

Dockerfile used to build a wallabag docker image.

## Usage from index.docker.io

    ID=$(sudo docker run -p 7070:80 -d zuhkov/docker-wallabag:latest /sbin/my_init)

Then head your browser to http://localhost:7070 and enjoy a fresh wallabag install.

Login with Username and password `wallabag`. Don't forget to change your password!

When you're finished, just stop the docker container:

    sudo docker stop $ID

Check the [phusion/baseimage](https://github.com/phusion/baseimage-docker) documentation for all kind of options and switches.

## Persistance of the database

The [wallabag-docker](scripts/wallabag-docker) script enable persistance of the database outside of the container.
Modify the DBPATH variable at will, but keep an absolute path in order to things to work properly.

    ./scripts/wallabag-docker
    Usage: wallabag-docker {start|stop|status}

## Using ENV variable to pass SALT value in config file

You can specify a `--env WALLABAG_SALT=<insert salt value here>` in the docker run command in order to fix the salt value in the wallabag config file on container startup.
Example:

    sudo docker run -p 8080:80 -d --env WALLABAG_SALT=34gAogagAigJaurgbqfdvqQergvqer zuhkov/docker-wallabag:latest /sbin/my_init

## Testing wallabag dev version

The same script enable to "mount" a specific source directory instead of the one from the container.
Just uncomment the SOURCEPATH line, and set it to the absolute path of the wallabag source directory you want to use.

## building from Dockerfile

    sudo docker build -t docker-wallabag .

# Credits

wallabag is an opensource project created by @nicosomb

This docker image is build upon the baseimage made by phusion.
