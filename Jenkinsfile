pipeline {
    agent any

    stages {
        stage('Verify Environment') {
            steps {
                echo 'Starting CI pipeline'

                sh '''
                    echo "Current user:"
                    whoami

                    echo "Workspace:"
                    pwd

                    echo "Repository files:"
                    ls -la

                    echo "Git version:"
                    git --version
                '''
            }
        }

        stage('Run Docker Container') {
    steps {
        sh '''
            docker run --rm devops-lab:${BUILD_NUMBER}
        '''
    }
}
        stage('Run Bash Script') {
            steps {
                sh '''
                    echo "Searching for system_info.sh"

                    SCRIPT=$(find . -type f -name "system_info.sh" | head -n 1)

                    if [ -z "$SCRIPT" ]; then
                        echo "ERROR: system_info.sh was not found"
                        exit 1
                    fi

                    echo "Script found at: $SCRIPT"

                    chmod +x "$SCRIPT"
                    "$SCRIPT"
                '''
            }
        }
      
        stage('Build Docker Image') {
            steps {
        sh '''
            docker build -t devops-lab:${BUILD_NUMBER} .
        '''
    }
}
        stage('Create Report') {
            steps {
                sh '''
                    mkdir -p reports

                    echo "Build Number: $BUILD_NUMBER" > reports/build-report.txt
                    echo "Build Date: $(date)" >> reports/build-report.txt
                    echo "Job Name: $JOB_NAME" >> reports/build-report.txt
                    echo "Status: Script completed" >> reports/build-report.txt

                    cat reports/build-report.txt
                '''
            }
        }
    }

    post {
        success {
            echo 'CI pipeline completed successfully'
        }

        failure {
            echo 'CI pipeline failed. Check the console output'
        }

        always {
            archiveArtifacts artifacts: 'reports/*.txt',
                             allowEmptyArchive: true,
                             fingerprint: true
        }
    }
}
