pipeline{
    agent any

    environment{
        PASS = credentials('docker_hub_pass')
    }

    stages{
        stage("Cleanup"){
             steps{
                  cleanWs()
             }
        }
        stage("BUILD"){
            steps{
                sh '''
                ./jenkins/build/mvn-build.sh mvn -B -DskipTests clean package
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