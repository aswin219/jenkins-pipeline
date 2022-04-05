pipeline {

    agent any
#    
#    environment {
#        PASS = credentials('registry-pass') 
#    }



# in BUILD step - build a jar and building docker img using that
    stages {

        stage('Build') { 
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package 
                    ./jenkins/build/build.sh

                '''
            }

        }

        stage('Test') {
            steps {
                sh './jenkins/test/mvn.sh mvn test'
            }
        }

        stage('Push') {
            steps {
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
