#region watcher object

$watcher = New-Object System.IO.FileSystemWatcher

$watcher.IncludeSubdirectories = $true

$watcher.Path = 'your directory to monitor'

$watcher.EnableRaisingEvents = $true

#endregion 

#region action

$action =

    {

        $env:USERNAME

        $path = $event.SourceEventArgs.FullPath

        $changetype = $event.SourceEventArgs.ChangeType

        Add-Content -path "your path to output log path" -value "$path was $changetype at $(get-date)`n"
    }
#endregion

#region modification

Register-ObjectEvent $watcher "Created" -Action $action

Register-ObjectEvent $watcher “Changed” -Action $action

Register-ObjectEvent $watcher “Deleted” -Action $action

Register-ObjectEvent $watcher “Renamed” -Action $action

#endregion