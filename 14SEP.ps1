===================14-sep=============================
#parameters 


param(

[INT]$number
)

if ( $number %2 -eq 0)
{

Write-Host "$number is EVEN"

}
else{

Write-Host "$number is ODD"

}
==========================================================================

#parameters


param(

[INT]$NUM
)

if ( $number %2 -eq 0)
{

#Write-Host "$number is EVEN"
$myoutput = "even"

}
else{

#Write-Host "$number is ODD"
$myoutput = "odd"

}
Write-Host "my output from script is $myoutput"
===================================================================================
$myoutput = "none"
==========================================================================
$myoutput = "none"

#. .\Checkev.ps1 -number 3
#& .\CheckScopenumber.ps1 -number 3

#Write-host "Myoutput variable out of the script $myoutput"

. .\checkevenodd.ps1 -number 3
#& .\checkevenodd.ps1 -number 3
Write-host "Myoutput variable out of the script $myoutput"
====================================================================================