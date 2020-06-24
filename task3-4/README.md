# Python Server start and stop script
This directory contains 2 scripts to help start or stop an instance. 

## Set up script environment
1. Ensure you have installed python version 3. You can confirm this by running `python3 --version`. If it is not installed, you can find instructions on installing it [here](https://realpython.com/installing-python/)
2. Be sure to have a virtual environment set up. You can do that by running in `python3 -m venv venv` in this directory.
3. Activate the virtual environment by running `. venv/bin/activate`
4. Install the project dependencies by running `pip install -r requirements.txt`

## Usage
To start up an existing instance, from within the virtual environment already set up above, run

`python3 start.py [-h] --region REGION --instance-id INSTANCE_ID`

To Stop an already started instance,  from within the virtual environment already set up above, run

`python3 stop.py [-h] --region REGION --instance-id INSTANCE_ID`

### Arguments
* `--region` (Required): The AWS region in which the instance is located.
* `--instance-id` (Required): The ID of the instance to operate on.