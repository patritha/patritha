@echo off
setlocal enabledelayedexpansion
title Chosens modded with gabes addons easy installer
::constants
set startdir=%CD%
goto getinstancedirectory

:getinstancedirectory
set /p instance=Please paste the full file path of your minecraft instance (should end in ".minecraft"): 
::grannyproof this shi 💀💀
if exist "%instance%\" (
	echo check 1 pass
) else (
	echo check 1 fail
	echo the directory provided is probably not a valid minecraft instance, please try again
	pause
	set instance=
	goto getinstancedirectory
)
cd "%instance%"
if exist mods\ (
	echo check 2 pass
	echo path entered is probably a valid instance, press any key if you are ready to install
	pause
	cd "%startdir%"
	goto movemods
) else (
	echo check 2 fail
	echo the directory provided is probably not a valid minecraft instance, please try again
	pause
	set instance=
	goto getinstancedirectory
)

:movemods
echo copying new mods...
robocopy /is /it "%CD%\files\mods" "%instance%\mods" *.jar
echo Done
echo ----

:moveconfig
echo copying configs...
robocopy /is /it "%CD%\files\config" "%instance%\config" *.*
echo Done
echo ----
:movescripts
echo copying scripts...
robocopy /is /it "%CD%\files\scripts" "%instance%\scripts" *.*
echo Done
echo ----

:cleanup
echo cleaning up no longer needed things...
::delete mods
cd "%instance%\mods"
if exist resourcefullib-forge-1.20.1-2.1.24.jar (
	del resourcefullib-forge-1.20.1-2.1.24.jar
)
if exist emi-1.1.18+1.20.1+forge.jar (
	del emi-1.1.18+1.20.1+forge.jar
)
if exist infinity_stones_1.0.jar (
	del infinity_stones_1.0.jar
)
if exist cloth-config-11.1.118-forge.jar (
	del cloth-config-11.1.118-forge.jar
)
::delete scripts

echo Done
echo ----

:end
echo install process complete!
pause
exit