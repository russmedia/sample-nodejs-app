pipeline {
    environment { 
        APP_VERSION = appVersion(env.BUILD_ID, env.CLOUD_TYPE)
    }
    agent any

    stages {
        stage('Build') {
            steps {
                container(name: 'kaniko', shell: '/busybox/sh') {
                    sh '''#!/busybox/sh
                    /kaniko/executor -f `pwd`/Dockerfile -c `pwd` --insecure-skip-tls-verify --destination=eu.gcr.io/lucky-nature-179207/metrics-app:$APP_VERSION
                    '''
                }
            }
            
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying.... not ready yet'
            }
        }
    }
}