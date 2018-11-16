# README
Rails & Devops

* Ruby version
2.5.3

* System dependencies


* Configuration


* Database creation
1. Login using pgsql or psql `psql -U postgres -d postgres`
1. `CREATE DATABASE development_database;`
1. `CREATE ROLE devuser LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE;`
1. `ALTER ROLE devuser WITH PASSWORD 'just4now';`
1. `CREATE DATABASE test_database;`
1. `CREATE ROLE testuser LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE;`
1. `ALTER ROLE testuser WITH PASSWORD 'just4now';`

* Database initialization
1. `rake db:migrate`


* How to run the test suite


* Services (job queues, cache servers, search engines, etc.)


* Deployment instructions