def label = "mypod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
    containerTemplate(name: 'node7', image: 'node:7-alpine', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'node8', image: 'node:8-alpine', ttyEnabled: true, command: 'cat'),
    containerTemplate(name: 'kaniko', image: 'gcr.io/kaniko-project/executor:debug', ttyEnabled: true, command: '/busybox/cat')
  ]) {

    node(label) {
        stage('checkout') {
            checkout scm
        }
        stage('warmup') {
            sh 'pwd'
            sh 'ls -la'
        }
        stage('test node7') {
            container('node7') {
                stage('build on node7') {
                    sh 'ls -la'
                    sh 'node -v'
                    sh 'touch abc.text'
                }
            }
        }
        stage('test node8') {
            container('node8') {
                stage('build on node7') {
                    sh 'ls -la'
                    sh 'node -v'
                }
            }
        }
        stage('test kaniko') {
            container(name: 'kaniko', shell: '/busybox/sh') {
                stage('build and push on kaniko') {
                    sh '''#!/busybox/sh
                        /kaniko/executor -f `pwd`/Dockerfile -c `pwd` --insecure-skip-tls-verify --destination=eu.gcr.io/lucky-nature-179207/metrics-app:0.0.10
                        '''
                }
            }
        }

    }
}