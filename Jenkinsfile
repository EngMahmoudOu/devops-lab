pipeline {

    agent any

    stages {

        stage('Checkout') {

            steps {

                echo 'Repository Ready'

            }

        }

        stage('Run Script') {

            steps {

                sh '''
                    SCRIPT=$(find . -type f -name "system_info.sh" | head -1)

                    chmod +x "$SCRIPT"

                    "$SCRIPT"
                '''

            }

        }

        stage('Docker Build') {

            steps {

                sh '''

                    docker build -t devops-lab:1.0 .

                '''

            }

        }

        stage('Finished') {

            steps {

                echo 'Pipeline Completed'

            }

        }

    }

}
