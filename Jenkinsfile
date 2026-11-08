pipeline {
    agent any

    environment {
        APP_SERVER_IP = '172.31.30.206'
        APP_SERVER_USER = 'ec2-user'
        SSH_KEY_ID = 'app-server-ssh-key-id'
        REPO_URL = 'https://github.com/shani-it/CICD--Containerize-3-Tier-Application.git'
        BRANCH_NAME = 'main'
    }

    stages {
        stage('Checkout Code on Jenkins') {
            steps {
                echo 'Pulling source code from GitHub...'
                git branch: "${env.BRANCH_NAME}", url: "${env.REPO_URL}"
            }
        }

        stage('Deploy Application to App Server') {
            steps {
                withCredentials([sshUserPrivateKey(credentialsId: env.SSH_KEY_ID, keyFileVariable: 'KEY_FILE')]) {
                    sh """
                        ssh -i \$KEY_FILE -o StrictHostKeyChecking=no ${APP_SERVER_USER}@${APP_SERVER_IP} '
                            echo "=== Connected to 3Tier App Server ==="
                            
                            # Clean directory & clone fresh code
                            rm -rf ~/app
                            mkdir -p ~/app && cd ~/app
                            git clone -b ${env.BRANCH_NAME} ${env.REPO_URL} .
                            
                            # Deploy using standard DOCKER_BUILDKIT=0 fallback
                            if [ -f "docker-compose.yml" ]; then
                                sudo DOCKER_BUILDKIT=0 docker compose down 2>/dev/null || true
                                sudo DOCKER_BUILDKIT=0 docker compose up -d --build
                            else
                                echo "docker-compose.yml not found in repository!"
                            fi
                            
                            # Verify running containers
                            sudo docker ps
                        '
                    """
                }
            }
        }
    }
}
