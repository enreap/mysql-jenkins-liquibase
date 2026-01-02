# mysql-jenkins-liquibase
Liquibase

Database version control Popular Tools :

Flyway
Liquibase
Redgate SQL Source Control.

**Sample project :
https://github.com/enreap/mysql-jenkins-liquibase 



Install steps:
Prerequisite:
Jenkins server 
Mysql server

install liquibase on jenkins server 

work flow: GitHub → Jenkins → Liquibase → MySQL

sudo wget <https://github.com/liquibase/liquibase/releases/latest/download/liquibase-linux-amd64.tar.gz>
# Import Liquibase GPG key and add repo
wget -O- <https://repo.liquibase.com/liquibase.asc> | gpg --dearmor > liquibase-keyring.gpg
sudo mv liquibase-keyring.gpg /usr/share/keyrings/liquibase-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/liquibase-keyring.gpg] <https://package.liquibase.com> stable main"   | sudo tee /etc/apt/sources.list.d/liquibase.list
# Update package lists
sudo apt-get update
# Install Liquibase
sudo apt-get install liquibase -y
# Verify installation
liquibase --version

Install mysql-connector
https://downloads.mysql.com/archives/get/p/3/file/mysql-connector-j-9.4.0.zip
sudo mv mysql-connector-j-9.4.0.jar /opt/liquibase/lib/

 the MySQL JDBC driver isn’t installed by default. You need to manually add it so Liquibase can connect to your MySQL server.

 You either copy the .jar to Liquibase lib/ or pass it with --classpath when running Liquibase commands.

Check MySQL is actually running (DB SERVER)
Login to the DB

 sudo systemctl status mysql



sudo systemctl start mysql
sudo ss -tulnp | grep 3306
Expected:LISTEN 0 128 0.0.0.0:3306
Edit config:

sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

 

Change:

bind-address = 127.0.0.1 

To:

bind-address = 0.0.0.0
 

 

Restart:

sudo systemctl restart mysql

 



 Add credentials in Jenkins of mysql database 

Jenkins → Manage Jenkins → Credentials

CREATE:

Kind: Username with password

Username: xxxxx

Password: xxxxx

Jenkins file 

pipeline {

    agent any

environment {
    LIQUIBASE_HOME = '/opt/liquibase'
    JDBC_DRIVER = '/opt/liquibase/lib/mysql-connector-j.jar'

    DB_URL = 'jdbc:mysql://MYSQL_HOST:3306/poc_db'
    DB_USER = 'poc_user'
    DB_PASSWORD = 'poc_pass'

    CHANGELOG_FILE = 'changelog/db.changelog.xml'
}

stages {
    stage('Checkout') {
        steps {
            git url: '<https://github.com/your-org/stored-procedure-poc.git',>
                branch: 'main'
        }
    }

    stage('Deploy Stored Procedures') {
        steps {
            sh """
            ${LIQUIBASE_HOME}/liquibase \\
              --classpath=${JDBC_DRIVER} \\
              --changeLogFile=${CHANGELOG_FILE} \\
              --url=${DB_URL} \\
              --username=${DB_USER} \\
              --password=${DB_PASSWORD} \\
              update
            """
        }
    }
}

}
