$folder = get-childitem -path "yourPathHere" 

foreach($d in $folder){
    If ((Get-Item $d.PSPath) -is [System.IO.DirectoryInfo]){
        Set-Location $d.PSPath
        $find_git = dir -Path $d.PSPath -Hidden -filter .git
        If ($find_git ){
            $d.fullname
            ""
            get-childitem -Path $d.PSPath -Recurse -Include ('*.backup*', '*original*', '*- copy*')
            ""
        }
    }
}