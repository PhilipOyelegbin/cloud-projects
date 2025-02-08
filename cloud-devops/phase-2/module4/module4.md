## **Module 4: CI/CD Pipeline Design**

- Learn the fundamentals of CI/CD pipelines using Jenkins, GitHub Actions, or GitLab CI.
- Hands-on Lab: Set up a simple CI/CD pipeline for a sample application.
- Project: Implement a pipeline that builds and deploys a Dockerized web app to a cloud VM.

### Steps to implement a pipeline that builds and deploys a Dockerized web app to a cloud VM.

1. Install terraform on the local linux machine.
2. Create a new directory for the project and navigate into it.
3. Initialize terraform by running the command `terraform init`.
4. Create a new file called [main.tf](./main.tf) and write infrastructure deployemnt code to create a new VM with docker installed.
5. Run the command `terraform fmt` to format the infrastructure code.
6. Run the command `terraform validate` to validate the infrastructure code.
7. Run the command `terraform plan` to produce the infrastructure deployment plan for review.
8. Run the command `terraform apply` to deploy the infrastructure.
9. Verify the docker is installed on the virtual machine.
   ![preview](./snapshot1.png)

10.
