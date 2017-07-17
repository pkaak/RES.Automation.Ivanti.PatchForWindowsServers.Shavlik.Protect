# Set variables
$uid ="503d7294-9261-4c6f-873e-6212919b5467"

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

