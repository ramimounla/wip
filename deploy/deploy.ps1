Write-Host 'Hello world'


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

Write-Host 'Update 1'


#Export-CrmSolution "Sample" -conn $connection
Import-CrmSolution -SolutionFilePath $($directorypath + '\Sample_unmanaged.zip') -conn $connection #-PublishChanges  

