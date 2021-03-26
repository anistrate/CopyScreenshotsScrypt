    $watcher = New-Object System.IO.FileSystemWatcher
    $watcher.Path = "D:\Things that can fuck off\test"
    $watcher.Filter = "*.*"
    $watcher.IncludeSubdirectories = $true
    $watcher.EnableRaisingEvents = $true 

    $action = { $path = $Event.SourceEventArgs.FullPath
                $changeType = $Event.SourceEventArgs.ChangeType
                $logline = "$(Get-Date), $changeType, $path"
                Add-content "D:\log.txt" -value $logline
              }

    Register-ObjectEvent $watcher "Created" -Action $action

    while ($true) {sleep 5}