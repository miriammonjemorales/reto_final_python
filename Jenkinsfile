pipeline {
    agent none

    stages {
        stage('Checkout for Python') {
            agent { label 'agent-builder-python' }
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }

        stage('Install for Python') {
            agent { label 'agent-builder-python' }
            steps {
                sh 'make install'
                sh 'make install_testing'
                sh '. env/bin/activate; pip install flake8'
            }
        }

        stage('Testing in Python') {
            agent { label 'agent-builder-python' }
            steps {
                sh 'make run_tests'
            }
        }

        stage('Linting in Python') {
            agent { label 'agent-builder-python' }
            steps {
                sh '. env/bin/activate; flake8 --exclude env'
            }
        }
    }

    post {
        always {
            node('agent-builder-python') {
                cleanWs()
            }
        }
    }
}
