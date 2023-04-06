pipeline {
    agent any
    stages {
        stage('Hello World!') {
            steps {
                sh 'echo "hello world!"'
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