FROM ubuntu:14.04

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927  
RUN    echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list 
RUN    apt-get update 
RUN    apt-get install -y mongodb-org-shell 
RUN    apt-get install -y mongodb-org-tools 
RUN    echo "mongodb-org-shell hold" | dpkg --set-selections 
RUN    echo "mongodb-org-tools hold" | dpkg --set-selections 
RUN    mkdir /backup

ENV CRON_TIME="0 0 * * *"

ADD run.sh /run.sh
VOLUME ["/backup"]
CMD ["/run.sh"]
