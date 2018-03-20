FROM microsoft/mssql-server-linux:2017-CU4

# add dockerize utility to support waiting for TCP ports
ENV DOCKERIZE_VERSION v0.6.0
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

ENV ACCEPT_EULA Y
ENV SA_PASSWORD P*ssw0rd

WORKDIR /sst
COPY init.* ./
CMD /bin/bash init.sh
