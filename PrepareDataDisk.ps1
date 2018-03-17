$disk = Get-Disk  | ? {$_.PartitionStyle -eq "Raw"}
$disk | Initialize-Disk 
$partition = $disk | New-Partition -UseMaximumSize -AssignDriveLetter 
$partition | Format-Volume -FileSystem NTFS
git clone "https://github.com/MicrosoftLearning/20532-DevelopingMicrosoftAzureSolutions" F:\git
Copy-Item -Path 'F:\git\Allfiles\dotnet\Mod*' -Destination 'F:\' -Recurse