<#
http://go.microsoft.com/fwlink/?LinkID=135170

When you are executing a PowerShell script for the first time you may encounter the following error:
filename.ps1 cannot be loaded because running scripts is disabled on this system.

Open a new session as an administrator and type:

PowerShell:
Set-ExecutionPolicy RemoteSigned -force

Command Prompt:
powershell Set-ExecutionPolicy RemoteSigned

#----------------------------------------------------------------------------------------------------
How to run this script:

PowerShell:
[Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; iex ". { $(irm http://bit.ly/ps1run) } test"

Command Prompt:
powershell [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; iex """. { $(irm http://bit.ly/ps1run) } test"""

Local:
powershell [Net.ServicePointManager]::SecurityProtocol=[Net.SecurityProtocolType]::Tls12; .\powerun.ps1 test
#>
#----------------------------------------------------------------------------------------------------

$run=$args[0]

try
{
    switch ( $run )
    {
        ({$run -eq 'e' -or $run -eq 'error'})
        {
            $url = 'https://raw.githubusercontent.com/samuelavelino/powerengine/main/games/error/error.ps1'
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        ({$run -eq 't' -or $run -eq 'test'})
        {
            $url = 'https://raw.githubusercontent.com/samuelavelino/powerengine/main/games/test/test.ps1'
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        ({$run -eq 'pp' -or $run -eq 'powerpaint'})
        {
            $url = 'https://raw.githubusercontent.com/samuelavelino/powerpaint/main/powerpaint.ps1'
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        ({$run -eq 'ppt' -or $run -eq 'powerpainttest'})
        {
            $url = 'https://raw.githubusercontent.com/samuelavelino/powerpaint/test/powerpaint.ps1'
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        ({$run -eq 'ppv1' -or $run -eq 'powerpaintv1'})
        {
            $url = 'https://raw.githubusercontent.com/samuelavelino/powerpaint/version1/powerpaint.ps1'
            iex (New-Object System.Net.WebClient).DownloadString($url)
            Break
        }
        default
        {
            Write-Host "'$run' command not found." -ForegroundColor Red
        }
    }
}
catch
{
    Write-Host "url: $url" -ForegroundColor Yellow
    Write-Host "An error occurred: $_" -ForegroundColor Red
}
