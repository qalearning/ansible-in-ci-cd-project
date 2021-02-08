pipeline {
    agent any
    stages {
        stage('Configure Environment') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/inventory.yaml', playbook: './ansible/config-playbook.yaml'
            }
        }
        stage('Build') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/inventory.yaml', playbook: './ansible/build-playbook.yaml'
            }
        }
        stage('Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/inventory.yaml', playbook: './ansible/deploy-playbook.yaml'
            }
        }
    }
}