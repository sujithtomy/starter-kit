pipeline {
    agent { dockerfile true }

    stages {
        stage('Prepare'){
            steps {
                echo 'Pre Checking'
                sh 'printenv'
                sh 'node --version'
                sh 'npm --version'   
                sh 'npm install'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing'
                sh 'npm run test'
            }
        }

        stage('Build Production'){
            steps {
                echo 'Building'
                
                sh 'npm run build'
            }
        }

        stage('Deploy Production') {
            steps {
                echo 'Deploying'
            }
        }
    }

    post {
        always {
            echo 'This will always run'
        }
        success {
            echo 'This will run only if successful'
        }
        failure {
            echo 'This will run only if failed'
        }
        unstable {
            echo 'This will run only if the run was marked as unstable'
        }
        changed {
            echo 'This will run only if the state of the Pipeline has changed'
            echo 'For example, if the Pipeline was previously failing but is now successful'
        }
    }
}