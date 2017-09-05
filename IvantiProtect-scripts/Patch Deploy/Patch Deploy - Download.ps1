# Patch Scan Endpoint - Start scan
# for Ivanti Patch for Windows (Servers)
# version 1.0
#
# Download missing patches - Needs Patch Scan Guid
#
# patrick.kaak@ivanti.com
# @pkaak

# Set variables
$uid ="9173d5f1-634d-40fd-a0ec-0a4a86c6ba0a"

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

    Invoke-DownloadMissingPatches -scanuid $uid

    # there is no feedback from this command even if the scanID cannot be found
}
# module not loaded
 else {
    Write-Host "Module does not exist"
}

