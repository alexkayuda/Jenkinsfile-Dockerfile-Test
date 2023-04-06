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
         stage('credentials') {
            steps {

                withCredentials([usernamePassword( credentialsId: 'dockerhub-credentials', 
                                    usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD'
                                )]) {
                    sh 'echo Username: $USERNAME'
                    sh 'echo Password: $PASSWORD'
                    sh 'docker run alexkayuda/my-alpine-python3-image python3 print_credentials.py $PASSWORD '
                }
                
                // script{
                //     export DOCKER_USERNAME=${DOCKERHUB_CREDENTIALS_USR}
                //     export DOCKER_PASSWORD=${DOCKERHUB_CREDENTIALS_PSW}
                // }
                // sh 'export DOCKER_USERNAME=${DOCKERHUB_CREDENTIALS_USR}'
                // sh 'export DOCKER_PASSWORD=${DOCKERHUB_CREDENTIALS_PSW}'
                // script{
                //     final String DOCKER_USERNAME = ${DOCKERHUB_CREDENTIALS_USR}
                //     def DOCKER_PASSWORD = ${DOCKERHUB_CREDENTIALS_PSW}
                //     sh 'echo $DOCKER_USERNAME'
                //     sh 'echo Username: $USERNAME'
                //     sh 'docker run alexkayuda/my-alpine-python3-image python3 print_credentials.py "$DOCKER_PASSWORD" '
                // }
            }
        }
        stage('Windows') {
            steps {

                build job: 'sub-pipeline.Jenkinsfile', parameters: [
                    string(name: 'PARAM1', value: 'value1'),
                    booleanParam(name: 'PARAM2', value: true)
                ]

                // script{
                //     def subPipeline = load './sub-pipeline.groovy'
                //     subPipeline.run()
                // }
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