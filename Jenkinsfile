def imageStatus = 'UNKNOWN'


pipeline {

    agent any
    parameters {
        // string(defaultValue: "repo01", description: 'this is the docker image name', name: 'initial_docker_image_test')
        // string(defaultValue: "testuser770770", description: 'this is the docker image name', name: 'leibo88')
        // string(defaultValue: "docker-docker", description: 'this is the docker image name', name: 'personal_docker')
        string(defaultValue: "net4u_test", description: 'this is the docker image name', name: 'dockerimagename')
        string(defaultValue: "leibo88", description: 'this is the docker image name', name: 'user_docker_hub')
        string(defaultValue: "personal_docker", description: 'this is the docker image name', name: 'cred_id')

    }


    stages {
        // def dockerimagename = "initial_docker_image_test"
        // ${user_docker_hub} = "leibo88"
        // ${cred_id} = "personal_docker"
        stage('clean env'){
            steps{
                script{
                    sh 'echo "stopping docker containers"'
                    sh 'docker ps -aq | xargs -r docker stop;'
                    sh 'echo "killing docker containers"'
                    sh 'docker ps -aq | xargs -r docker rm;'
                }
            }
        }

        stage('Building image') {
            steps {
                script {
                    sh "cd  docker"
                    sh "ls -ltrh "
                    docker.build("docker.io/${user_docker_hub}/" + "${dockerimagename}" + ":initial_docker_image_test_$BUILD_NUMBER", " ./docker/")

                }

            }

        }


        stage('dockerrun') {
            steps {
                sh " docker run -dit --name my_app -p 8090:80 docker.io/${user_docker_hub}/${dockerimagename}:initial_docker_image_test_${BUILD_NUMBER}"
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

        stage('Push docker image') {
            when {
                expression { BRANCH_NAME ==~ /(master|eyal)/ }
            }

            steps {
                withDockerRegistry(credentialsId: "${cred_id}", url: '') {
                    sh 'docker push ${user_docker_hub}/${dockerimagename}:initial_docker_image_test_${BUILD_NUMBER}'
                }
            }
        }


    }

}


