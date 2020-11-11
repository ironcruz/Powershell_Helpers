$folder = get-childitem -path "G:\" 
$msg = Read-Host -Prompt "Input commit message"

foreach($d in $folder){
    If ((Get-Item $d.PSPath) -is [System.IO.DirectoryInfo]){
        Set-Location $d.PSPath
        $find_git = dir -Path $d.PSPath -Hidden -filter .git
        If ($find_git ){
            $d.fullname
            ""
            $msg
            git add .
            git commit -m "$msg"
            git push origin DEV
        }
    }
}