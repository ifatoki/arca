# Docker, Bash and Terraform Project

## Problem Statement
Using bash script,
1. Write a script that will automatically provision 3 docker containers running kibana version 6.4.2, nginx server, mysql server separately on each container. **Environment: Docker CE, Ubuntu 18**
2. Write a script, which will provision
container A: kibana version 6.4.2
container B: nginx server
container C: mysql server
3. Solution should be prepared as only one script, which creates three Docker images, run containers from them, configures Nginx.
4. The three docker containers should be able to ping each other regardless of where it is being deployed.

Use Terraform with Python for Infrastructure Automation

## Bash Script for Docker provisioning
This script can be found in `scripts/` directory

### Dependencies
1. Be sure to have docker installed. You can confirm this by running `docker -v`. Also, information on how to install docker can be found [here](https://docs.docker.com/get-docker/)
2. Make sure there is currently nothing running on **port 80** of your machine as the nginx service would be getting attached to port 80.

### How to Run 
Run `. scripts/deploy.sh`

A successful run would output the IDs of your containers as below.

```
nginx container Id: 0b158a02b8fae6bdf047e0d6647b540f7790d6589c2dcb2913678fb053529f68
mysql container Id: 4ffe235d0f920e7c3475b791d45bd38169fba7ede1eebca698840176646dc3f4
kibana container Id: a6d69752961fafab36ec7982dcee388520ad4d099c924ee4e4300d571207f6d3
```
You would also be able to access your nginx default page in your browser at `localhost`

## Terraform remote provisioning of server and docker scripts
This folder contains all the configuration files to have terraform spin up a server in your selected region in AWS, based on the selected image and using the `deploy.sh` script, spin up the **nginx, mysql and kibana** services **automatically** in the server.

### Dependencies
1. Terraform v0.12.26 (Please confirm by running `terraform -v` and where necessary perform an update).

### How to use
1. Create a copy of the `terraform.tfvars.sample` file but save it as `terraform.tfvars`
2. Modify the entry `public_key_path` to match the path to the public key you'd like to have on the instance.
3. Run `terraform init`
4. Run `terraform plan` (and confirm there are no challenges whatsoever)
5. Run `terraform apply`

### Outputs
Once completed and successful, you'd get outputs in the below form:
```
instance_id = i-096bf9f22689f1cc4
server_address = ec2-54-172-202-218.compute-1.amazonaws.com
```
If you go ahead and open the `server_address` in the browser, you would see the default nginx page. 