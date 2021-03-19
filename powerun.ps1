$run=$args[0]

try
{
    switch ( $run )
    {
        ({$run -eq 'e' -or $run -eq 'error'})
        {
            $url = "https://raw.githubusercontent.com/samuelavelino/powerengine/main/games/error/error.ps1"
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        ({$run -eq 't' -or $run -eq 'test'})
        {
            $url = "https://raw.githubusercontent.com/samuelavelino/powerengine/main/games/test/test.ps1"
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        Default
        {
            Write-Output "'$run' command not found." -ForegroundColor Red
        }
    }
}
catch
{
    Write-Host "url: $url" -ForegroundColor Yellow
    Write-Host "$_" -ForegroundColor Red
}
