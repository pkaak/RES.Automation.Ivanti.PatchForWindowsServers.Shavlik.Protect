# Set variables
$uid ="6e5acedd-168b-46ad-afe4-e1a9a64cb76d"

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

    $watchscan = Watch-PatchScan -uid $uid

    # Return info, output for ROID
    # Seperate columns by ;
    # Seperate rows by |
    # endpoint;domain;Installed Patches;Missing Patches;Missing SP;Completed on;error number;error discription
    
    # Count returns and reset result
    $max = $watchscan.count-1
    $result = ""

    for ($count=0; $count -le $max; $count++) {
        if ($count -eq 0) {
            $result = $watchscan[$count].Name +";"+ $watchscan[$count].Domain +";"+ $watchscan[$count].InstalledPatches +";"+ $watchscan[$count].MissingPatches +";"+ $watchscan[$count].MissingServicePacks +";"+ $watchscan[$count].CompletedOn +";"+ $watchscan[$count].ErrorNumber +";"+ $watchscan[$count].ErrorDescription
        }
        else {
            $result = $result +"|"+ $watchscan[$count].Name +";"+ $watchscan[$count].Domain +";"+ $watchscan[$count].InstalledPatches +";"+ $watchscan[$count].MissingPatches +";"+ $watchscan[$count].MissingServicePacks +";"+ $watchscan[$count].CompletedOn +";"+ $watchscan[$count].ErrorNumber +";"+ $watchscan[$count].ErrorDescription
        }
    }
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

