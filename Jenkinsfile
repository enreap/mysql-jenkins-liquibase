pipeline {
    agent any

    environment {
        MYSQL_HOST = 'your.mysql.server.ip'
        MYSQL_PORT = '3306'
        MYSQL_DB   = 'jenkins_db'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/your-org/mysql-jenkins-sample.git'
            }
        }

        stage('Deploy Stored Procedures') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'mysql-jenkins',
                                                  usernameVariable: 'MYSQL_USER',
                                                  passwordVariable: 'MYSQL_PASSWORD')]) {
                    sh '''
                        echo "Deploying stored procedures..."
                        for f in sql/*.sql; do
                            echo "Deploying $f"
                            mysql -h ${MYSQL_HOST} -P ${MYSQL_PORT} -u ${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DB} < $f
                            if [ $? -ne 0 ]; then
                                echo "Error deploying $f"
                                exit 1
                            fi
                        done
                        echo "Deployment complete."
                    '''
                }
            }
        }
    }

    post {
        success { echo 'All procedures deployed successfully!' }
        failure { echo 'Deployment failed. Check the logs.' }
    }
}
