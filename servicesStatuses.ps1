Enable-PSRemoting

$Credential = $host.ui.PromptForCredential("domain login", "Please enter your password.", "domain\mcevallo", "NetBiosUserName")

# prod services
Invoke-Command -ComputerName host, host, etc -Credential $Credential {Get-Service -DisplayName "Tri*" -Verbose} |Select-Object Name, Status, StartType, PSComputerName| Out-GridView

# int services
Invoke-Command -ComputerName host, host, host -Credential $Credential {Get-Service -DisplayName "Tri*"} | Select-Object Name, Status, StartType, PSComputerName| Out-GridView

# dev services
Invoke-Command -ComputerName host, host, host -Credential $Credential {Get-Service -DisplayName "Tri*"} | Select-Object Name, Status, StartType, PSComputerName| Out-GridView

Enter-PSSession -ComputerName host -Credential $Credential
