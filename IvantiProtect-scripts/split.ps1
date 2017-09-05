# split string so import-module information is filtered out
# this is done by filtering everything before <split> within the string

$input = "string1<split>string2"
$input -split "<split>" | select -Last 1