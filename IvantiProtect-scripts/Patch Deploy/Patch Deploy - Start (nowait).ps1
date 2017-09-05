# Patch Deploy - Start (no wait)
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Start a patch deploy on endpoint / Machinegroup.
# Does not wait till deploy is finished!
# v2.0: Added option to use a deploymenttemplate
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$uid ="8f435d53-0f35-49b1-9514-6acf3b172ffd"
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

    # return value
    $patchdeploy.uid.Guid
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

