$disk = Get-Disk  | ? {$_.PartitionStyle -eq "Raw"}
$disk | Initialize-Disk 
$partition = $disk | New-Partition -UseMaximumSize -AssignDriveLetter 
$partition | Format-Volume -FileSystem NTFS
git clone "https://github.com/MicrosoftLearning/20532-DevelopingMicrosoftAzureSolutions" c:\LabSource
Copy-Item -Path 'C:\git\Allfiles\dotnet\Mod*' -Destination 'F:\' -Recurse
Copy-Item -Path '.\RefreshLab.ps1' -Destination 'c:\RefreshLab.ps1'
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument '-File "c:\RefreshLab.ps1"'
$trigger = New-ScheduledTaskTrigger -AtStartup
$user = New-ScheduledTaskPrincipal -UserId "System"
Register-ScheduledTask -Action $action -Trigger $trigger -User "System" -TaskName "UpdateLabFiles" -Description "Update all lab files"