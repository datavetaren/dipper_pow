@echo off
SET MODULES=pow

IF "%1"=="all" (
GOTO :ALL
)

IF "%1"=="clean" (
GOTO :CLEAN
)

IF "%1"=="vcxproj" (
GOTO :VCXPROJ
)

IF "%1"=="vssln" (
GOTO :VSSLN
)

echo ------------------------------------------------------
echo  make all     to build everything from command prompt
echo ------------------------------------------------------
echo  or:
echo.
echo  make vcxproj to build Visual Studio vcxproj files
echo  make vssln   to build Visual Studio Solution file
echo.
echo ------------------------------------------------------

GOTO :EXIT

:ALL

IF "%DEBUGMODE%"=="1" (
   echo [DEBUG MODE]
)

FOR %%X IN (%MODULES%) DO (
   echo ------------------------------------------------------
   echo  Build %%X
   echo ------------------------------------------------------
   cmd /c "cd src\%%X && make.bat"
   echo ------------------------------------------------------
   echo  Test %%X
   echo ------------------------------------------------------
   cmd /c "cd src\%%X && make.bat test"
)

GOTO :EXIT

:CLEAN

IF EXIST out rd /s /q out
IF EXIST bin rd /s /q bin

GOTO :EXIT

:VCXPROJ
:VSSLN

pushd
cd src\common
make.bat %1
popd


:EXIT
