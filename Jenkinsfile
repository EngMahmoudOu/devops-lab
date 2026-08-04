pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Repository downloaded'
            }
        }

        stage('Run Script') {
            steps {
                sh '''
                    SCRIPT=$(find . -type f -name "system_info.sh" | head -n 1)
                    chmod +x "$SCRIPT"
                    "$SCRIPT"
                '''
            }
        }
    }
}
