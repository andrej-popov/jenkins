pipeline{
    agent any

    stages{
        stage("BUILD"){
            step{
                sh '''
                ./jenkins/build/mvn-build.sh mvn -B -DskipTests clean package
                ./jenkins/build/build-image.sh
                '''
            }
        }

        stage("TEST"){
            step{
                sh '''
                ./jenkins/build/mvn-build.sh mvn test
                '''
            }
        }

        stage("PUSH"){
            step{
                sh '''
                ./jenkins/push/push-image.sh
                '''
            }
        }
        stage("PUBLISH"){
            step{
                sh '''
                ./jenkins/deploy/deploy.sh

                '''
            }

        }
    }

}