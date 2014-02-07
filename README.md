directory_nuke
==============

powershell module - does everything in its power to delete / remove / nuke a directory and its contents.

# Examples
### Simplest example
```powershell
import-module .\directory_nuke\directory_nuke.psm1
nuke_directory -dir_to_nuke:'F:\scm_databases\.git\'
```

### Wipe the directories contents, leave the directory.
```powershell
import-module .\directory_nuke\directory_nuke.psm1
nuke_directory -dir_to_nuke:'F:\scm_databases\.git\' -$leave_directory
```

### Wipe the directories contents, leave items named .git and .readme.  The directory itself is then necessarily left standing.
```powershell
import-module .\directory_nuke\directory_nuke.psm1
nuke_directory -dir_to_nuke:'F:\scm_databases\' -names_to_leave:@('.git','.readme')
```
