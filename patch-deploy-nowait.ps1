# Set variables
$uid ="bc6343b0-fecc-403e-b14e-e60141b77018"

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

    $patchdeploy = Start-PatchDeploy -scanuid $uid

    # return value
    $patchdeploy.uid.Guid
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

