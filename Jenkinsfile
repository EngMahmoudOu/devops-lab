pipeline {

    agent any

    stages {

        stage('Information') {

            steps {

                echo "Pipeline Started"

                sh '''
                    pwd
                    ls -la
                '''

            }

        }

        stage('Run Script') {

            steps {

                sh '''
                    chmod +x projects/system_info.sh
                    ./projects/system_info.sh
                '''

            }

        }

        stage('Finished') {

            steps {

                echo "Pipeline Finished Successfully"

            }

        }

    }

}
