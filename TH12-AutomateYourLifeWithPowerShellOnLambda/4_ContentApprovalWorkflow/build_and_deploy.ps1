New-AWSPowerShellLambdaPackage -ScriptPath ./CheckForUnapprovedWords.ps1 -OutputPackage ./build/CheckForUnapprovedWords.zip
New-AWSPowerShellLambdaPackage -ScriptPath ./SendApprovalEmail.ps1 -OutputPackage ./build/SendApprovalEmail.zip
New-AWSPowerShellLambdaPackage -ScriptPath ./SendConfirmation.ps1 -OutputPackage ./build/SendConfirmation.zip

dotnet lambda deploy-serverless
