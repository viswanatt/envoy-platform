pipeline {
    agent any

    environment {
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Building commit ${env.GIT_COMMIT} on branch ${env.GIT_BRANCH}"
                checkout scm
            }
        }

        stage('Verify Tooling') {
            steps {
                sh '''
                    docker --version
                    git --version
                '''
            }
        }

        stage('Lint Dockerfiles') {
            steps {
                sh '''
                    docker run --rm -i hadolint/hadolint < envoy-api/Dockerfile
                    docker run --rm -i hadolint/hadolint < envoy-ui/Dockerfile
                '''
            }
        }

        stage('Build Envoy API Image') {
            steps {
                sh """
                    docker build -t envoy-api:${IMAGE_TAG} ./envoy-api
                """
            }
        }

        stage('Build Envoy UI Image') {
            steps {
                sh """
                    docker build -t envoy-ui:${IMAGE_TAG} ./envoy-ui
                """
            }
        }

        stage('Smoke Test API') {
            steps {
                sh """
                    docker run -d --name smoke-api -p 3001:3000 envoy-api:${IMAGE_TAG}
                    sleep 5
                    curl -f http://localhost:3001/health || (docker logs smoke-api && exit 1)
                    docker rm -f smoke-api
                """
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline succeeded for build ${IMAGE_TAG}"
        }
        failure {
            echo "❌ Pipeline failed for build ${IMAGE_TAG}"
        }
        always {
            sh 'docker rm -f smoke-api 2>/dev/null || true'
        }
    }
}
