pushd %~dp0
@echo off
setlocal ENABLEDELAYEDEXPANSION
Set scriptDir=%cd%
Set skillScriptPath=!scriptDir:\=/!
@echo skill load "%skillScriptPath%/builder.ile" > builder.scr.txt
@echo skill changeWorkingDir "%skillScriptPath%" >> builder.scr.txt
for %%g in (*.xml) do (
@echo skill LB_createFootprint "%skillScriptPath%/%%g" >> builder.scr.txt
if exist %%~ng.step (
@echo scriptmode +i +n >> builder.scr.txt
@echo step pkg map >> builder.scr.txt
@echo setwindow form.pkgmap3d >>  builder.scr.txt
@echo FORM pkgmap3d stplist %%~ng.step >> builder.scr.txt
@echo FORM pkgmap3d rotation_x 0 >> builder.scr.txt
@echo FORM pkgmap3d save_current >> builder.scr.txt
@echo FORM pkgmap3d done >> builder.scr.txt
@echo setwindow pcb >> builder.scr.txt
@echo save  >> builder.scr.txt
@echo fillin yes >> builder.scr.txt
) Else (
Set "StepFileName=%%~ng.step"
Set "StepFileName=!StepFileName:-M=!"
Set "StepFileName=!StepFileName:-m=!"
Set "StepFileName=!StepFileName:-L=!"
Set "StepFileName=!StepFileName:-l=!"
if exist !StepFileName! (
@echo scriptmode +i +n >> builder.scr.txt
@echo step pkg map >> builder.scr.txt
@echo setwindow form.pkgmap3d >>  builder.scr.txt
@echo FORM pkgmap3d stplist !StepFileName! >> builder.scr.txt
@echo FORM pkgmap3d rotation_x 0 >> builder.scr.txt
@echo FORM pkgmap3d save_current >> builder.scr.txt
@echo FORM pkgmap3d done >> builder.scr.txt
@echo setwindow pcb >> builder.scr.txt
@echo save  >> builder.scr.txt
@echo fillin yes >> builder.scr.txt
)))
@echo exit >> builder.scr.txt
@echo Creating footprints..
START /W "" "allegro.exe" -s builder.scr.txt

exit

