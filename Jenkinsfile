<<<<<<< HEAD

def imageStatus = 'UNKNOWN'



pipeline {

    agent any
    ///agent { label 'Slave1' }
    parameters {
        string(defaultValue: "dockertest", description: 'this is the docker image name', name: 'dockerimagename')

    }


    stages {
        stage('git clone') {
            steps {
               git 'https://github.com/eyalle/Net4U_Docker.git'
            }
        }
        stage('Building image') {
            steps{
                script {
                     sh "pwd"
                     sh "cd  docker"
                     sh "ls -ltrh "
                     docker.build("${dockerimagename}" + ":$BUILD_NUMBER", " ./docker/")
                    /// docker.build "-f docker/Dockerfile"  "${dockerimagename}" + ":$BUILD_NUMBER"
                }
          }

        }





        stage('dockerrun') {
            steps {
                sh " docker run -dit --name my_app -p 8090:80 ${dockerimagename}:${BUILD_NUMBER}"
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

    ///    stage('show files') {
    ///        steps {
    ///            sh "ls -ltrh"
    ///        }
    ///    }

    }
}
=======
>>>>>>> 37eb652eac2b34ddecf1e2a3bafc06651b4df37f
