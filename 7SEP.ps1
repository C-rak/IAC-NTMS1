===================================PS remoting=======================================================

Get-Command -Verb test
 Get-Help Enter-PSSession -Online

Disable-PSRemoting -
Enable-PSRemoting -Verbose

Enter-PSSession -ComputerName win16-ntms -Port 5986 -UseSSL -SessionOption $SkipCA -Credential $credt

=================================================================================================================================================
# to create HTTPS port in Listeners 

Enable-psremoting

New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -Name "Windows Remote Management (HTTPS-In)" -Profile Any -LocalPort 5986 -Protocol TCP

$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName "DESKTOP-MKOHOM6"

Export-Certificate  -Cert $Cert -FilePath "C:\Temp"

New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint –Force

Set-Item wsman:\localhost\Client\TrustedHosts -Value 192.168.1.52 -Concatenate -Force

Set-NetConnectionProfile -NetworkCategory Private





#TO skip certificate check

$SkipCA=New-PSSessionOption -SkipCACheck -SkipCNCheck





=============================================================================================================================

$pssession= New-PSSession -ComputerName win16-ntms -Credential $credt -UseSSL -SessionOption $SkipCA
Get-PSSession

Enter-PSSession -Name session3
=============================================================================================================================

#create the pscredential 

$user="administrator"
$pass="ntms@123456"| ConvertTo-SecureString -AsPlainText -Force

$cred=New-Object -TypeName "System.Management.Automation.PSCredential" -ArgumentList $user,$pass
Get-Help *credential* -ShowWindow


$credt|gm





=============================To check services through invoke-command using csv===============================================================


#import computer csv file

$computers=import-csv C:\computer.csv

#import service csv file

$services = import-csv C:\services.csv

#connect to one computer

foreach($comp in $computers)

{
    $username = $comp.username
    $password = $comp.password | ConvertTo-SecureString -AsPlainText -Force

    $credential = New-Object -TypeName System.Management.Automation.PSCredential $username,$password

    
    
        test-connection -ComputerName $comp.computername -ErrorVariable EV -ErrorAction SilentlyContinue -Count 1 |out-null

        If($EV -ne $null)
        {
            "not able to reach to $($comp.computername)" | out-file C:\error.log -Append
        
        }
        else
        {
            $pssessionoption = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck

             #Invoke-Command -ComputerName $comp

             $compcompliancestatus=Invoke-Command -ComputerName $comp.computername -Credential $credential -Port 5986 -UseSSL -SessionOption $pssessionoption -ScriptBlock {
        
               $serviceoutput= $using:services | select @{l="name";e={$_.servicename}} |  Get-Service | ?{$_.status -eq "Running"} | Measure-Object

               if( $serviceoutput.count -gt 0)
               {
                    $compliancestatus ="Noncompliance"
               
               }
               else
               {
                       $compliancestatus ="compliance"
               
               }
        
                # check the status of service


                #if any of the services status is running , then noncompliance 
             
                $compliancestatus
             
             
             
             }

           
           $compstatus = [pscustomobject]@{name=$comp.computername;compliancestatus=$compcompliancestatus }
           
           $compstatus  | Export-Csv C:\computercompliancestatus.csv -Append
        
        
        }

  

}
# give output to csv file

Get-Help Test-Connection -Online

=============================To check services through invoke=======================


#import computer csv file

$computers=import-csv C:\computer.csv

#import service csv file

$services = import-csv C:\services.csv

#connect to one computer

foreach($comp in $computers)

{
    $username = $comp.username
    $password = $comp.password | ConvertTo-SecureString -AsPlainText -Force

    $credential = New-Object -TypeName System.Management.Automation.PSCredential $username,$password

    
    
        test-connection -ComputerName $comp.computername -ErrorVariable EV -ErrorAction SilentlyContinue -Count 1 |out-null

        If($EV -ne $null)
        {
            "not able to reach to $($comp.computername)" | out-file C:\error.log -Append
        
        }
        else
        {
            $pssessionoption = New-PSSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck

             #Invoke-Command -ComputerName $comp

             $compcompliancestatus=Invoke-Command -ComputerName $comp.computername -Credential $credential -Port 5986 -UseSSL -SessionOption $pssessionoption -ScriptBlock {
        
               $serviceoutput= $using:services | select @{l="name";e={$_.servicename}} |  Get-Service | ?{$_.status -eq "Running"} | select name
               
               $servicecount = $serviceoutput | Measure-Object

               if( $servicecount.count -gt 0)
               {
                    $compliancestatus ="Noncompliance"
               
               }
               else
               {
                       $compliancestatus ="compliance"
               
               }
        
                # check the status of service


                #if any of the services status is running , then noncompliance 
             
                $compliance = [pscustomobject]@{computername=$env:computername;compstatus=$compliancestatus;services=$serviceoutput}
             
                $compliance
             
             }

           
           #$compstatus = [pscustomobject]@{name=$comp.computername;compliancestatus=$compcompliancestatus }
           
           $compcompliancestatus  | Export-Csv C:\computercompliancestatus.csv -Append
        
        
        }

  

}
# give output to csv file

Get-Help Test-Connection -Online












