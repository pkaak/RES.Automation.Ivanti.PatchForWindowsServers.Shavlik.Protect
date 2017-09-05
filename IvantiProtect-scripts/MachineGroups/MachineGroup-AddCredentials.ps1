# Machine Group - Add Credemtials
# for Ivanti Patch for Windows (Servers)
# version 1.0
#
# Add credentials to a machinegroups
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$MGroupName = "Automation1"
$CredentialFriendlyName = "Administrator"   # credentials should exists already in the Ivanti Console with a friendly name.

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

    Set-MachineGroupCredential -Name $Mgroupname -CredentialFriendlyName $CredentialFriendlyName
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

