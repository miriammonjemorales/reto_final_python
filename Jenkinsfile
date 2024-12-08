pipeline {
    agent none

    stages {
        stage('Checkout for tests') {
            agent { label 'agent-builder-python' }
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }

        stage('Install for tests') {
            agent { label 'agent-builder-python' }
            steps {
                sh 'make install'
                sh 'make install_testing'
                sh '. env/bin/activate; pip install flake8'
            }
        }

        stage('Testing') {
            agent { label 'agent-builder-python' }
            steps {
                sh 'make run_tests'
            }
        }

        stage('Linting') {
            agent { label 'agent-builder-python' }
            steps {
                sh '. env/bin/activate; flake8 --exclude env'
            }
        }

        stage('Checkout for docker image build') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }

        stage('Build docker image') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Building the docker image'
                sh 'docker compose build app'
            }
        }

        stage('Removing docker image') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Removing the docker image'
                sh 'docker compose down app --rmi all'
            }
        }
    }

    post {
        always {
            node('agent-builder-python') {
                cleanWs()
            }
            node('agent-builder-docker') {
                cleanWs()
            }
        }
    }
}
