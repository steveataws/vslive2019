New-AWSPowerShellLambdaPackage -ScriptPath ./RSS2Speech.ps1 -OutputPackage ./build/RSS2Speech.zip

dotnet lambda deploy-serverless
