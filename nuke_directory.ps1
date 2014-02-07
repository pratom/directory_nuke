<# 
.EXAMPLE
  nuke_directory -dir_to_nuke:'F:\scm_databases\.git\' -names_to_leave:$null
#>
function nuke_directory
{

    [cmdletbinding()]
    Param (
        [Parameter(Mandatory=$true)][string]        $dir_to_nuke
        ,[Parameter(Mandatory=$false)][object[]]    $names_to_leave
        ,[Parameter(Mandatory=$false)] [switch]     $leave_directory
    )

    write-debug "nuke_directory - BEGIN - [$dir_to_nuke]"

    if ( $names_to_leave -eq $null ) { $names_to_leave = @() }
    if ( $leave_directory -eq $null ) { $leave_directory = $false }

    $delete_entired_directory = $true
    if ( $names_to_leave.Count -gt 0 -or  $leave_directory -eq $true ) 
      {  
        $delete_entired_directory = $false
      }

    $dir_to_remove_info = ( directory_info_prepared_for_strike $dir_to_nuke )
    if ($delete_entired_directory -eq $true -and $dir_to_remove_info.Exists -eq $true)
      {
        try 
        {
          write-debug "     Trying to delete the entire directory."
          $dir_to_remove_info.Delete($true)   
        }
        catch 
        { 
          write-debug "    Unable to delete entire directory.  Going to try delete one file at a time."
        }
      }

    $dir_to_remove_info.Refresh()
    if ($dir_to_remove_info.Exists -eq $true)
    {
      $null = (nuke_directory_contents -dir_to_nuke:$dir_to_nuke -names_to_leave:$names_to_leave) 
    }

    $dir_to_remove_info.Refresh()
    if ($delete_entired_directory -eq $true -and $dir_to_remove_info.Exists -eq $true)
    {
      write-debug "     Trying to delete the entire directory."
      $dir_to_remove_info.Delete($true)  
    }

    write-debug "nuke_directory - END - [$dir_to_nuke]"    
}