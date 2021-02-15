pipeline {
    agent any
    stages {
        stage('Set Up Environment') {
            steps {
               sh "terraform init Terraform/"
               sh "terraform apply -auto-approve Terraform/"
            }
        }
        stage('Configure Environment') {
            steps {
                ansiblePlaybook become: true, credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/config-playbook.yaml'
                ansiblePlaybook become: true, credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/build-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
        stage('Deploy') {
            steps {
                ansiblePlaybook credentialsId: 'key-1', disableHostKeyChecking: true, installation: 'ansible-plugin', inventory: './ansible/host-inv.yaml', playbook: './ansible/deploy-playbook.yaml', extras: '-e tag=${BUILD_NUMBER}'
            }
        }
    }
}
