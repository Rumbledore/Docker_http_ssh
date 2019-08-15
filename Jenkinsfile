pipeline {
   agent any
    parameters {
        booleanParam(defaultValue: true, description: '', name: 'userFlag')
    }   
   stages {
      stage('java version') {
         steps {
            sh 'java -version'
         }
      }



      stage('show files in repo') {
         steps {
            sh 'ls -ltrh '
         }
      }


      stage('docker pull image httpd') {
         steps {
            sh 'docker pull httpd'
         }
      }


      stage('docker run httpd docker ') {
         steps {
            sh 'docker run -d --name my-running-app -p 8090:80 my-apache2'
         }
      }


      stage('check docker status ') {
         steps {
            sh 'docker ps'
         }
      }



   }
}
