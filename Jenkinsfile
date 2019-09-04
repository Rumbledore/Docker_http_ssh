def imageStatus = 'UNKNOWN'


pipeline {

    agent any
    parameters {
        string(defaultValue: "repo01", description: 'this is the docker image name', name: 'initial_docker_image_test')
        string(defaultValue: "testuser770770", description: 'this is the docker image name', name: 'leibo88')
        string(defaultValue: "docker-docker", description: 'this is the docker image name', name: 'personal_docker')

    }


    stages {
        // def dockerimagename = "initial_docker_image_test"
        // ${user_docker_hub} = "leibo88"
        // ${cred_id} = "personal_docker"
        stage('clean env'){
            sh 'echo "stopping docker containers"'
            sh 'docker ps -aq | xargs -r docker stop;'
            sh 'echo "killing docker containers"'
            sh 'docker ps -aq | xargs -r docker rm;'
        }

        stage('Building image') {
            steps {
                script {
                    sh "cd  docker"
                    sh "ls -ltrh "
                    docker.build("docker.io/${user_docker_hub}/" + "${dockerimagename}" + ":$BUILD_NUMBER", " ./docker/")

                }

            }

        }


        stage('dockerrun') {
            steps {
                sh " docker run -dit --name my_app -p 8090:80 docker.io/${user_docker_hub}/${dockerimagename}:${BUILD_NUMBER}"
            }
        }

        stage('Testing') {
            steps {
                script {
                    imageStatus = sh(returnStdout: true, script: 'docker ps | grep my_app | wc -l')
                }
            }
        }


        stage('clean all dockers') {
            steps {
                echo "${imageStatus}"
                sh " docker  stop my_app ;docker  rm -f  my_app"
            }
        }

        stage('Push docker  image') {
            when {
                branch 'master'
            }

            steps {
                withDockerRegistry(credentialsId: "${cred_id}", url: '') {
                    sh 'docker push ${user_docker_hub}/${dockerimagename}:${BUILD_NUMBER}'
                }
            }
        }


    }

}


