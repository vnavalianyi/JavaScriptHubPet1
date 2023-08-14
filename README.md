# Javascript CI/CD Project

This repository contains a simple CI/CD project that automates the process of building a Docker image on self-hosted GitHub Runner, pushing it to Docker Hub, creating infrastructure on AWS, installing and deploying the Docker image to an EC2 instance.

## Tech Stack

+ JavaScript
+ Docker
+ Terraform
+ Ansible
+ GitHub Actions
+ AWS


## Prerequirements

1. AWS Account
2. DockerHub Account
2. VM for self-hosted GitHub Runner

## Usage

1. Clone/fork this project
2. Set up GitHub Runner in your project
3. Install terrafom, ansible and docker on runner
4. Setup GitHub project secrets:
   * AWS_ACCESS_KEY_ID      - your AWS_ACCESS_KEY_ID
   * AWS_SECRET_ACCESS_KEY  - your AWS_SECRET_ACCESS_KEY
   * DOCKER_PASSWORD        - your DockerHub account password
   * DOCKER_USERNAME        - your DockerHub account name
   * SSH_KEY                - content of SSH private key for Ansible to connect to EC2. e.g., raw content of ~/.ssh/id_rsa
   * SSH_USERNAME           - ssh username
   * TFVARS_FILE            - edit terraform.tfvars.template and copy all content into this secret

   



