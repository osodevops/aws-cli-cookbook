# aws-cli-cookbook

The purpose of this repo is to give you a series of useful aws cli commands to help identify the account usage and potential cost saving opportunities.

This project is a work in-progress so please check in regularly to find more updates. 

We hope these scripts and commands will help out on AWS :rocket:

### Requirements

In order to use these scripts and respective commands you have to install the AWS CLI tool. 

Here are a few options:

Install with pip

`$ pip install awscli`

Homebrew on Mac OSX

`$ brew install awscli`

Once you have installed the AWS CLI make sure to configure it before you get started.

Simply type `$ aws configure` and fill in the prompts and you are good to go! 

### How to use

Once you have downloaded the scripts and setup your AWS CLI we can start using the scripts in this repo.
Before we start make sure that you have set the correct access on the scripts.
So go ahead now and chmod the script like so:

`$ chmod 755 example_script.sh `

Then execute the script:

`$ sh example_script.sh aws_config_name`

In all our scripts we help the user to set their aws config that they would like to use, as some users might have multiple AWS accounts that they would like to query. Just remember to setup your aliases in ~/.aws/credentials and ~/.aws/config

### Example CLI command

`$ aws iam list-users --output table`

