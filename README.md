# Powershell_helpers
Helpful Powershell Scripts


This repository contains miscellaneous powershell scripts that are helpful as well as .bat files to execute.

RepoStatusCheck will loop through a path finding directories, checking for git repositories, and return the status of the repository.

RepoCommitAll will loop through a path finding directories, checking for git repositories, and add, commit, and push all changes with a commit message from user input prompt.

BackupFileFinder will find and identify any files with "backup, original, or - copy" in the file name.

DirFileComparison will compare two directories and identify (by filename) any changes, deletions, or additions by filename/path. This is accomplished 
by comparing the file hashes from each directory.

Watcher_example is an example of creating a directory "watcher" for any changes in the directory and write a log file.

Az_PullRequests_Example is an example of how to create and complete pull requests through Azure rest api. if($args -eq "branch name") will need to be updated based upon your branching strategy/naming convention.

winForm is an example of a simple windows form.
