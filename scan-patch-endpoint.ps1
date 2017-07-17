# Set variables
$Endpointname ="Windows7User"
$credentialFriendlyName = "administrator"

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

    $patchscan = Start-PatchScan -CredentialFriendlyName $credentialFriendlyName -EndpointNames $Endpointname | Wait-PatchScan
    $patchdeploy = Start-PatchDeploy –ScanUid ($patchscan.Uid)
    $temp = Wait-PatchDeploy -Uid $patchdeploy.uid.Guid
    $patchdeployGUID = $patchdeploy.uid.Guid
    $patchdeploy = watch-PatchDeploy -uid $patchdeployguid

    # Return info, output for ROID
    # Seperate columns by ;
    # Seperate rows by |
    # patch-guid;endpoint;domain;IP Address;Completed Patches;Overall State;Last Updated;errorcode;statusdescription
    
    # Count returns and reset result
    $max = $patchdeploy.count-1
    $result = ""

    for ($count=0; $count -le $max; $count++) {
        if ($count -eq 0) {
            $result = $patchdeployGUID +";"+ $patchdeploy[$count].Name +";"+ $patchdeploy[$count].Domain +";"+ $patchdeploy[$count].Address +";"+$patchdeploy[$count].CompletedPatches +";"+  $patchdeploy[$count].OverallState +";"+ $patchdeploy[$count].LastUpdated +";"+ $patchdeploy[$count].Errorcode +";"+ $patchdeploy[$count].StatusDescription
        }
        else {
            $result = $result +"|"+ $patchdeployGUID +";"+ $patchdeploy[$count].Name +";"+ $patchdeploy[$count].Domain +";"+ $patchdeploy[$count].Address +";"+$patchdeploy[$count].CompletedPatches +";"+  $patchdeploy[$count].OverallState +";"+ $patchdeploy[$count].LastUpdated +";"+ $patchdeploy[$count].Errorcode +";"+ $patchdeploy[$count].StatusDescription
        }
    }

    #show result
    $result
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

