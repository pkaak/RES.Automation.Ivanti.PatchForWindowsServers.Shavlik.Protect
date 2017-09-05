# Patch Deploy - Wait
# for Ivanti Patch for Windows (Servers)
# version 1.0
#
# Wait till patches are deployed on endpoint / Machinegroup.
# Needs Patch Deploy Guid!
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$uid ="d4916141-e485-4a7c-bceb-2def62987e8f"

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

    wait-PatchDeploy -uid $uid

    # return value
    
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

