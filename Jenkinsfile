pipeline {

    agent any

    stages {

        stage('Run Karate Tests') {
            steps {
                bat 'mvn clean test -Dtest=TestRunner'
            }
        }

    }
}