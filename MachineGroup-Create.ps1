# Set variables
$MGroupName = "PS Test2"
$MGroupDescription = "PS Test Description"
$MGroupPatch = ""

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

    Add-MachineGroup -Name $mgroupname -Description $mgroupdescription
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

