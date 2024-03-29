def imageStatus = 'UNKNOWN'


pipeline {

    agent any
    parameters {
        string(defaultValue: "repo01", description: 'this is the docker image name', name: 'dockerimagename')
        string(defaultValue: "rumbledore", description: 'this is the user name of docker hub', name: 'user_docker_hub')
        string(defaultValue: "rumbledore", description: 'this is the credentials id', name: 'cred_id')
        password(defaultValue: "rootroot", description: 'this is the credentials id', name: 'rootDockerPass')

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

        }


        stage('dockerrun') {
            steps {
                sh " docker run -dit --name ${dockerimagename} -p 8090:80 -p  23:770  -e rootpassword=${rootDockerPass}  docker.io/${user_docker_hub}/${dockerimagename}:${BUILD_NUMBER}"
            }
        }

        stage('Testing') {
            steps {
                script {
                    imageStatus = sh(returnStdout: true, script: 'docker ps | grep "${dockerimagename}" | wc -l')
                }

                timeout(time: 2, unit: "HOURS") {
                    input message: 'Approve Deploy?', ok: 'Yes'
                }
            }
        }


        stage('clean all dockers') {
            steps {
                echo "${imageStatus}"
                sh " docker  stop ${dockerimagename} ;docker  rm -f  ${dockerimagename}"
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


