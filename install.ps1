$Response = Invoke-WebRequest -Uri "https://chezmoi.io/get.ps1"
$InstallScript = [System.Text.Encoding]::UTF8.GetString($Response.Content)

$params = "-BinDir $HOME/.local/bin"
Invoke-Expression $InstallScript
