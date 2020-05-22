pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                sh "bundle install"
            }
        }
        stage("Simulando testes") {
            steps {
                sh "cucumber"
            }
        }
    }
}