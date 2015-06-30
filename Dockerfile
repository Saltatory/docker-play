FROM ubuntu:14.04
MAINTAINER Jeff Hohenstein <jeffrey.hohenstein@gmail.com>
LABEL "com.saltatory.vendor" 		= "Saltatory"
LABEL "com.saltatory.version" 		= "1.0"
LABEL "com.saltatory.description" 	= "Typesafe Activator 1.3.5 for Development"
LABEL "com.saltatory.version" 		= "1.0"

# Install desirable OS packages
RUN sudo apt-get update 
RUN sudo apt-get install -y python-software-properties software-properties-common
RUN sudo apt-get -y install htop wget unzip

# Required for non-interactive install of Oracle 8 JDK
RUN sudo add-apt-repository -y ppa:webupd8team/java
RUN sudo apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
RUN sudo apt-get install -y oracle-java8-installer

# Download and install typesafe activator 1.3.5
RUN cd /tmp 
RUN wget -O typesafe-activator-1.3.5.zip http://downloads.typesafe.com/typesafe-activator/1.3.5/typesafe-activator-1.3.5.zip 
RUN unzip typesafe-activator-1.3.5.zip 
RUN mv activator-dist-1.3.5/ /usr/lib 
RUN ln -s /usr/lib/play/activator /usr/bin
RUN ln -s /usr/lib/activator-dist-1.3.5 /usr/lib/play
RUN chmod 655 /usr/lib/play/activator* /usr/lib/play/bin/*

# Create the play user and group
RUN sudo mkdir /var/lib/play
RUN sudo groupadd play
RUN sudo useradd play -g play -s /bin/nologin -M -b /var/lib/play
RUN chown play /var/lib/play
RUN chmod -R 777 /var/lib/play

# Configure networking
EXPOSE 9000
USER play
VOLUME /var/lib/play
WORKDIR /var/lib/play
ENTRYPOINT /usr/lib/play/activator run