@echo off

REM Set variables for the paths
set SRC_FOLDER=src
set BUILD_FOLDER=build
set BP_FOLDER=BP
set RP_FOLDER=RP

REM Prompt user for pack version
set /p "packver=Enter Pack Version (Major-Minor-Revision): "
set OUTPUT_FILE=kats-metal-detector-%packver%.mcaddon


REM Use the jar command to create a .mcaddon file
echo Creating: %OUTPUT_FILE%...

cd %SRC_FOLDER%

zip -r ..\%OUTPUT_FILE% %BP_FOLDER% %RP_FOLDER% >nul

cd ..

REM Check if the operation was successful
if exist %OUTPUT_FILE% (
    echo Successfully created %OUTPUT_FILE%.
) else (
    echo Failed to create %OUTPUT_FILE%.
    exit /b 1
)

move %OUTPUT_FILE% %BUILD_FOLDER%>nul


pause

@REM echo Building: kats-metal-detector version %packver%
@REM jar -cfM "tmp.zip" "src"
@REM move "tmp.zip" "build\tmp.zip" >nul
@REM echo Completed, check build folder.