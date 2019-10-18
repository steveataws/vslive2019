# Visual Studio Live! San Diego, 2019, Demo Materials

This repository contains the decks and code samples from my sessions at the Visual Studio Live! conference in San Diego during October 2019.

## W17 - Serverless .NET on AWS

This session presented a 100% serverless, end to end demo application named CloudMosaic. The folder in this repository contains the slide deck that was used in the presentation. The code, along with follow-along-yourself workshop style documentation, can be found in [this GitHub repository](https://github.com/aws-samples/cloudmosaic-dotnet).

## TH12 - Automate your life with PowerShell on AWS Lambda

This session discussed PowerShell on AWS and particularly it's use in serverless functions in [AWS Lambda](https://aws.amazon.com/lambda/). The folder contains the deck and the code for the four demos that illustrated different ways to invoke and use Lambda functions. The initial live-coded 'hello world' demo that was used to introduce the [AWSLambdaPSCore](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-lambda.html) tools and show how to code, deploy and invoke serverless functions written using PowerShell in AWS Lambda is not included.

### Demo 1

This demo illustrated having a Lambda function be invoked as a result of an event, in this case when a new object is created, or an existing object updated, in an [Amazon S3](https://aws.amazon.com/s3/) bucket. The sample also illustrates two options for deployment - using the AWSLambdaPSCore tools, or creating and deploying a serverless template using the [AWS Lambda extensions for the dotnet CLI](https://github.com/aws/aws-extensions-for-dotnet-cli).

The sample Lambda function uses [Amazon Rekognition](https://aws.amazon.com/rekognition/) to inspect uploaded image files to 'keyword' it (Rekognition uses the term 'label'). The detected labels can be applied to the S3 object as tags (the default, which will attach up to 10 tags) or the function can be configured using environment variables to write the labels to a file in the same S3 bucket (but different key prefix to prevent a runaway set of Lambda invocations!). When writing to a file all detected labels are output (see the function code for more details).

My usage scenario for this function is as a photographer outside of AWS, I submit images to various online galleries that all require images to be tagged regarding the content. Thinking up tags is tedious and can be time consuming with a lot of images! Therefore I have a personal project to write an extension for Adobe Lightroom, which I use, to automate the process of getting a baseline set of tags for images which will make use of this function.

To build and deploy using the AWSLambdaPSCore tools see the [deploy_with_awslambdapscore](./1_ImageTagger/deploy_with_awslambdapscore.ps1) script. When choosing this option you need to do some manual post-deployment configuration to setup an S3 bucket as an event source - see the comments at the top of the script.

To build the deployment package with the AWSLambdaPSCore tools and deploy using the dotnet CLI see the [deploy_with_dotnetcli](./1_ImageTagger/deploy_with_dotnetcli.ps1) script. The [AWS CloudFormation](https://aws.amazon.com/cloudformation/) template (./1_ImageTagger/serverless.template) used in this step also creates and configures an S3 bucket to act as an event source so you do not need to perform the post-deployment configuration step.

### Demo 2

This demo illustrated how Lambda functions can be fronted by a web API, hosted in API Gateway.

### Demo 3

This demo illustrated using a Lambda function to start an asynchronous job (media transcription to text), and the use of another Lambda function to pass a notification to the user that the transcription was complete. Both Lambda functions are triggered by an object being created in S3 buckets. One bucket is used for the input audio file, the second is used by [Amazon Transcribe](https://aws.amazon.com/transcribe/) to write the output text file.

### Demo 4

This demo illustrated using PowerShell-based Lambda functions in a [Amazon Step Functions]() workflow, to simulate a content approval system (for example, a user wanting to send a tweet must first send it for approval). The approval workflow consists of automated and manual steps. The manual step can take an indeterminate period of time (a human must perform the final approve/reject step on the content) so the workflow uses a continuation token and pauses while waiting for the final human approval, which is done by clicking generated links in an email. Once the user clicks the appropriate link the workflow 'wakes up' and performs the final task in the workflow to notify the original submitter of the decision.

The demo also illustrates invoking another Lambda function from within a Lambda - in this case to obtain the callback urls to place into the approve/reject email. This is done using the [sfn-callback-urls](https://serverlessrepo.aws.amazon.com/applications/arn:aws:serverlessrepo:us-east-2:866918431004:applications~sfn-callback-urls) serverless application available from the [AWS Serverless Application Repository](https://serverlessrepo.aws.amazon.com/applications) to generate the approve/reject urls containing the continuation token.
