# Docker, Typesafe, and Play

![Play Framework](images/icon.png)

Create Docker containers for the Typesafe Play framework.

# Development container

The development container downloads and installs the Oracle JDK (8), Typesafe activator (1.3.5).

Play is installed under <code>/usr/lib/play</code>. The container offers to mount <code>/var/lib/play</code> which should be mounted to the location of your Play application. The container will attempt to run your application using <code>activator run</code>. 

Play will run the webserver on port 9000 which should then be mapped by Docker to another port on your host system.

## Usage

In the given example, I am developing under Windows. The path to my development workspace is a workspace under my Windows home directory. The following will run an interactive session. If it finds a valid play application in the mounted directory, it will attempt to run that application. If this is the first execution, it may take some time for it to download required libraries, compile, and run the application. If it fails, Play! (activator) will exit. You may choose at this point to create a template Play! application using <code>activator new</code>.

<code>
cd /c/Users/saltatory/workspace/play-app
# Run the container in interactive mode
docker run -t -i -v ./:/var/lib/play saltatory/play 
</code>

## Versions (required or using)

* Docker (1.7.0)
* Typesafe (1.3.5)
* Oracle JDK (8)
