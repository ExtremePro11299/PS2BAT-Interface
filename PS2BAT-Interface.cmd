@echo off
title PS2BAT-Interface
set mod=not_defined
set target=not_defined
set msg=not_defined
cd /D %~dp0
for /f "tokens=1" %%a in ( DefaultModulePath.txt ) do (
   set mod=%%a
)
if %mod% neq "not_defined" (
  if not exist %mod% (
     set mod=not_defined
   )
)
goto main

:setmsg
if %mod%==not_defined (
    set msg=PS2BAT module not selected. Type module to select it.
	goto :eof
)
if %target%==not_defined (
    set msg=Target Powershell script not selected. Type select to select one.
	goto :eof
)
set msg=Ready to convert. Type convert to convert.
goto :eof

:main
call :setmsg
echo Execution Policy:
powershell Get-ExecutionPolicy
echo PS2BAT Module: %mod%
echo Target Powershell script: %target%
echo.
echo %msg%
set /p input=
cls
if %input%==module call :modselect
if %input%==select call :scriptselect
if %input%==convert call :convert
if %input%==cmds call :cmds
if %input%==unblock call :scriptunblock
if %input%==executionpolicy call :execpolset
if %input%==exit exit
cls
goto main
:modselect
echo Input the path to the PS2BAT module.
set /p mod=
if not exist %mod% (
    echo Invalid path.
    set mod=not_defined
    pause
)
goto :eof
:scriptselect
echo Input the path to the Powershell script you want to convert.
set /p target=
if not exist %target% (
    echo Invalid path.
    set target=not_defined
    pause
)
goto :eof
:scriptunblock
powershell Unblock-file Convert.ps1
echo Converter unblocked. If there is no error message above, it was successful.
pause
goto :eof
:execpolset
echo Choose the execution policy you'd like. (type the number)
echo 1) RemoteSigned (requires running unblock, more secure)
echo 2) AllSigned (does not work with program, medium security)
echo 3) Restricted (does not work with the program, but is the most secure)
echo 4) Bypass (works with the program, but is very insecure)
echo 5) Undefined
echo 6) Cancel
::echo 7) Help
set /p execpol=
if %execpol%==6 goto :eof
::if %execpol%==7 {
 ::   start "" "https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies?view=powershell-7.4"
  ::  cls
 ::  goto execpolset
::    }
echo For who should the execution policy apply? (type the number)
echo 1) For you only (CurrentUser)
echo 2) For the whole computer (LocalMachine, requires running as administrator)
echo 3) Cancel
set /p scp=
powershell Set-ExecutionPolicy -executionpolicy %execpol% -scope %scp%
echo Execution policy change attempted. If there is no error message above, it was successful.
pause
goto :eof
:convert
if %mod%==not_defined (
    echo Please provide the module first.
    pause
    goto :eof
)
if %target%==not_defined (
    echo Target Powershell script not selected.
    pause
    goto :eof
)
powershell .\Convert.ps1 -mod %mod% -target %target%
echo Conversion completed. Clear powershell script entry? (1 - Yes, any other key - No)
set /p clropt=
if %clropt%==1 set target=not_defined
goto :eof
:cmds
echo Commands
echo -  cmds             : Displays this page
echo -  module           : Provide the PS2BAT module
echo -  select           : Provide the script you want to convert
echo -  executionpolicy  : Change the execution policy   
echo -  convert          : Converts the target powershell script into a batch file
echo -  unblock          : Unblocks Convert.ps1 using powershell Unblock-File.
echo -  exit             : Exits the program.
pause
goto :eof