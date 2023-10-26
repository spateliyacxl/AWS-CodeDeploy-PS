
#CodeDeployment Before Install Script

Start-Transcript -Path C:\WorkspaceforLegacyBridgeApp\Code_Deployment.log -Append

Write-Host "DEPLOYMENT_GROUP_NAME = $env:DEPLOYMENT_GROUP_NAME"

if ( $env:DEPLOYMENT_GROUP_NAME -imatch "on-prem-deployment-2") {

    Write-Host "Before Deployment - Stopping Tomcat Service & Sleep for 10s"

    Stop-Service -Name tomcatservice

    Start-sleep -s 10

    Write-Host "Cleanup - Remove older veriosn of the application"

    $AppDirectory = "C:\WorkspaceforLegacyBridgeApp\apache-tomcat-dev\webapps"
    
    Get-ChildItem -Path $AppDirectory -Recurse | Where-Object { $_.Name -like 'OutboundEmailLegacyBridge*' } | Remove-Item -Recurse -Force
    
    Remove-Item "C:\WorkspaceforLegacyBridgeApp\Artifacts\OutboundEmailLegacyBridge.war" -Recurse -Force -Confirm:$false

}


Write-Host "DEPLOYMENT_GROUP_NAME = $env:DEPLOYMENT_GROUP_NAME"

if ( $env:DEPLOYMENT_GROUP_NAME -imatch "fp-ss-fm-eo-outboundemail-legacyBridge-deployment-group-qa") {

    Write-Host "Before Deployment - Stopping Tomcat Service & Sleep for 10s"

    Stop-Service -Name tomcatservice

    Start-sleep -s 10

    Write-Host "Cleanup - Remove older veriosn of the application"

    $AppDirectory = "C:\WorkspaceforLegacyBridgeApp\apache-tomcat-qa\webapps"
    
    Get-ChildItem -Path $AppDirectory -Recurse | Where-Object { $_.Name -like 'OutboundEmailLegacyBridge*' } | Remove-Item -Recurse -Force

}

Stop-Transcript
