$SourceDir = Get-ChildItem -Path "SourcePathHere" -recurse | foreach {Get-FileHash -Path $_.FullName}
$CompareDir = get-childitem -Path "ComparisonPathHere" -Recurse | foreach {Get-FileHash -Path $_.FullName}

(Compare-Object -ReferenceObject $SourceDir -DifferenceObject $CompareDir -Property hash -PassThru).Path