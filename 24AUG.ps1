# HASHTABLE
$student=@{name="dinesh"
             id=1} 

$student
$student.ContainsKey("name")
$student.ContainsValue("dinesh")
$student.GetHashCode()
$student.Keys
$student.Count
$student.Values
$student.Add("name2","sir") 
$student.id=@(1,2,3)

$array=@(1,2,3)
$student.id=$array
$array.Add(4)
 
#To add object in array (arraylist)

[System.Collections.ArrayList]$arraylist=@(1,2,3)
$student.id=$arraylist
$student.id
$arraylist.Add(4)
$arraylist.Remove(2)
$arraylist[2]=5


#PIPELINE

Get-Service|

Get-Help Stop-Service -ShowWindow
Get-Service|gm
Get-Service| Stop-Process
Get-Help Stop-Process -ShowWindow

Get-Service BITS|Stop-Process

Get-Service|Stop-Process -WhatIf
    
Get-Process| Stop-Service -WhatIf
Get-Help Stop-Service -ShowWindow

Get-ChildItem C:\Windows\System32 | Stop-Process
Get-ChildItem |gm
Get-Help Stop-Process -ShowWindow

Get-Service |gm
Get-Service -DisplayName *WINDOWS*


$myservices=Import-Csv .\POWERSHELL.CSV
$myservices
$myservices|Stop-Process
$myservices|select sname,@{l="name";e={$_.sname}}|Stop-Process

foreach




  





# HASTABLE IN ARRAY
$students=@(
             @{name="dinesh"},
             @{name="basant"},
             @{name="prashant"}
              )
$students



$students.Add("name","ritesh")


#ARRAY IN HASHTABLE

$studentdetails=@{name="dinesh"
                  sub=@("math","science")
                   }
$studentdetails

# HASHTABLE
$student=@{name="dinesh"
             id=1} 

$student


# HASTABLE IN ARRAY
$students=@(
             @{name="dinesh"},
             @{name="basant"},
             @{name="prashant"}
              )

$students

#ARRAY IN HASHTABLE

$studentdetails=@{name="dinesh"
                  sub=@("math","science")
                   }
$studentdetails




============================FOR EACH LOOP==========================

$adusers=Import-Csv .\ADUSERS.csv
$exusers=Import-Csv .\EXusers.csv


 foreach( $aduser in $adusers)
           {  $matched=$exusers| Where-Object {$_.email -eq $aduser.mail} | Measure-Object

    if( $matched.Count -ge 1)
               { 
            $matchusers=$exusers| Where-Object {$_.email -eq $aduser.mail

                          $outputuser=[pscustomobject]@{name=$aduser.name
                                                         totalsize=$matchusers.totalsize }
                }
                $outputuser|Export-Csv C:\demo\match.csv -Append
            }
      else
            { 
              $aduser.name |Out-File c:\demo\notmatch.csv 
            }

           }


Get-Process

 $output=Get-Process |Where-Object {$_.ws -ge 100KB}|Select-Object ProcessName,ws
 $output | gm
 $MB = $output.ws/1024

 Get-Process |Where-Object {$_.ws -ge 100KB}| select name,@{l="WS(MB)";e={$_.ws/1MB}}


$text="dinesh"
$reversetext = ""
for ($i=$text.Length; $i -ge 0; $i--)

 {

 $reversetext = $reversetext+$text[$i]

 
 }
 
 $reversetext


 Write-Host "give first num"
 [int]$firstnum = Read-Host
 Write-Host "give sec num"
 [int]$secnum = Read-Host
 Write-Host "give 1-add 2-sub num"
 [int]$operation = Read-Host 
 switch( $operation )
 { 
    1 {write-host "add is" ($firstnum + $secnum) } 
    2 {Write-Host "sub is" ($firstnum - $secnum)}
 }



 for *******
     **

     for($i=5;$i -gt 0;$i=$i-1){

Write-Host "" 

for($j=$i;$j -gt 0;$j=$j-1){

Write-Host "*" -NoNewline
}

}