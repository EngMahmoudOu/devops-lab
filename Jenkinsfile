pipeline {
    agent any

    stages {
        stage('Information') {
            steps {
                echo 'Pipeline Started'

                sh '''
                    pwd
                    ls -la
                '''
            }
        }

        stage('Run Script') {
            steps {
                sh '''
                    SCRIPT=$(find . -type f -name "system_info.sh" | head -n 1)

                    if [ -z "$SCRIPT" ]; then
                        echo "system_info.sh not found"
                        exit 1
                    fi

                    echo "Script found at: $SCRIPT"

                    chmod +x "$SCRIPT"
                    "$SCRIPT"
                '''
            }
        }

        stage('Finished') {
            steps {
                echo 'Pipeline Finished Successfully'
            }
        }
    }
}pipeline {
    agent any

    stages {
        stage('Information') {
            steps {
                echo 'Pipeline Started'

                sh '''
                    pwd
                    ls -la
                '''
            }
        }

        stage('Run Script') {
            steps {
                sh '''
                    SCRIPT=$(find . -type f -name "system_info.sh" | head -n 1)

                    if [ -z "$SCRIPT" ]; then
                        echo "system_info.sh not found"
                        exit 1
                    fi

                    echo "Script found at: $SCRIPT"

                    chmod +x "$SCRIPT"
                    "$SCRIPT"
                '''
            }
        }

        stage('Finished') {
            steps {
                echo 'Pipeline Finished Successfully'
            }
        }
    }
}
