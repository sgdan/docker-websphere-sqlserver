-- Create default database and user
if not exists (select name from sysdatabases where name = 'testdb') create database testdb;
if not exists (select name from syslogins where name = 'testuser')
begin
  create login testuser with password = 'testpass', check_policy = OFF;
  create USER testuser for login testuser
end

alter authorization on database::testdb to testuser;
grant CONTROL TO testuser;
alter database testdb set recovery simple;

go
