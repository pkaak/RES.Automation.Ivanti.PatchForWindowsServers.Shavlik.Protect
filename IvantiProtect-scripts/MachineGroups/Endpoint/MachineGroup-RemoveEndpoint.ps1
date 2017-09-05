# Machine Group - Remove endpoint
# for Ivanti Patch for Windows (Servers)
# version 1.0
#
# Delete endpoint from machinegroup
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$MGroupName = "PS-Test"
$Endpointname ="Windows7User"

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

    Remove-MachineGroupItem -EndpointNames $Endpointname -Name $MGroupName
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

