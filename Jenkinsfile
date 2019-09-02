def imageStatus = 'UNKNOWN'



pipeline {

    agent any
    ///agent { label 'Slave1' }
    parameters {
        string(defaultValue: "repo01", description: 'this is the docker image name', name: 'dockerimagename')

    }


    stages {
        
        stage('Building image') {
            steps{
                script {
                     sh "pwd"
                     sh "cd  docker"
                     sh "ls -ltrh "
                     docker.build("docker.io/testuser770770/" + "${dockerimagename}" + ":$BUILD_NUMBER", " ./docker/")
                    /// docker.build "-f docker/Dockerfile"  "${dockerimagename}" + ":$BUILD_NUMBER"
                }
          }

        }





        stage('dockerrun') {
            steps {
                sh " docker run -dit --name my_app -p 8090:80 docker.io/testuser770770/${dockerimagename}:${BUILD_NUMBER}"
            }
        }

    stage('build') {
      steps {
        script {
          imageStatus = sh(returnStdout: true, script: 'docker ps | grep my_app | wc -l')
        }
      }
    }

    ///  stage('test docker container') {
     ///       steps {
    ///             teststatus = sh(script: "docker ps | grep my_app | wc -l", returnStdout: true).trim()
    ///                echo "Git committer email: ${teststatus}"
    ///        }
    ///   }




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
                withDockerRegistry(credentialsId: 'docker-docker' , url: '')   {
                    sh 'docker push testuser770770/${dockerimagename}:${BUILD_NUMBER}'
                }
            }
        }



    ///    stage('show files') {
    ///        steps {
    ///            sh "ls -ltrh"
    ///        }
    ///    }

    }
}

