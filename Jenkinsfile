pipeline{
    agent any

    stages{
        stage("BUILD"){
            steps{
                sh '''
                ./jenkins/build/mvn-build.sh
                ./jenkins/build/build-image.sh
                '''
            }
        }

        stage("TEST"){
            steps{
                sh '''
                ./jenkins/build/mvn-build.sh mvn test
                '''
            }
        }

        stage("PUSH"){
            steps{
                sh '''
                ./jenkins/push/push-image.sh
                '''
            }
        }
        stage("PUBLISH"){
            steps{
                sh '''
                ./jenkins/deploy/deploy.sh
                '''
            }
        }
    }
}