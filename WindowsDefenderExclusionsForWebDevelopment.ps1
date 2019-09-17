<#
    .SYNOPSIS
        The script will add some exclusion to Windows Defender.
    .DESCRIPTION
        The script will add some exclusion to Windows Defender.
#>

$userPath = $env:USERPROFILE
$paths = New-Object System.Collections.ArrayList
$processes = New-Object System.Collections.ArrayList

$paths.Add('C:\Windows\Microsoft.NET') > $null
$paths.Add('C:\Windows\assembly') > $null
$paths.Add($userPath + '\AppData\Local\Microsoft\VisualStudio') > $null
$paths.Add('C:\ProgramData\Microsoft\VisualStudio\Packages') > $null
$paths.Add('C:\Program Files (x86)\MSBuild') > $null
$paths.Add('C:\Program Files (x86)\Microsoft Visual Studio') > $null
$paths.Add('C:\Program Files (x86)\Microsoft SDKs\NuGetPackages') > $null
$paths.Add('C:\Program Files (x86)\Microsoft SDKs') > $null

$processes.Add('devenv.exe') > $null
$processes.Add('dotnet.exe') > $null
$processes.Add('msbuild.exe') > $null
$processes.Add('node.exe') > $null
$processes.Add('node.js') > $null
$processes.Add('ServiceHub.Host.Node.x86.exe') > $null
$processes.Add('vbcscompiler.exe') > $null
$processes.Add('testhost.exe') > $null
$processes.Add('datacollector.exe') > $null
$processes.Add('CodeCoverage.exe') > $null
$processes.Add('IntelliTrace.exe') > $null

foreach ($exclusion in $paths) 
{
    Add-MpPreference -ExclusionPath $exclusion
}

foreach ($exclusion in $processes)
{
    Add-MpPreference -ExclusionProcess $exclusion
}

Write-Host "All exclusions:"

$prefs = Get-MpPreference
$prefs.ExclusionPath
$prefs.ExclusionProcess

Write-Host ""
Write-Host "done"
