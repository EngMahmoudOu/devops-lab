pipeline {
    agent any

    environment {
        IMAGE_NAME = 'engmahmoudo/devops-lab'
    }

    stages {
        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/EngMahmoudOu/devops-lab.git'
            }
        }

        stage('Verify Environment') {
            steps {
                sh '''
                    echo "Current user:"
                    whoami

                    echo "Current workspace:"
                    pwd

                    echo "Repository files:"
                    ls -la

                    echo "Docker version:"
                    docker --version
                '''
            }
        }

        stage('Run Bash Script') {
            steps {
                sh '''
                    SCRIPT=$(find . -type f -name "system_info.sh" | head -n 1)

                    if [ -z "$SCRIPT" ]; then
                        echo "ERROR: system_info.sh was not found"
                        exit 1
                    fi

                    echo "Running: $SCRIPT"
                    chmod +x "$SCRIPT"
                    "$SCRIPT"
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    docker build \
                      -t "${IMAGE_NAME}:${BUILD_NUMBER}" \
                      -t "${IMAGE_NAME}:latest" .
                '''
            }
        }

        stage('Test Docker Image') {
            steps {
                sh '''
                    docker run --rm "${IMAGE_NAME}:${BUILD_NUMBER}"
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: 'dockerhub-credentials',
                        usernameVariable: 'DOCKER_USER',
                        passwordVariable: 'DOCKER_TOKEN'
                    )
                ]) {
                    sh '''
                        echo "$DOCKER_TOKEN" | \
                        docker login \
                          --username "$DOCKER_USER" \
                          --password-stdin

                        docker push "${IMAGE_NAME}:${BUILD_NUMBER}"
                        docker push "${IMAGE_NAME}:latest"

                        docker logout
                    '''
                }
            }
        }

        stage('Create Report') {
            steps {
                sh '''
                    mkdir -p reports

                    echo "Job Name: $JOB_NAME" > reports/build-report.txt
                    echo "Build Number: $BUILD_NUMBER" >> reports/build-report.txt
                    echo "Image: ${IMAGE_NAME}:${BUILD_NUMBER}" >> reports/build-report.txt
                    echo "Date: $(date)" >> reports/build-report.txt
                    echo "Status: Completed" >> reports/build-report.txt

                    cat reports/build-report.txt
                '''
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully'
        }

        failure {
            echo 'Pipeline failed. Check Console Output'
        }

        always {
            archiveArtifacts(
                artifacts: 'reports/*.txt',
                allowEmptyArchive: true,
                fingerprint: true
            )
        }
    }
}
