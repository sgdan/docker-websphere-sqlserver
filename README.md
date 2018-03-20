# docker-websphere-sqlserver

Run a simple hello-world webapp on WebSphere 9 using the docker image provided by IBM:
- https://hub.docker.com/r/ibmcom/websphere-traditional/

Also uses dev SQL Server image provided by Microsoft:
- https://hub.docker.com/r/microsoft/mssql-server-linux/

Uses the gradle-dcompse-plugin to manage docker containers:
- https://github.com/chrisgahlert/gradle-dcompose-plugin

Uses WDR to simplify WebSphere configuration:
- https://wdr.github.io/WDR/

# Run

To start run:
```
./gradlew startContainers
```
This will run 3 containers (links assume your docker VM is bridged to localhost):
- Websphere: https://localhost:9043/ibm/console/
- Portainer: http://localhost:9000/ (Manage containers, logs)
- SQL Server: tcp://localhost:1433

The web app is installed and you should see recent request times:
- https://localhost:9443/webapp/hello
