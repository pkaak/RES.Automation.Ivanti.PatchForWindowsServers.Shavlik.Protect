# Patch Deploy - Start (with wait)
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Start a patch deploy on endpoint / Machinegroup.
# Does wait till deploy is finished!
# v2.0: Added option to use a deploymenttemplate
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$uid ="aacb7db0-d34a-42cf-81d5-afa09d2332d4"
$DeploymentTemplate = ""

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

    $patchdeploy = Start-PatchDeploy -scanuid $uid -TemplateName $DeploymentTemplate
    $wait = Wait-PatchDeploy -Uid $patchdeploy.uid.Guid
    

    # return value
    $patchdeploy.uid.Guid
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

