# Set variables
# use $filterCreater = "All" to get all MachineGroups
$MGroupName = "PS-Test"
$Endpointname ="Windows7User"
$CredentialFriendlyName = "Administrator"
$EndpointNote = "Dit is een test2"

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

    Add-MachineGroupItem -EndpointNames $Endpointname -Name $MGroupName -CredentialFriendlyName $CredentialFriendlyName -Note $EndpointNote
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

