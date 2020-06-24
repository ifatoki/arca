# Cloudformation template to provision server in default VPC
This Cloudformation template creates an Ubuntu 18.04 machine in the default VPC of your selected AWS region.

## Usage
The template can be run against AWS either by uploading the file `ec2.yaml` to S3 and deploying the template via the AWS Console as described [here](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-create-stack.html) Or by using the AWS CLI as described [here](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-deploy.html)

This is a sample deployment using AWS CLI. Run:

`aws cloudformation deploy  --region us-east-1 --template-file ec2.yaml --stack-name 'arca-stack' --parameter-overrides KeyNameParam=hngi7 InstanceTypeParam=t2.micro ImageIdParam=ami-0ac80df6eff0e70b5`

### Arguments
There are multiple arguments that can be run against AWS CLI command e.g. --region. But here, we'd be specifying only the ones that are unique to this template. 
* `KeyNameParam` (Required): This is the name of the key you'd like to use to access the server after successful deployment.
* `InstanceTypeParam` (Optional): This specifies the instance type to deploy and is set to `t2-micro` by default.
* `ImageIdParam` (Optional): This specifies the ID of the image to base the server off. This image has to be present in the particular region in which you want the server deployed. It is set to `ami-0ac80df6eff0e70b5` by default (hosted in `us-east-1`).

### Outputs
* `InstanceID`: This returns the ID of the instance created.