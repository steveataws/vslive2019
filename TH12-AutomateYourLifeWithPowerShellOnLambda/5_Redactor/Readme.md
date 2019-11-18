# Redactor Demo

This demo illustrates having a Lambda function invoked as a result of a call to a REST API through [Amazon API Gateway](https://aws.amazon.com/api-gateway/). 

The sample Lambda function uses [Amazon Comprehend](https://aws.amazon.com/comprehend/) to inspect the text sent through the body of a POST call. Comprehend then detects the language and removes all proper nouns and nouns from the string of text and replaces each word with an array of a solid block unicode characters numbering the same as the the length of the word.

To deploy the demo run the [build_and_deploy.ps1](./build_and_deploy.ps1) script. 
