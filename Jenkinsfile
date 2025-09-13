pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/anithavalluri02/amazonprime.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t anithavalluri/amazonprime:latest .'
            }
        }

        stage('Docker Push') {
            steps {
                withCredentials([string(credentialsId: 'anithavalluri-docker', variable: 'DOCKER_TOKEN')]) {
                    sh 'echo $DOCKER_TOKEN | docker login -u anithavalluri --password-stdin'
                    sh 'docker push anithavalluri/amazonprime:latest'
                }
            }
        }

        stage('Deploy to Docker Swarm') {
            steps {
                script {
                    def serviceExists = sh(script: "docker service ls --filter name=amazonprime -q", returnStdout: true).trim()
                    if (serviceExists) {
                        sh '''
                        docker service update \
                            --image anithavalluri/amazonprime:latest \
                            --replicas 2 \
                            --publish-rm 2000:8080 \
                            --publish-add 2000:8080 \
                            amazonprime
                        '''
                    } else {
                        sh '''
                        docker service create \
                            --name amazonprime \
                            --publish 2000:8080 \
                            --replicas 2 \
                            anithavalluri/amazonprime:latest
                        '''
                    }
                }
            }
        }
    }
}
