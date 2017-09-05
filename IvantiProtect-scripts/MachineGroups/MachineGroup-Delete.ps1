# Machine Group - Delete
# for Ivanti Patch for Windows (Servers)
# version 1.0
#
# Delete given machinegroups
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$MGroupName = "$[Machine Group name]"

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

    Remove-MachineGroup -Name $MGroupName -Confirm:$false
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}