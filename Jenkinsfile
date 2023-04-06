String cron_string = BRANCH_NAME == "master" ? "*/5 * * * *" : ""

pipeline {
    agent any
    // triggers { cron(cron_string) }
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-credentials')
    }
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t alexkayuda/my-alpine-python3-image .'
            }
        }
        stage('Run HERE') {
            steps {
                sh 'docker run alexkayuda/my-alpine-python3-image python3 hello_here.py'
            }
        }
        stage('Run THERE') {
            steps {
                sh 'docker run alexkayuda/my-alpine-python3-image python3 hello_there.py'
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