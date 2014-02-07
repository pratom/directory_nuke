function directory_info_prepared_for_strike
{
    [cmdletbinding()] Param ( [Parameter(Mandatory=$true)][string]        $dir_to_nuke )

    $dir_to_remove_info = ( New-Object System.IO.DirectoryInfo $dir_to_nuke )

    if ( ( $dir_to_remove_info.Exists ) -eq $true )
    {
       write-debug "     Yes, the directory does exist."
       $null = (set_directory_read_only_false $dir_to_remove_info.FullName)   
    }
    return($dir_to_remove_info)
}