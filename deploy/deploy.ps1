Write-Host 'Hello world'


#Run Setup Security Protocal for TLS 1.2 - Required for CDS\XRM 9.x + 
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12

# Load the module.
$env:PSModulePath = (Resolve-Path .).Path + ";" + $env:PSModulePath
Import-Module 'Microsoft.Xrm.Tooling.CrmConnector.PowerShell' -Verbose


Write-Host 'Update 1'

$user = "ramim@d365nz4.onmicrosoft.com"
$password = "Focus123"
$cred = New-Object System.Management.Automation.PSCredential ($user, (ConvertTo-SecureString $password –ASPlainText –Force))

$connectionhost = "https://admin.service.crm6.dynamics.com"
$instance = "https://d365nz4.crm6.dynamics.com"
$organisation = "org9e4a5619"

#$MyBackupInfo = New-CrmBackupInfo -InstanceId "1a60748c-a742-4182-befe-03c11e0de89e" -Label “Focus DevOps Backup” -IsAzureBackup 0 -Notes “A backups to check if it works”
#Set-ExecutionPolicy –ExecutionPolicy RemoteSigned –Scope CurrentUser
#Install-Module Microsoft.Xrm.Data.PowerShell -Scope CurrentUser
Import-Module Microsoft.Xrm.Data.Powershell
Import-Module Microsoft.Xrm.Tooling.CrmConnector.PowerShell

#$connection = Get-CrmConnection -InteractiveMode

$connectionString = "AuthType=Office365;Username=ramim@d365nz4.onmicrosoft.com;Password=Focus123;Url=https://d365nz4.crm6.dynamics.com"

$connection =  Get-CrmConnection -ConnectionString $connectionString
# -Credential $credentials -ServerUrl $instance -OrganizationName $organisation

#$invocation = (Get-Variable MyInvocation).Value
#$directorypath = Split-Path $invocation.MyCommand.Path
#. $($directorypath + '\RegisterXrmTooling')

Write-Host 'Update 3'
$filePath = $directorypath + '\Sample_unmanaged.zip'

Write-Host $filePath

#Export-CrmSolution "Sample" -conn $connection
Import-CrmSolution -SolutionFilePath 'C:\Projects\agent\_work\r1\a\_ramimounla_wip\deploy\Sample_unmanaged.zip' -conn $connection #-PublishChanges  

