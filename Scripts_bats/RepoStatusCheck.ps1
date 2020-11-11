$folder = get-childitem -path yourpathhere
$msg = "powershell testing"

foreach($d in $folder){
    If ((Get-Item $d.PSPath) -is [System.IO.DirectoryInfo]){
        Set-Location $d.PSPath
        $find_git = dir -Path $d.PSPath -Hidden -filter .git
        If ($find_git ){
            $d.fullname
            ""
            git status
            ""
        }
    }
}