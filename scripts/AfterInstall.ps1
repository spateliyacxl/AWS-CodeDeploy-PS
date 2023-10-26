
#CodeDeployment Application Deployment Script

 
Start-Transcript -Path C:\WorkspaceforLegacyBridgeApp\Code_Deployment.log -Append

Write-Host "Deployment Started on $env:DEPLOYMENT_GROUP_NAME"

if ( $env:DEPLOYMENT_GROUP_NAME -imatch "on-prem-deployment-2") {


    Write-Host "Deployment - Copy new version of the application WAR file in the Tomcat Webapp directory"

    $ArtifactsDir = "C:\WorkspaceforLegacyBridgeApp\Artifacts\OutboundEmailLegacyBridge.war"
    $WebAppDir = "C:\WorkspaceforLegacyBridgeApp\apache-tomcat-dev\webapps\OutboundEmailLegacyBridge.war"

    Copy-Item -Path $ArtifactsDir -Destination $WebAppDir
    
    Write-Host "Start Tomcat Service"

    start-service -Name tomcatservice-dev

}

Write-Host "Deployment Started on $env:DEPLOYMENT_GROUP_NAME"

if ( $env:DEPLOYMENT_GROUP_NAME -imatch "fp-ss-fm-eo-outboundemail-legacyBridge-deployment-group-qa") {


    Write-Host "Deployment - Copy new version of the application WAR file in the Tomcat Webapp directory"

    $ArtifactsDir = "C:\WorkspaceforLegacyBridgeApp\Artifacts\OutboundEmailLegacyBridge.war"
    $WebAppDir = "C:\WorkspaceforLegacyBridgeApp\apache-tomcat-qa\webapps\OutboundEmailLegacyBridge.war"

    Copy-Item -Path $ArtifactsDir -Destination $WebAppDir
    
    Write-Host "Start Tomcat Service"

    start-service -Name tomcatservice-qa


}
 
Stop-Transcript