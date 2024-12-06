pipeline {
    agent none

    stages {
        stage('Checkout') {
            agent { label 'agent-builder-python' }
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }
        stage('Install') {
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
        stage('Clone Repository Docker Build') {
            agent { label 'agent-builder-docker' }
            steps {
                git branch: 'main',
                    url: 'https://github.com/miriammonjemorales/reto_final_python.git' // Replace with your repo URL
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
