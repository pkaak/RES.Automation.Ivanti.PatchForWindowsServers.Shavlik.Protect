# Patch Scan Endpoint - Start scan
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Start a patch scan at an endpoint
# v2.0 (september 2017) - Option added to use a scantemplate. If empty it reverts to default.
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$Endpointname ="Windows7User"
$credentialFriendlyName = "administrator"
$TemplateName = ""

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

    $patchscan = Start-PatchScan -CredentialFriendlyName $credentialFriendlyName -EndpointNames $Endpointname -TemplateName $TemplateName
    
    # Show UID
    $patchscan.Uid.guid

}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

