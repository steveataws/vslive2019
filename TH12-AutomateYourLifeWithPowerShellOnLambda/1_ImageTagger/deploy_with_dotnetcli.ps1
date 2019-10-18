<#
This script builds and deploys the ImageTagger function using AWS extensions for
Lambda in the dotnet CLI.

To run this script you need to have the AWSLambdaPSCore module installed and also
the Amazon.Lambda.Tools global tools package for the dotnet CLI. To install the
tools package run the command 'dotnet tool install -g Amazon.Lambda.Tools.

The Lambda function to deploy is defined in the serverless.template file. In
addition the template defines a new S3 bucket that will be bound to trigger the
Lambda function to run when objects are created or updated under the 'images'
key prefix (by default).
#>

# First build the deployment bundle containing our code, bootstrap files
# and supporting modules that our code invokes (see the 'requires' statements in
# the function code
New-AWSPowerShellLambdaPackage -ScriptPath ./ImageTagger.ps1 -OutputPackage ./build/ImageTagger.zip

# Now deploy the bundle and create/update the Lambda function. Settings in the
# provided aws-lambda-tools-defaults.json file provide inputs to the command line,
# to override simply use the relevant command line switches (use dotnet lambda deploy-serverless help
# to see the collection of switches).
# You will be asked to provide the name of an Amazon S3 bucket to which the deployment
# bundle can be uploaded - it must exist in the same region as the intended Lambda
# function.
dotnet lambda deploy-serverless
