Start-Transcript -Path "c:\Dinesh_Sir_Do_Not_ Delete_This_Folder\history.txt"
Get-Service |Get-Member
gsv|gm
"rakesh"| gm
"rakesh".Length
"rakesh".Contains("k")
"rakesh".Replace("s","$")
"rakesh".Replace("s",1)
"r1kesh".Replace(1,"a")
"RAKESH".ToLower()
"rakesh".Remove(0,2)
$name=rakesh
Write-Host "$name"
Write-Host '$name'
'This ny name "$name"'
$myarr= @("dinesh",1,"patil")
$myarr| gm
Get-Member -InputObject $myarr
Get-Member -InputObject $myarr
$myarr.Length
Get-PSProvider
Get-Command -Noun PSProvider
Get-ChildItem -Path c:\
Get-Item -Path C:\Windows|fl *
Get-ItemProperty -Path C:\Windows\*
Get-ItemProperty -Path C:\Windows|fl *
Get-Item Env:\
Get-Item Env:\TEMP
Get-ChildItem cert:\ -Recurse
New-Item -Path c:\ -Name "demo" -ItemType "directory"
New-Item -Path c:\demo2 -ItemType "directory"
Get-ChildItem C:\Windows | Out-File -FilePath c:\demo\files.txt
Get-ChildItem C:\Windows | Export-Csv  c:\demo\files.csv -Append
$path=Read-Host 
Get-ChildItem -Path $path
Get-Help write-Host -Detailed
Write-Host "give your path"
$path=
Get-ChildItem -Path $path


echo "give your value1"
[INT]$var1=Read-Host
echo "give your value2"
[INT]$var2=Read-Host
if( $var1 -le $var2)
{ echo "$var1 is less than $var2"
}
else
{echo "$var1 is greater than $var2"
}



$service= Get-Service -Name BITS
if( $service.Status -eq "Running")
{ Write-Host "The service is running"
}
elseif( $service.Status -eq "Stopped")
{Write-Host "The service is stopped"
}
else 
{ Write-Host "The service is suspended"
}

Get-Help about_switch
Update-Help



$service= Get-Service -Name BITS
Switch ($service.Status)
{
Stopped { Write-Host "The service is stopped"}
Running {Write-Host "The service is Running"}
Suspended { Write-Host "The service is Suspended"}
}

"11" -eq 11
11 -eq "11"
"dinesh" -match "in"
"dinesh" -match "^d"
"dinesh" -match "^d$"
"inesh" -match "^d"
"dinesh" -match "sh$"
"dinesh" -match "^d.....$"
"dinesh" -match "^d....h$"
"dinesh" -match "d[in]nesh"
"dinesh" -match "^d{5}$"
"ddddd" -match "^d{5}$"
"ddinesh" -match "^d{1}.....$"
"dddd" -match "^d{5}$"
"dddddd" -match "^d{5,}"
"ddddddddd" -match "^d{5,7}$"

for($i=0;$i -le 4;$i=$i+1)
{ Write-Host "*"  
}
Get-help write-host -Examples









