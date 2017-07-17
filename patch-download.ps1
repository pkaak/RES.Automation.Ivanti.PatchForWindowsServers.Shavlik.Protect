# Set variables
$uid ="6e5acedd-168b-46ad-afe4-e1a9FF64cb7d"

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

