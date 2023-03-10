# =============================================================================================================
# Script:    RVToolsBatchMultipleVCs.ps1
# Version:   1.3
# Date:      November, 2022
# By:        Rob de Veij
# =============================================================================================================

<#
.SYNOPSIS
With this example script you can start the the RVTools export all to xlsx function for multiple vCenter servers.
The output xlsx files will be merged to one xlsx file which will be mailed
	
.DESCRIPTION
With this example script you can start the the RVTools export all to xlsx function for multiple vCenter servers.
The output xlsx files will be merged to one xlsx file which will be mailed


.EXAMPLE
 .\RVToolsBatchMultipleVCs.ps1

#>

# Save current directory
$SaveCurrentDir = (get-location).Path

# Set RVTools path
[string] $RVToolsPath = "C:\Program Files (x86)\Robware\RVTools"

# cd to RVTools directory
set-location $RVToolsPath


# -----------------------------------------------------
# Set parameters for vCenter and start RVTools export
# -----------------------------------------------------
[string] $VCServer = "vsphere.company.com"                                          
[string] $User = "administrator@vsphere.local"                            # or use -passthroughAuth
[string] $EncryptedPassword = "_RVToolsPWDwgahaerhaernaetnatnatnaenaerb=" # use RVToolsPasswordEncryption.exe to encrypt your password
[string] $CsvDir1 = "C:\Temp\RVCSVExport"

# Start cli of RVTools
Write-Host "Start export for vCenter $VCServer" -ForegroundColor DarkYellow
$Arguments = "-u $User -p $EncryptedPassword -s $VCServer -c ExportAll2csv -d $CsvDir1 -f"

Write-Host $Arguments

$Process = Start-Process -FilePath ".\RVTools.exe" -ArgumentList $Arguments -NoNewWindow -Wait -PassThru
exit 1

if($Process.ExitCode -eq -1)
{
    Write-Host "Error: Export failed! RVTools returned exitcode -1, probably a connection error! Script is stopped" -ForegroundColor Red
    exit 1
}

# Back to starting dir
Set-Location $SaveCurrentDir