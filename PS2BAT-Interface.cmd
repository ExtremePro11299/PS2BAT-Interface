@echo off
title PS2BAT-Interface
set mod=not_defined
set target=not_defined
set msg=not_defined
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
    set msg=PS2BAT module not selected. Type module to select one.
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
if %input%==exit exit
goto main
:modselect
echo Input the path to the PS2BAT module.
set /p mod=
if not exist %mod% (
    echo Invalid path.
    set mod=not_defined
    pause
)
cls
goto :eof
:scriptselect
echo Input the path to the Powershell script you want to convert.
set /p target=
if not exist %target% (
    echo Invalid path.
    set target=not_defined
    pause
)
cls
goto :eof
:convert
if %mod%==not_defined (
    echo Please provide the module first.
    pause
    cls
    goto :eof
)
if %target%==not_defined (
    echo Target Powershell script not selected.
    pause
    cls
    goto :eof
)
powershell .\Convert.ps1 -mod %mod% -target %target%
goto :eof