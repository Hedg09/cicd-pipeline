pipeline {
    agent any
    environment {     
        DOCKERHUB_CREDENTIALS= credentials('cicd')     
    }    
    stages {
        stage('Git Checkout') {
            steps {
                  git branch: 'main', url: 'https://github.com/Hedg09/cicd-pipeline.git'
            }
        }

        stage('App Build') {
            steps {
                  sh 'script scripts/build.sh'
            }
        }

        stage('Tests') {
            steps {
                  sh 'script scripts/test.sh'
            }
        }

        stage('Node.js App Build') {
            steps {
                script {
                  sh 'docker build -t hedg09/jenkins_cicd_test .'
                  echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin docker.io
                  sh 'docker push hedg09/jenkins_cicd_test'
                  sh 'docker logout'
                }
            }
        }
    }
}
