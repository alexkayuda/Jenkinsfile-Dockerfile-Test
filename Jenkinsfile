String cron_string = BRANCH_NAME == "master" ? "*/5 * * * *" : ""

pipeline {
    agent any
    // triggers { cron(cron_string) }
    environment {
//         DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }
    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ubuntu-test .'
            }
        }
        stage('Start Docker Container') {
            steps {
                sh 'docker run --name ubuntu-test-container -dit ubuntu-test'
            }
        }
        stage('Run HERE') {
            steps {
                sh 'docker exec -it ubuntu-test-container python3 hello_here.py'
            }
        }
        stage('Run THERE') {
            steps {
                sh 'docker exec -it ubuntu-test-container python3 hello_there.py'
            }
        }
        stage("Finally"){
            steps{
                script{
                    echo "Finally DONE!!!"
                }
            }
        }
    }
}