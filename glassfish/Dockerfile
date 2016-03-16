FROM centos:7

RUN yum install -y java-1.8.0-openjdk-devel wget unzip
RUN useradd glassfish
USER glassfish
WORKDIR /home/glassfish
RUN wget -q https://icatproject.org/misc/install/glassfish-4.0.zip
RUN wget -q https://icatproject.org/misc/scripts/setup-glassfish.py
RUN unzip -q glassfish-4.0.zip && rm glassfish-4.0.zip
ENV PATH $PATH:/home/glassfish/glassfish4/bin
RUN set -- $(date | md5sum) && echo $1 > pw
RUN python setup-glassfish.py domain1 80% $(cat pw)
RUN cat pw

EXPOSE      8080 4848 8181

# verbose causes the process to remain in the foreground so that docker can track it
CMD asadmin start-domain --verbose