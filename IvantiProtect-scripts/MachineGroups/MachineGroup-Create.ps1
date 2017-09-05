# Machine Group - Create
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Creates a machine group
# v2.0 (september 2017) - Added option to give a path (folder) to create machinegroup in
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$MGroupName = "$[Machine Group name]"
$MGroupDescription = "$[Machine Group Description]"
$MGPath = "$[Machine Group Path]"

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

    Add-MachineGroup -Name $mgroupname -Description $mgroupdescription -path $MGPath
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}