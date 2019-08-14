pipeline {
   agent any
    parameters {
        booleanParam(defaultValue: true, description: '', name: 'userFlag')
    }   
   stages {
      stage('Say Hello') {
         steps {
            echo 'Hello World!'   
            sh 'java -version'
         }
      }


        stage ('Clone') {
            steps {
                
                git 'https://github.com/testuser770770/test03.git'
                ///git branch: 'master', url: "https://github.com/testuser770770/test03.git"
            }
        }


      stage('Say test') {
         steps {
            sh 'pwd'
         }
      }



   }
}
