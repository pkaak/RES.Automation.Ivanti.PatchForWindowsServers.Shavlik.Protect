﻿# Set variables
$MGroupName = "PS-Test"
$credentialFriendlyName = "administrator"


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

    $patchscan = Start-PatchScan -CredentialFriendlyName $credentialFriendlyName -MachineGroups $MGroupName
    
    # Show UID
    $patchscan.Uid

}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

