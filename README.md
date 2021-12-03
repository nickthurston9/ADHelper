<h1><b><u>ADHelper</u></b></h1>

A little tool I wrote to make lookups in Active Directory easier.

Pre-Requisite is that you need to install the <code>activedirectory</code> module in PowerShell

Easiest way to use is to place the <code>adhelper.ps1</code> file in the directory you run PowerShell from as admin (default is "C:\Windows\System32") and dot source the file

Example in PowerShell:

<code>C:\Windows\System32> . ./adhelper.ps1</code>

There is also a .psm1 file that can be added as a module in PowerShell. Navigate to <code>C:\Windows\System32\WindowsPowerShell\v1.0\Modules</code> and create a folder named <code>adhelper</code>

Then place the <code>adhelper.psm1</code> file inside of the adhelper folder and you can then use <code>Import-Module adhelper</code> to use ADHelper as a module.
