# PS2BAT-Interface
[![script](https://img.shields.io/github/actions/workflow/status/ExtremePro11299/Powershell-networking-tool/powershell.yml?label=PowerShellScriptAnalysis&logo=PowerShell)](https://github.com/ExtremePro11299/Powershell-networking-tool/actions?workflow=PSScriptAnalyzer)  
An interface for the [PS2BAT module](https://github.com/EvilBytecode/PS2BAT) by EvilByteCode.

## Requirements
- Windows Vista or newer
- Compatible [execution policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4)
- [PS2BAT module](https://github.com/EvilBytecode/PS2BAT)

## Updates (newest to oldest)
- Added an option to change the execution policy from within the program
- Added cls to all areas
- You can now clear the powershell script entry after completing conversion

## Usage (view the command list for more details)

### 1) Connecting to the PS2BAT module
Type `module` on the main menu and you can provide the path to the PS2BAT module.

### 2) Selecting the Powershell script to convert
Type `select` on the main menu and you can provide the path to the Powershell script you want to convert.

### 3) Auto-connecting the PS2BAT module (optional)
Provide the path to the PS2BAT module in the DefaultModulePath.txt file and it will automatically choose it when you open the program.
> If the path is invalid, it will stay not_defined.

### 4) Changing the execution policy
Type `executionpolicy` on the main menu and you will be able to specify the execution policy you need. 
> To change the execution policy for the LocalMachine, run the program as administrator.

### 5) Unblocking converter
Type `unblock` on the main menu and it will now work with the RemoteSigned execution policy.

### 6) Converting
Type `convert` on the main menu and it will convert the target Powershell script into a batch file.

### 7) Exiting
Type `exit` on the main menu or press Ctrl+C without selecting anything to exit the program (you can use the red X too)
## Errors
### Cannot run Convert.ps1 because running scripts is disabled on this system.
- Change the execution policy to either RemoteSigned or Bypass.
- Type `unblock` on the main menu.
### Module stays undefined after defining it in DefaultModulePath.txt
- Check if the path in DefaultModulePath.txt is valid.
## Command list
```txt
Commands
 -  help             : Displays this page
 -  module           : Provide the PS2BAT module
 -  select           : Provide the script you want to convert
 -  executionpolicy  : Change the execution policy   
 -  convert          : Converts the target powershell script into a batch file
 -  unblock          : Unblocks Convert.ps1 using powershell Unblock-File.
 -  exit             : Exits the program.
```