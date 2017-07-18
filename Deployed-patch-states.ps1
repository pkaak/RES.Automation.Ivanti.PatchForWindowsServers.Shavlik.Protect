# Set variables
$uid = "0ac0f099-5bf1-451c-ac39-2a05f755601e"

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
    # endpointname;bulletin;kb;overall state;status description;start date;end date
    
    # Count returns and reset result
    $max = $patchdeploy.count-1
    $result = ""

    for ($count=0; $count -le $max; $count++) {
        $maxpatchcount = $patchdeploy[$count].patchstates.count - 1
        for ($patchcount=0; $patchcount -le $maxpatchcount; $patchcount++) {

            if ($count -eq 0 -and $patchcount -eq 0) {
                $result = $patchdeploy.Name +";"+ $patchdeploy[$count].patchstates[$patchcount].bulletin +";"+ $patchdeploy[$count].patchstates[$patchcount].kb +";"+ $patchdeploy[$count].patchstates[$patchcount].OverallState +";"+ $patchdeploy[$count].patchstates[$patchcount].statusdescription +";"+ $patchdeploy[$count].patchstates[$patchcount].startedon +";"+ $patchdeploy[$count].patchstates[$patchcount].lastupdated
            }
            else {
                $result = $result + "|" + $patchdeploy.Name +";"+ $patchdeploy[$count].patchstates[$patchcount].bulletin +";"+ $patchdeploy[$count].patchstates[$patchcount].kb +";"+ $patchdeploy[$count].patchstates[$patchcount].OverallState +";"+ $patchdeploy[$count].patchstates[$patchcount].statusdescription +";"+ $patchdeploy[$count].patchstates[$patchcount].startedon +";"+ $patchdeploy[$count].patchstates[$patchcount].lastupdated
            } 
        }
        
    }

    #show result
    $result
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

