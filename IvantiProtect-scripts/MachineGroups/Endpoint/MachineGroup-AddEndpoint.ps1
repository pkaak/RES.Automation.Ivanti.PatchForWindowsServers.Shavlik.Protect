# Machine Group - Add endpoint
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Add endpoint to machinegroup
# v2.0 (september 2017) - Added option to set option to exclude endpoint from scans
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$MGroupName = "Automation1"
$Endpointname ="Windows7User"
$CredentialFriendlyName = "Administrator"
$EndpointNote = "Dit is een test2"
$Exclude = "No"

# Import API module
Import-Module STProtect -force

# create breakline to filter results
# needed because import-module STProtect ALWAYS gives output whatever I try to ignore the text
# Please fix this Shavlik
write-host "<break>"

#check if module is loaded else error out
if (Get-Module -ListAvailable -Name STProtect) {

    # Module STProtect is loaded and available to use
    # Do action!

    if ($Exclude -match "Yes") {
        Add-MachineGroupItem -EndpointNames $Endpointname -Name $MGroupName -CredentialFriendlyName $CredentialFriendlyName -Note $EndpointNote -Exclude
    } else {
        Add-MachineGroupItem -EndpointNames $Endpointname -Name $MGroupName -CredentialFriendlyName $CredentialFriendlyName -Note $EndpointNote
    }
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

