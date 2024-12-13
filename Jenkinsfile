pipeline {
    agent any
    environment {
        AWS_REGION = 'us-east-1'
    }
    stages {
        stage('Checkout Code') {
            steps {
               // replace git URL below with your git repo url
                git branch: 'main', url: 'https://github.com/vozieh/terraform-test3.git'
            }
        }
        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Plan Terraform') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Apply Terraform') {
            steps {
                input(message: 'Approve deployment?', ok: 'Approve', cancel: 'Cancel')
                sh 'terraform apply 'tfplan''
            }
        }
    }
}
