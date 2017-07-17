# Set variables
# use $filterCreater = "All" to get all MachineGroups
$filterCreator = "All"

$return = ""
$firstfound = "False"

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

    $MachineGroups = Get-MachineGroup
    
    # built Return string
    # string contains all machinegroups, seperated with a |
    $Total = $MachineGroups.Count
    for ($count=0;$count -lt $Total; $count++) {
        #Filter Creators
        if ($filterCreator -eq "All") {
            if ($count -eq 0) { $return = $MachineGroups[$count].name }
            else { $return = $return + "|" + $machinegroups[$count].name }
            }
        else {
            if ($filterCreator -eq $MachineGroups[$count].Creator) {
                if ($firstfound -eq "False") { 
                    $return = $MachineGroups[$count].name
                    $firstfound = "True" 
                    }
            else { $return = $return + "|" + $machinegroups[$count].name }
            }
        }
    }

    # echo the returnstring
    $return
 
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

