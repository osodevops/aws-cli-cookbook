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

### Example

`$ aws iam list-users --output table`

