def imageStatus = 'UNKNOWN'


pipeline {

    agent any
    parameters {
        string(defaultValue: "repo01", description: 'this is the docker image name', name: 'dockerimagename')
        string(defaultValue: "testuser770770", description: 'this is the docker image name', name: 'user_docker_hub')
        string(defaultValue: "docker-docker", description: 'this is the docker image name', name: 'cred_id')

    }


    stages {
        stage('Building image') {
            steps {
                script {
                    sh "cd  docker"
                    sh "ls -ltrh "
                    docker.build("docker.io/${user_docker_hub}/" + "${dockerimagename}" + ":$BUILD_NUMBER", " ./docker/")

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
                    "${imageStatus}" == "1"
                }

                steps {
                    withDockerRegistry(credentialsId: '${cred_id}', url: '') {
                        sh 'docker push ${user_docker_hub}/${dockerimagename}:${BUILD_NUMBER}'
                    }
                }
            }


        }
    }

}