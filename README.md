[![codecov](https://codecov.io/gh/mattnidz/railsdevops/branch/master/graph/badge.svg)](https://codecov.io/gh/mattnidz/railsdevops)

# Rails & Devops

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
1. `docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube`
1. `sonar-scanner.bat -Dsonar.projectKey=railsdevops -Dsonar.sources=. -Dsonar.host.url=http://localhost:9000 -Dsonar.login=b9440948e7c55f60185ad946fe6e86eda18321c7`

* Services (job queues, cache servers, search engines, etc.)
`docker run -d --name sonarqube -p 9000:9000 -p 9092:9092 sonarqube`

* Deployment instructions