New-AWSPowerShellLambdaPackage -ScriptPath ./StartTranscriptionJob.ps1 -OutputPackage ./build/StartTranscriptionJob.zip
New-AWSPowerShellLambdaPackage -ScriptPath ./NotifyTranscriptionComplete.ps1 -OutputPackage ./build/NotifyTranscriptionComplete.zip

dotnet lambda deploy-serverless
