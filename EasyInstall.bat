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
echo moving new mods...
robocopy /is /it "%CD%\files\mods" "%instance%\mods" *.jar
echo Done
echo ----

:moveconfig
echo Moving configs...
robocopy /is /it "%CD%\files\config" "%instance%\config" *.*
echo Done
echo ----

:cleanup
echo cleaning up no longer needed things...
::delete mods
cd "%instance%\mods"
if exist jei-1.20.1-forge-15.3.0.4.jar (
	del jei-1.20.1-forge-15.3.0.4.jar
)
if exist JeiTweaker-forge-1.20.1-8.0.6.jar (
	del JeiTweaker-forge-1.20.1-8.0.6.jar
)
if exist justenoughbreeding-forge-1.20.x-1.2.1.jar (
	del justenoughbreeding-forge-1.20.x-1.2.1.jar
)
if exist JustEnoughProfessions-forge-1.20.1-3.0.1.jar (
	del JustEnoughProfessions-forge-1.20.1-3.0.1.jar
)
if exist JustEnoughResources-1.20.1-1.4.0.247.jar (
	del JustEnoughResources-1.20.1-1.4.0.247.jar
)
if exist resourcefullib-forge-1.20.1-2.1.24.jar (
	del resourcefullib-forge-1.20.1-2.1.24.jar
)
::delete scripts
cd "%instance%\scripts"
if exist jeiremove.zs (
	del jeiremove.zs
)
echo Done
echo ----

:end
echo install process complete!
pause
exit