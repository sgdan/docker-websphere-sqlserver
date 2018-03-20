FROM ibmcom/websphere-traditional:9.0.0.6-install

ENV PROFILE_NAME profile1
ENV CELL_NAME cell1
ENV NODE_NAME node1
ENV HOST_NAME websphere
ENV SERVER_NAME server1
ENV ADMIN_USER_NAME wsadmin

RUN /work/create_profile

# Useful tools for build & debug
USER root
RUN apt-get install -y --no-install-recommends ca-certificates \
    zip unzip \
    inetutils-ping net-tools \
    vim

# Used to check when server has started by listening to port
ENV DOCKERIZE_VERSION v0.6.0
RUN wget -q https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz    

# use WDR for scripting
WORKDIR /home/was
RUN wget https://github.com/WDR/WDR/archive/master.zip -qO tmp.zip \
    && unzip -qo tmp.zip -d /home/was/ \
    && rm tmp.zip
ENV WAS_HOME /opt/IBM/WebSphere
ENV WDR_HOME /home/was/WDR-master

# Change default password for WSAdmin console (user is "wsadmin")
RUN echo "password" > /tmp/PASSWORD

# download JDBC provider
RUN wget "https://bintray.com/bintray/jcenter/download_file?file_path=net%2Fsourceforge%2Fjtds%2Fjtds%2F1.3.1%2Fjtds-1.3.1.jar" \
    -qO /opt/IBM/WebSphere/AppServer/lib/jtds-1.3.1.jar \
    && chown was:was /opt/IBM/WebSphere/AppServer/lib/jtds-1.3.1.jar

# Start the server so that subsequent startups will be quicker
COPY clean.py ./
COPY *.sh ./
RUN chmod +x *.sh
USER was
RUN ./start.sh

# download and install app
RUN wget -q https://github.com/sgdan/kotlin-bazel-webapp/releases/download/v1.1/webapp.war -O /tmp/webapp.war \
    && wsadmin.sh -lang jython -conntype NONE -c "AdminApp.install('/tmp/webapp.war', '[ -appname webapp -contextroot /webapp -MapWebModToVH [[.* *.war,WEB-INF/web.xml default_host]]]')"

# Configure datasources, JVM properties, etc. 
COPY init.py ./
COPY config.wdrc ./
RUN ./wdr.sh -f init.py
