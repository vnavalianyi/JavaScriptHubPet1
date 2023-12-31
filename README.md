# Project still in development
# Javascript CI/CD Project

This repository contains a simple CI/CD project that automates the process of building a Docker image on self-hosted GitHub Runner, pushing it to Docker Hub, creating infrastructure on AWS, installing and deploying the Docker image to an EC2 instance.

## Tech Stack

+ JavaScript
+ Docker
+ Terraform
+ Ansible
+ GitHub Actions
+ AWS


## Prerequirements/Instalation

1. [AWS](https://aws.amazon.com/?nc1=h_ls) Account:
   - Create a new user
   - Create key pair
2. [DockerHub](https://hub.docker.com/) Account:
   - Create a new repository
3. Create Terraform [Cloud](https://app.terraform.io/session) Account:
   - Create a new organization
   - Create a new project in organization
   - Create a new workspace in project
   - Change backend block in root's providers.tf to your configuration:
   ```
      backend "remote"  {
      organization = "YourOrgName"
   
      workspaces {
         name = "YourWorkspaceName"
      }  
   }
   ```
4. Set up GitHub Runner in your project   
5. Prepare VM for self-hosted GitHub Runner:
   - Install self-hosted GitHub Runner, terrafom, ansible and docker
   - Save AWS SSH private key file generated in 1st step in your user's .ssh folder
6. Setup GitHub project secrets:
   * AWS_ACCESS_KEY_ID      - your AWS_ACCESS_KEY_ID
   * AWS_SECRET_ACCESS_KEY  - your AWS_SECRET_ACCESS_KEY
   * DOCKER_PASSWORD        - your DockerHub account password
   * DOCKER_USERNAME        - your DockerHub account name
   * SSH_KEY                - content of AWS SSH private key generated in 1st step for Ansible to connect to EC2. e.g., raw content
   * SSH_USERNAME           - ssh username
   * TFVARS_FILE            - edit terraform.tfvars.template and copy all content into this secret

## Usage

1. Clone/fork this project


   



