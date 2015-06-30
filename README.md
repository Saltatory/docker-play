# Docker, Typesafe, and Play

![Play Framework](images/icon.png)

Create Docker containers for the Typesafe Play framework. Images based on Ubuntu 14.04.

# Containers

* Typesafe Activator, Scala and Play for local development : <code>./development</code>

# Development container

The development container downloads and installs the Oracle JDK (8), Typesafe activator (1.3.5) including Scala and Play.

Play is installed under <code>/usr/lib/play</code>. The container offers to mount <code>/var/lib/play</code> which should be mounted to the location of your Play application. The container will attempt to run your application using <code>activator run</code>. 

Play will run the webserver on port 9000 which should then be mapped by Docker to another port on your host system. 

## Usage

To create a Docker image containing Java 8, Typesafe Activator 1.3.5, and Play.

<code>
docker build <git_repository>/development saltatory/activator
</code>

In the given example, I am developing under Windows. The path to my development workspace is a workspace under my Windows home directory. The following will run an interactive session. If it finds a valid play application in the mounted directory, it will attempt to run that application. If this is the first execution, it may take some time for it to download required libraries, compile, and run the application. If it fails, Play! (activator) will exit. You may choose at this point to create a template Play! application using <code>activator new</code>.

<code>
docker run -t -i -v /c/Users/saltatory/workspace/play-app/:/var/lib/play saltatory/play 
</code>

To find out what IP Address the docker container is using, see [Boot2Docker](https://github.com/boot2docker/boot2docker) for your operating system. To find out what port has been assigned by docker (assuming you do not manually choose one yourself), execute <code>docker ps</code>. Example output :

<code>
CONTAINER ID        IMAGE                 COMMAND                CREATED             STATUS              PORTS                     NAMES
356f602a917b        saltatory/activator   "/bin/sh -c '/usr/li   13 minutes ago      Up 13 minutes       0.0.0.0:32768->9000/tcp cocky_darwin
</code>

## Versions (required or using)

* Ubuntu 14.04
* Docker (1.7.0)
* Typesafe (1.3.5)
* Oracle JDK (8)
