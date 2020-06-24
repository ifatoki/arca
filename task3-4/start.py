import boto3
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('--region', action='store', required=True)
parser.add_argument('--instance-id', action='store', required=True)
args = parser.parse_args()

ec2 = boto3.resource('ec2', region_name=args.region)
instance = ec2.Instance(args.instance_id)
instance.start()
