Get-Module #checks module ehich are present in ISE memory

Get-Module -ListAvailable # checks module ehich are present in 3 locations.

$env:PSModulePath #Shows module stored paths

Find-Module -Name PackageManagement  # searches the module in PSGallery And install it.

Get-DscResource|Measure-Object  #to fetch DSC resources BY default 23 are available.


 Get-CimInstance

Get-CimInstance -namespace root/microsoft/windows -ClassName __NAMESPACE
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_* | fw
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_DSCmetaconfiguration | select  -ExpandProperty "cimclassproperties"
get-cimclass -Namespace root/microsoft/windows/DesiredStateConfiguration -ClassName MSFT_DSCLOcalConfigurationmanager

Get-DscLocalConfigurationManager

Get-DscResource -Name file -Syntax
========================================================================================================
#configuration for creating file with content on localhost

configuration createfile

{ 
        Import-Module -name PSDesiredStateConfiguration

        Node localhost
 
            {
                 File RKfile 
                        {
                            DestinationPath = "C:\DSC\RK.txt"
  
                            Contents = "HIII welcome"
  
          
                         }
 
             }
 }




 createfile #after running this it creates localhost.mof 


 #to run dscconfiguration -wait to get result immediatly & -verbose to see backend working

 Start-DscConfiguration -Path "C:\Users\Administrator\createfile" -Wait -Verbose


 ===========================================================================================================
 #create configuration for local computer with adding dependency of folder for txt file.


 configuration URH

    { Import-Module -name PSDesiredStateConfiguration

                        Node localhost
 
                               {
                                     File HKfile 
                                          {
                                             DestinationPath = "C:\URBinhacked\HK.txt"
  
                                                Contents = "U R BIN HACKED"
    
                                                Dependson = "[File]URBinhacked"
         
                                             }
   

                                      File URBinhacked
            
                                             { DestinationPath = "C:\URBinhacked"

                                                  Type= "Directory"
                                                 }

                                      }
 }






 ==================================================================================================
 # running configuration on remote computer

 #credential
 $credential=Get-Credential

 # create cimsession option similar to PSsessionoption
 $CSO = New-CimSessionOption -SkipCACheck -SkipCNCheck -SkipRevocationCheck -UseSsl

 $CS=New-CimSession -ComputerName Win16-ntms -Credential $credential -SessionOption $CSO 

configuration URH
{ Import-Module -name PSDesiredStateConfiguration

 Node win16-ntms
 
           {
                 File HKfile 
                  {
                 DestinationPath = "C:\URBinhacked\HK.txt"
  
                 Contents = "U R BIN HACKED"
    
                     Dependson = "[File]URBinhacked"
         
                     }
   

             File URBinhacked

            { DestinationPath = "C:\URBinhacked"

                Type= "Directory"
                }

            }
 }
 
 #run configuration to create mof file
 URH



 Start-DscConfiguration -Path "C:\Users\Administrator\URH"  -CimSession $CS -Wait -Verbose


 ===============================================================================================================

 $MyData =
@{
    AllNodes =
    @(
        @{
            NodeName           = “*”
            LogPath            = “C:\Logs”
        },
        @{
            NodeName = “win16-ntms”
            SiteContents = “C:\Site1”
            SiteName = “Website1”
        },
        @{
            NodeName = “localhost”;
            SiteContents = “C:\Site2”
            SiteName = “Website2”
        }
    );
    NonNodeData =
    @{
        ConfigFileContents = (Get-Content C:\Config.xml).ToString()
     }
}

cls

find-module -name xWebAdministration | Install-Module

Get-DscResource -Module xWebAdministration


configuration WebsiteConfig
{
    Import-DscResource -ModuleName xWebAdministration -Name MSFT_xWebsite
    node $AllNodes.NodeName
    {
        xWebsite Site
        {
            Name         = $Node.SiteName
            PhysicalPath = $Node.SiteContents
            Ensure       = “Present”
        }
        File ConfigFile
        {
            DestinationPath = $Node.SiteContents + “\\config.xml”
            Contents = $ConfigurationData.NonNodeData.ConfigFileContents
        }
    }
}

 WebsiteConfig -ConfigurationData $MyData


===========================================================================================================










