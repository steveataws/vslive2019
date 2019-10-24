# Visual Studio Live! San Diego, 2019, Demo Materials

This repository contains the decks and code samples from my sessions at the Visual Studio Live! conference in San Diego during October 2019.

## W17 - Serverless .NET on AWS

This session presented a 100% serverless, end to end demo application named CloudMosaic. The folder in this repository contains the slide deck that was used in the presentation. The code, along with follow-along-yourself workshop style documentation, can be found in [this GitHub repository](https://github.com/aws-samples/cloudmosaic-dotnet).

## TH12 - Automate your life with PowerShell on AWS Lambda

This session discussed PowerShell on AWS and particularly it's use in serverless functions in [AWS Lambda](https://aws.amazon.com/lambda/). The folder contains the deck and the code for the four demos that illustrated different ways to invoke and use Lambda functions. The initial live-coded 'hello world' demo that was used to introduce the [AWSLambdaPSCore](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-lambda.html) tools and show how to code, deploy and invoke serverless functions written using PowerShell in AWS Lambda is not included.

### Demo 1 - Image tagging

This demo illustrated having a Lambda function be invoked as a result of an event, in this case when a new object is created, or an existing object updated, in an [Amazon S3](https://aws.amazon.com/s3/) bucket. The sample also illustrates two options for deployment - using the AWSLambdaPSCore tools, or creating and deploying a serverless template using the [AWS Lambda extensions for the dotnet CLI](https://github.com/aws/aws-extensions-for-dotnet-cli).

[Demo readme](./TH12-AutomateYourLifeWithPowerShellOnLambda/1_ImageTagger/Readme.md)

### Demo - Convert RSS Feed to Speech

This demo illustrated how [AWS Lambda](https://aws.amazon.com/lambda) functions can be fronted by a web API, hosted in Amazon API Gateway. The Lambda function takes the url of a RSS feed and an optional count of the number of posts to convert, and uses [Amazon Polly](https://aws.amazon.com/polly) to convert the text of the posts to audio files. The audio files are output to an [Amazon S3](https://aws.amazon.com/s3) bucket and a notification that the file is ready sent to an [Amazon Simple Notification Service (SNS)](https://aws.amazon.com/sns) topic to which an email has been subscribed. The notification includes a presigned url to the S3 object representing the audio file.

[Demo readme](./TH12-AutomateYourLifeWithPowerShellOnLambda/2_RSS2Speech/Readme.md)

### Demo 3 - Transcribe Audio to Text

This demo illustrated using a Lambda function to start an asynchronous job (media transcription to text), and the use of another Lambda function to pass a notification to the user that the transcription was complete. Both Lambda functions are triggered by an object being created in S3 buckets. One bucket is used for the input audio file, the second is used by [Amazon Transcribe](https://aws.amazon.com/transcribe/) to write the output text file.

[Demo readme](./TH12-AutomateYourLifeWithPowerShellOnLambda/3_Transcription/Readme.md)

### Demo 4 - Content Approval Workflow

This demo illustrated using PowerShell-based Lambda functions in a [Amazon Step Functions]() workflow, to simulate a content approval system (for example, a user wanting to send a tweet must first send it for approval). The approval workflow consists of automated and manual steps. The manual step can take an indeterminate period of time (a human must perform the final approve/reject step on the content) so the workflow uses a continuation token and pauses while waiting for the final human approval, which is done by clicking generated links in an email. Once the user clicks the appropriate link the workflow 'wakes up' and performs the final task in the workflow to notify the original submitter of the decision.

[Demo readme](./TH12-AutomateYourLifeWithPowerShellOnLambda/4_ContentApprovalWorkflow/Readme.md)
