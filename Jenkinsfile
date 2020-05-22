pipeline {
    agent any
    stages {
        stage("Build") {
            steps {
                sh "gem install bundler"
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