# PS2BAT-Interface
[![script](https://img.shields.io/github/actions/workflow/status/ExtremePro11299/Powershell-networking-tool/powershell.yml?label=PowerShellScriptAnalysis&logo=Powershell)](https://github.com/ExtremePro11299/Powershell-networking-tool/actions?workflow=PSScriptAnalyzer)  
An interface for the [PS2BAT module](https://github.com/EvilBytecode/PS2BAT) by EvilByteCode.

## Requirements
- Windows Vista or newer
- Compatible [execution policy](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4)
- [PS2BAT module](https://github.com/EvilBytecode/PS2BAT)

## Updates (newest to oldest)
- Added cls to all areas
- You can now clear the powershell script entry after completing conversion

## Usage

### 1) Connecting to the PS2BAT module
Type `module` on the main menu and you can provide the path to the PS2BAT module.

### 2) Selecting the Powershell script to convert
Type `select` on the main menu and you can provide the path to the Powershell script you want to convert.

### 3) Auto-connecting the PS2BAT module
Provide the path to the PS2BAT module in the DefaultModulePath.txt file and it will automatically choose it when you open the program.

### 4) Converting
Type `convert` on the main menu and it will convert the target Powershell script into a batch file.
