FROM glassfish:4.0

ENV simple_version 1.1.0
ENV version 4.7.0-SNAPSHOT
ENV snapshot 4.7.0-20160314.150313-3

RUN wget -q http://www.icatproject.org/mvn/repo/org/icatproject/authn.simple/${simple_version}/authn.simple-${simple_version}-distro.zip
RUN unzip -q authn.simple-*-distro.zip && rm authn.simple-*-distro.zip
COPY authn_simple-setup.properties authn_simple.properties authn.simple/
USER root
RUN cd authn.simple && chown glassfish:glassfish *
USER glassfish
RUN asadmin start-domain; cd authn.simple && ./setup -v install

RUN echo wget -q http://www.icatproject.org/mvn/repo/org/icatproject/icat.server/${version}/icat.server-${snapshot}-distro.zip
RUN wget -q http://www.icatproject.org/mvn/repo/org/icatproject/icat.server/${version}/icat.server-${snapshot}-distro.zip
RUN unzip -q icat.server-*-distro.zip && rm icat.server-*-distro.zip
COPY icat-setup.properties icat.properties icat.logback.xml icat.server/
USER root
RUN cd icat.server && chown glassfish:glassfish *
USER glassfish
RUN asadmin start-domain; mkdir ~/bin && cd icat.server && ./setup -v install
