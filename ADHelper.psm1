#PowerShell AD Helper

<# 

.SYNOPSIS

AD Tool used to find users by first name and last name. Will also assist in finding locked out users and unlocking accounts.


.DESCRIPTION

ADHelper is a tool that can find users, unlock users, and show what users are locked out.

The 'gadu' command is useful to find the user's information including title and manager.

The 'unlock' command is useful to unlock users


.LINK

https://docs.microsoft.com/en-us/powershell/module/activedirectory/?view=windowsserver2019-ps

.EXAMPLE

gadu Jane.Doe



DistinguishedName : CN=Jane Doe,OU=Users,DC=<domain>,DC=com
Enabled           : True
GivenName         : Jane
Name              : Jane Doe
ObjectClass       : user
ObjectGUID        : #############################
SamAccountName    : Jane.Doe
SID               : #############################
Surname           : Doe
UserPrincipalName : Jane.Doe@<domain>.com

.EXAMPLE

LockedOut

DistinguishedName : CN=Jane Doe,OU=Users,DC=<domain>,DC=com
Enabled           : True
GivenName         : Jane
LockedOut         : True
Name              : Jane Doe
ObjectClass       : user
ObjectGUID        : #############################
SamAccountName    : Jane.Doe
SID               : #############################
Surname           : Doe
UserPrincipalName : Jane.Doe@<domain>.com

.EXAMPLE

unlock Jane.Doe

.EXAMPLE

firstNameSearch

.EXAMPLE

lastNameSearch


#>

Clear-Host

$date = date

echo " ________  ________ _________  ___  ___      ___ _______           ________  ___  ________  _______   ________ _________  ________  ________      ___    ___ 
|\   __  \|\   ____\\___   ___\\  \|\  \    /  /|\  ___ \         |\   ___ \|\  \|\   __  \|\  ___ \ |\   ____\\___   ___\\   __  \|\   __  \    |\  \  /  /|
\ \  \|\  \ \  \___\|___ \  \_\ \  \ \  \  /  / | \   __/|        \ \  \_|\ \ \  \ \  \|\  \ \   __/|\ \  \___\|___ \  \_\ \  \|\  \ \  \|\  \   \ \  \/  / /
 \ \   __  \ \  \       \ \  \ \ \  \ \  \/  / / \ \  \_|/__       \ \  \ \\ \ \  \ \   _  _\ \  \_|/_\ \  \       \ \  \ \ \  \\\  \ \   _  _\   \ \    / / 
  \ \  \ \  \ \  \____   \ \  \ \ \  \ \    / /   \ \  \_|\ \       \ \  \_\\ \ \  \ \  \\  \\ \  \_|\ \ \  \____   \ \  \ \ \  \\\  \ \  \\  \|   \/  /  /  
   \ \__\ \__\ \_______\  \ \__\ \ \__\ \__/ /     \ \_______\       \ \_______\ \__\ \__\\ _\\ \_______\ \_______\  \ \__\ \ \_______\ \__\\ _\ __/  / /    
    \|__|\|__|\|_______|   \|__|  \|__|\|__|/       \|_______|        \|_______|\|__|\|__|\|__|\|_______|\|_______|   \|__|  \|_______|\|__|\|__|\___/ /     
                                                                                                                                                \|___|/      
                                                                                                                                                         "
echo "                                         ___  ___  _______   ___       ________  _______   ________     
                                        |\  \|\  \|\  ___ \ |\  \     |\   __  \|\  ___ \ |\   __  \    
                                        \ \  \\\  \ \   __/|\ \  \    \ \  \|\  \ \   __/|\ \  \|\  \   
                                         \ \   __  \ \  \_|/_\ \  \    \ \   ____\ \  \_|/_\ \   _  _\  
                                          \ \  \ \  \ \  \_|\ \ \  \____\ \  \___|\ \  \_|\ \ \  \\  \| 
                                           \ \__\ \__\ \_______\ \_______\ \__\    \ \_______\ \__\\ _\ 
                                            \|__|\|__|\|_______|\|_______|\|__|     \|_______|\|__|\|__|
                                                                                                        
                                                                                                        "
echo ""
echo "Started at $date"
Import-Module ActiveDirectory
echo ""
echo ""
echo "Welcome to PowerShell AD Helper!"

echo "Session started by: $env:USERNAME"
echo ""

echo "Available functions: "
echo "LockedOut - finds locked out users"
echo "firstNameSearch - finds person based on first name"
echo "lastNameSearch - finds person based on last name"
echo "Unlock <user>"
echo "gadu <user>"

echo ""
echo "To use a function, type <function name>"


#####################################################
######### Function and Tool Definitions #############
#####################################################


Set-Alias -Name gadu -Value Get-ADUser
Set-Alias -Name unlock -Value Unlock-ADAccount


function LockedOut{

echo ""
echo ""
echo "Finding locked out users..."
echo ""
echo ""

Get-ADUser -Filter * | where {$_.LockedOut -eq $true} | select GivenName,Surname,LockedOut,Enabled

echo ""
echo ""

 }



## Search by first name

function firstNameSearch{

echo ""
echo ""

$fname = Read-Host "Please enter in part or all of the first name."

echo ""
echo ""
echo "Searching..."
echo ""
echo ""
sleep 3

Get-ADUser -Filter * -Properties Title,Manager | where {$_.GivenName -like "$fname*"} | select GivenName, SurName, Samaccountname,Title,Manager

echo ""
echo ""

}



## Search by last name

function lastNameSearch{

echo ""
echo ""


$lname = Read-Host "Please enter in part or all of the last name."

echo ""
echo ""
echo "Searching..."
echo ""
echo ""
sleep 3

Get-ADUser -Filter * -Properties Title,Manager | where {$_.SurName -like "$lname*"} | select GivenName, SurName, Samaccountname,Title,Manager

echo ""
echo ""

}