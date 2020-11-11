# Powershell_helpers
Helpful Powershell Scripts


This repository contains miscellaneous powershell scripts that are helpful as well as .bat files to execute.

RepoStatusCheck will loop through a path finding directories, checking for git repositories, and return the status of the repository.

RepoCommitAll will loop through a path finding directories, checking for git repositories, and add, commit, and push all changes with a commit message from user input prompt.

BackupFileFinder will find and identify any files with "backup, original, or - copy" in the file name.

DirFileComparison will compare two directories and identify (by filename) any changes, deletions, or additions by filename/path. This is accomplished 
by comparing the file hashes from each directory.