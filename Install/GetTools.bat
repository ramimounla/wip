@PowerShell.exe -ExecutionPolicy RemoteSigned -Command "Invoke-Expression -Command ((Get-Content -Path '%~f0' | Select-Object -Skip 2) -join [environment]::NewLine)"
@exit /b %Errorlevel%
$currentFolder = Get-Location
cd $currentFolder
$sourceNugetExe = "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe"
$targetNugetExe = ".\nuget.exe"
Remove-Item .\Tools -Force -Recurse -ErrorAction Ignore
Invoke-WebRequest $sourceNugetExe -OutFile $targetNugetExe
Set-Alias nuget $targetNugetExe -Scope Global -Verbose

##
##Specify the NuGet package source
##
$nugetPackageSource = "https://api.nuget.org/v3/index.json"

##
##Download XRM Tooling PowerShell cmdlets
##
./nuget install -source $nugetPackageSource Microsoft.CrmSdk.XrmTooling.CrmConnector.PowerShell -O .\Tools
md .\Tools\XRMToolingPowerShell
$cmdletFolder = Get-ChildItem ./Tools | Where-Object {$_.Name -match 'Microsoft.CrmSdk.XrmTooling.CrmConnector.PowerShell.'}
move .\Tools\$cmdletFolder\tools\*.* .\Tools\XRMToolingPowerShell
Remove-Item .\Tools\$cmdletFolder -Force -Recurse

##
##Remove NuGet.exe
##
Remove-Item nuget.exe