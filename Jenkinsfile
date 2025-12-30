pipeline {
    agent any

    environment {
        LIQUIBASE_HOME = '/opt/liquibase'
        // JDBC_DRIVER = '/usr/share/java/mysql-connector-j-9.5.0.jar'
        JDBC_DRIVER= '/opt/liquibase/lib/mysql-connector-j-9.4.0.jar'

        DB_URL = 'jdbc:mysql://mysql-server:3306/mydb'   // replace with your DB host
        DB_URL= 'jdbc:mysql://44.220.159.252/adminer.php?:3306/jenkins_db'
        DB_USER = 'myuser'                                 // DB username
        DB_PASSWORD = 'MyP@ssw0rd123'                             // DB password
        CHANGELOG_FILE = 'changelog/changelog.xml'             // Liquibase changelog
        STORED_PROC_FILE = 'stored-procedures.sql'      // SQL file with stored procedures
    }

    stages {

        stage('Checkout') {
            steps {
                // Pull your project from Git (code and SQL/changelog files)
                git branch: 'main', url: 'https://github.com/your-repo.git'
            }
        }

        stage('Liquibase Status') {
            steps {
                sh """
                ${LIQUIBASE_HOME}/liquibase \
                    --classpath=${JDBC_DRIVER} \
                    --changeLogFile=${CHANGELOG_FILE} \
                    --url=${DB_URL} \
                    --username=${DB_USER} \
                    --password=${DB_PASSWORD} \
                    status
                """
            }
        }

        stage('Execute Stored Procedures') {
            steps {
                sh """
                # Run stored procedures via Liquibase
                ${LIQUIBASE_HOME}/liquibase \
                    --classpath=${JDBC_DRIVER} \
                    --changeLogFile=${STORED_PROC_FILE} \
                    --url=${DB_URL} \
                    --username=${DB_USER} \
                    --password=${DB_PASSWORD} \
                    update
                """
            }
        }

        stage('Liquibase Update') {
            steps {
                sh """
                ${LIQUIBASE_HOME}/liquibase \
                    --classpath=${JDBC_DRIVER} \
                    --changeLogFile=${CHANGELOG_FILE} \
                    --url=${DB_URL} \
                    --username=${DB_USER} \
                    --password=${DB_PASSWORD} \
                    update
                """
            }
        }

        stage('Archive Reports') {
            steps {
                archiveArtifacts artifacts: '**/*.xml', allowEmptyArchive: true
            }
        }
    }
}





// pipeline {
//     agent any

//     environment {
//         // MYSQL_HOST = 'your.mysql.server.ip'
//         MYSQL_HOST =http://34.228.25.181/adminer.php?server=&username=myuser
//         MYSQL_PORT = '3306'
//         MYSQL_DB   = 'jenkins_db'
//     }

//     stages {
//         stage('Checkout') {
//             steps {
//                 git branch: 'main', url: 'https://github.com/your-org/mysql-jenkins-sample.git'
//             }
//         }

//         stage('Deploy Stored Procedures') {
//             steps {
//                 withCredentials([usernamePassword(credentialsId: 'mysql-jenkins',
//                                                   usernameVariable: 'MYSQL_USER',
//                                                   passwordVariable: 'MYSQL_PASSWORD')]) {
//                     sh '''
//                         echo "Deploying stored procedures..."
//                         for f in sql/*.sql; do
//                             echo "Deploying $f"
//                             mysql -h ${MYSQL_HOST} -P ${MYSQL_PORT} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} < $f
//                             if [ $? -ne 0 ]; then
//                                 echo "Error deploying $f"
//                                 exit 1
//                             fi
//                         done
//                         echo "Deployment complete."
//                     '''
//                 }
//             }
//         }
//     }

//     post {
//         success { echo 'All procedures deployed successfully!' }
//         failure { echo 'Deployment failed. Check the logs.' }
//     }
// }



