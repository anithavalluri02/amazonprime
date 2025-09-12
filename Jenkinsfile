pipeline {
    agent any

    

    stages {
        stage('Checkout') {
            steps {
                git url:'https://github.com/anithavalluri02/amazonprime.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn clean package'
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
                    // remove existing service if it exists
                    sh 'docker service rm amazonprime || true'

                    // create (or recreate) the swarm service
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
