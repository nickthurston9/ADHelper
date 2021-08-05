<b>ADHelper</b>

A little tool I wrote to make lookups in Active Directory easier.

Pre-Requisite is that you need to install the activedirectory module in PowerShell

Easiest way to use is to place the adhelper.ps1 file in the directory you run PowerShell from as admin (default is "C:\Windows\System32") and dot source the file

Example in PowerShell:

C:\Windows\System32> . ./adhelper.ps1

There is also a .psm1 file that can be added as a module in PowerShell. Navigate to C:\Windows\System32\PowerShell\v1.0\Modules and create a folder named adhelper.

Then place the adhelper.psm1 file inside of the adhelper folder and you can then use <code>Import-Module adhelper</code> to use ADHelper as a module.
