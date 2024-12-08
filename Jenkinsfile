pipeline {
    agent none

    environment {
        DOCKER_IMAGE = 'miriammonjem/app:latest'
    }

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

        stage('Checkout for Docker') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Checking out the code'
                checkout scm
            }
        }

        stage('Build image in Docker') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Building the docker image'
                sh 'docker compose build app'
            }
        }

        stage('Docker Login and Push') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Login in and Pushing image'
                withCredentials([
                    usernamePassword(
                        credentialsId: 'docker-registry-creds',
                        usernameVariable: 'DOCKER_USERNAME',
                        passwordVariable: 'DOCKER_PASSWORD'
                    )
                ]) {
                    sh """
                    echo ${DOCKER_PASSWORD} | docker login -u ${DOCKER_USERNAME} --password-stdin
                    docker push ${DOCKER_IMAGE}
                    """
                }
            }
        }

        stage('Docker rmi and Logout') {
            agent { label 'agent-builder-docker' }
            steps {
                echo 'Removing the docker image'
                sh 'docker compose down app --rmi all'
                sh 'docker logout'
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
