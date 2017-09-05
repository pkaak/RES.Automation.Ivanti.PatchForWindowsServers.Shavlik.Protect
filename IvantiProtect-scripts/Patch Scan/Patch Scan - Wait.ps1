# Patch Scan Endpoint - Wait till scan is completed
# for Ivanti Patch for Windows (Servers)
# version 2.0
#
# Wait till patch scan is finished
# v2.0 (september 2017) - Big bug fix. Result display added.
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$uid ="393a7ef5-5dc0-45fa-9c9c-4397d9a5f552"

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

    $waitscan = Wait-PatchScan -uid $uid

    # Return info, output for ROID
    # Seperate columns by ;
    # Seperate rows by |
    # ScanName;Elapsed Time;Expected Machines;Completed Machines;Is Complete
    
    # Count returns and reset result
    $max = $waitscan.count-1
    $result = ""

    for ($count=0; $count -le $max; $count++) {
        if ($count -eq 0) {
            $ElapsedTime = "{0:D2}" -f $waitscan[$count].Elapsed.Hours +":"+ "{0:D2}" -f $waitscan[$count].Elapsed.Minutes +":"+ "{0:D2}" -f $waitscan[$count].Elapsed.Seconds 
            $result = $waitscan[$count].Name +";"+ $ElapsedTime +";"+ $waitscan[$count].ExpectedMachines +";"+ $waitscan[$count].CompletedMachines +";"+ $waitscan[0].IsComplete
        }
        else {
            $ElapsedTime = "{0:D2}" -f $waitscan[$count].Elapsed.Hours +":"+ "{0:D2}" -f $waitscan[$count].Elapsed.Minutes +":"+ "{0:D2}" -f $waitscan[$count].Elapsed.Seconds 
            $result = $result +"|"+ $waitscan[$count].Name +";"+ $ElapsedTime +";"+ $waitscan[$count].ExpectedMachines +";"+ $waitscan[$count].CompletedMachines +";"+ $waitscan[0].IsComplete
        }
    }
    $result
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}