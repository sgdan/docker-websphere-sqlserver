# run the SQL Server process in the background
/opt/mssql/bin/sqlservr &

# wait for SQL Server to start up
dockerize -wait tcp://database:1433 -timeout 90s

# run the SQL script to create the database
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P P*ssw0rd -d master -i /sst/init.sql

# wait for the main SQL server process in the background
# without this the container will exit because this script will finish
wait
