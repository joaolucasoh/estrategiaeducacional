pipeline {
    agent {
        docker {
            image "ruby"
        }
    }
    stages {
        stage("Build") {
            steps {
                sh "bundle install"
            }
        }
        stage("Simulando testes") {
            steps {
                sh "cucumber BROWSER=headless"
            }
        }
    }
}