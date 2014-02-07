$error.clear();
Set-StrictMode -Version:Latest
$GLOBAL:ErrorActionPreference               = "Stop"

$my_fullname        = ( $MyInvocation.MyCommand.Definition )
$my_dir             = ( Split-Path $my_fullname )

. "$($my_fullname).vars.ps1"
. "$($my_dir)\directory_info_prepared_for_strike.ps1"
. "$($my_dir)\nuke_directory.ps1"
. "$($my_dir)\nuke_directory_contents.ps1"
. "$($my_dir)\nuke_file.ps1"
. "$($my_dir)\nuke_file_strategy.ps1"
. "$($my_dir)\set_directory_read_only_false.ps1"


<#
TODO:  loop calls to nuke_directory.  If everything was not nuked, but something was nuked, call nuke_directory again.  Do until directory is nuked or nothing inside of the directory was nuked....

TODO:  write-debug to write-debug

TODO:  $SCRIPT:files_in_use -- remove files from this list if they are subsequently deleted

TODO:  function wrapper around $SCRIPT:files_in_use
#>