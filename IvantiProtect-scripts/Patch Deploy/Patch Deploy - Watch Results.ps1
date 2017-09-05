# Patch Deploy - Watch / Results
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Watch deployment / View deployment results
# v2.0 (september 2017) - View results on end
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

    $patchdeploy = watch-PatchDeploy -uid $uid

    # Return info, output for ROID
    # Seperate columns by ;
    # Seperate rows by |
    # endpoint;domain;IP Address;Completed Patches;Overall State;Last Updated;errorcode;statusdescription
    
    # Count returns and reset result
    $max = $patchdeploy.count-1
    $result = ""

    for ($count=0; $count -le $max; $count++) {
        if ($count -eq 0) {
            $result = $patchdeploy[$count].Name +";"+ $patchdeploy[$count].Domain +";"+ $patchdeploy[$count].Address +";"+$patchdeploy[$count].CompletedPatches +";"+  $patchdeploy[$count].OverallState +";"+ $patchdeploy[$count].LastUpdated +";"+ $patchdeploy[$count].Errorcode +";"+ $patchdeploy[$count].StatusDescription
        }
        else {
            $result = $result +"|"+ $patchdeploy[$count].Name +";"+ $patchdeploy[$count].Domain +";"+ $patchdeploy[$count].Address +";"+$patchdeploy[$count].CompletedPatches +";"+  $patchdeploy[$count].OverallState +";"+ $patchdeploy[$count].LastUpdated +";"+ $patchdeploy[$count].Errorcode +";"+ $patchdeploy[$count].StatusDescription
        }
    }
    $result
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

