Enable-PSRemoting

$Credential = $host.ui.PromptForCredential("domain login", "Please enter your password.", "domain\mcevallo", "NetBiosUserName")


#Prod
Invoke-Command -ComputerName adc01lri -Credential $Credential {
    Get-IshTypeFieldDefinition -IshSession (New-IshSession -WsBaseUrl "https://ccms.us.domain.ps1.com/infosharews" -PSCredential "Martin Cevallos") -TriDKXmlSetupFilePath "C:\InfoShare\App\Database\Common\DatabaseIndependent\Examples\Full-Export\exportInfoshare_result.xml"
} | Out-GridView
#Int
Invoke-Command -ComputerName adc01eam -Credential $Credential {
    Get-IshTypeFieldDefinition -IshSession (New-IshSession -WsBaseUrl "https://ccms-int.us.domain.ps1.com/infosharews" -PSCredential "Martin Cevallos") -TriDKXmlSetupFilePath "C:\InfoShare\App\Database\Common\DatabaseIndependent\Examples\Full-Export\exportInfoshare_result.xml"
} | Out-GridView
#Dev
Invoke-Command -ComputerName adc01lrr -Credential $Credential {
    Get-IshTypeFieldDefinition -IshSession (New-IshSession -WsBaseUrl "https://ccms-dev.us.domain.com/infosharews" -PSCredential "Martin Cevallos") -TriDKXmlSetupFilePath "C:\InfoShare\App\Database\Common\DatabaseIndependent\Examples\Full-Export\exportInfoshare_result.xml"
} | Out-GridView

