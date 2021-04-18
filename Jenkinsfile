pipeline {
    environment {
        imagename = "h04x3r/exam-app"
    }
    agent any
    stages {
        stage('Clone repo') {
            steps {
                echo 'Cloning..'
                sh """
                    git clone https://github.com/h04x/student-exam2.git .
                """
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
                sh """
                    pip install -e '.[test]'
                    /usr/bin/python-coverage run -m pytest
                    /usr/bin/python-coverage report
                """
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build imagename
                }
            }
        }
        stage('Push image') {
            steps {
                echo 'Deploying....'
                script {
                    docker.withRegistry( '', 'h04x3r-dockerhub') {
                    dockerImage.push('latest')
                    }
                }                
                
            }
        }
        stage('Remove image') {
            steps {
                sh "docker rmi $imagename"
            }
        }
    }
    post { 
        always { 
            cleanWs()
        }
    }
}
