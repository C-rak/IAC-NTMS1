==============================31-AUG-2019====================

# To create own Class & instance of it as an OBJECT

class admailbox
{ [string]$name
  [int] $totalitemsize
 }

 
 $admailboxvaluen=New-Object -TypeName admailbox


$admailboxvaluen|gm

# To add value in Object

$admailboxvaluen.name="ritesh"
$admailboxvaluen.totalitemsize=122235
$admailboxvaluen|Export-Csv -Path c:\demo.csv
$admailboxvaluen|gm

------------------------------------------------------------------------------------------------
# Create an array and sort the content of it.

$array=@(1,2,6,12,13,24,26)
$array|Sort-Object 
$array|Sort-Object -Descending
-----------------------------------------------------------------------------------------------

# to create calculator as a class & object

class mycalculator
{   [int]$firstnumber
    [int]$secondnumber

  [int]add()
  { return $this.firstnumber+$this.secondnumber}

  [int]Multiply()
  {return $this.firstnumber*$this.secondnumber}

  [int]subtract()
  {return $this.firstnumber-$this.secondnumber}

  [int]Division()
  {return $this.firstnumber/$this.secondnumber}

  [void ]clear()

  {$this.firstnumber=$null
   $this.secondnumber=$null
   }
  
 }

 $mycalc=New-Object -TypeName mycalculator

 $mycalc.firstnumber=100
 $mycalc.secondnumber=100
$mycalc|gm
 $mycalc.add()
 $mycalc.Multiply()
 $mycalc.Subtract()
 $mycalc.division()
 $mycalc.clear()
 $mycalc
----------------------------------------------------------------------------------
 $Error is the variable which stores error occured from starting the powershell


 generate-error #this is not a command; it's just create error

 $Error[0]|gm

 $Error[0].InvocationInfo
 $Error[0].InvocationInfo.Line
 $Error[0].Exception
$Error[0].ErrorDetails
 $Error[0].CategoryInfo
 $ErrorActionPreference|gm
 Stop-Service -ErrorAction 
 Stop-Service -Name ntms -ErrorAction SilentlyContinue
 $ErrorActionPreference

 $services=@("bits","dinesh","windupdate")
Stop-Service -Name $services  -ErrorAction Continue -ErrorVariable ntms 

if($ntms -ne $null)

{ $error=$ntms 
    $error|Out-File -FilePath C:\error.txt -Append}

else
{ $sucess=" service started "
   $sucess|Out-File -FilePath C:\sucess.txt -Append}

   Get-Service -Name BITS|Start-Service
   
$ntms


=====================================================================================================

$services=@("bits","dinesh","windupdate")


#need an ouput for individual service either in success.txt or error.txt

#$services | stop-service -ErrorVariable NEA


foreach($service in $services)
{
    stop-service -name $service -ErrorVariable EA1 -err

    Write-host "stopping $service"

     if($EA1 -ne $null)
    {
       "not able to stop service $service because  $($EA1.Categoryinfo.Reason) " | out-file C:\demo\error.txt -Append
    }
    else
    {
        "successfully stop service $service." | out-file C:\demo\success.txt -Append
    }


    
}
=================================================================================================
#subexpression
$()
"$($EA1.Categoryinfo.Reason)"
$EA1.Categoryinfo.Reason
$EA1

==========================================================
# Getting output of non terminating command to a file

try 
{


Stop-Service -name dinesh -ErrorAction Stop
}
catch 
{

$_.exception.message | Out-File C:\catch.txt

}

Finally
{

}
===============================================================================
# Getting output of non terminating command to a file
#FInally used to clear Variable value

try 
{


Stop-Service -name dinesh -ErrorAction Stop
}
catch 
{

$_.exception.message | Out-File C:\catch.txt

}

Finally
{
Clear-Variable
}


=========================================================================
#Task


for ($char = 0; $char -le 26; $char++ )

{

Write-Host $([Char](65+$char))
}


============================================================
# task:

$services = Get-Service

foreach ($service in $services)

{

Write-Host "This display name of the service $($service.name) is $($service.displayname)"

}
=================================================================================================
###delete files older than n days

$date = Get-Date
$olddate = $date.AddDays(-30)


$i=1
for ($i=1; $i -le 20; $i++)

{New-Item -ItemType file -Path C:\demo\myfile$i.txt}


# To delete outdated File from dir.


for ($i=1; $i -le 10; $i++)

{
get-Item -Path C:\demo\myfile$i.log | Set-ItemProperty -Name LastWriteTime -Value $olddate
}


Get-ChildItem -path C:\demo\*.log | Where-Object{$_.LastWriteTime -le $olddate} | Remove-Item -Force

Get-Help Get-ChildItem -ShowWindow