@echo off
REM Uses the default settings for the Baldur's Gate 3 folder, however, it allows overriding it by 
REM specifying the folder path in the BG3Folder.txt file in the root of bg3se (the file is in the 
REM .gitignore list).
setlocal

SET SRC_FILE=%1
SET SRC_FILE=%SRC_FILE:"=%

IF "%SRC_FILE%"=="" (
	echo The source binary file was not specified to copy to the Baldur's Gate 3 bin folder.
	exit /b 2
)
SET BG3_BIN_FOLDER_CONFIG_FILE="LOCALAPPDATA%\BG3 Script Extender\BG3Folder.txt"
SET BG3_FOLDER=D:\SteamLibrary\steamapps\common\Baldurs Gate 3
IF EXIST %BG3_BIN_FOLDER_CONFIG_FILE% SET /P BG3_FOLDER=<%BG3_BIN_FOLDER_CONFIG_FILE%
SET BG3_TARGET_FILE=%BG3_FOLDER%\bin\DWrite.dll
echo Copying "%SRC_FILE%" --^> "%BG3_TARGET_FILE%"
copy /Y "%SRC_FILE%" "%BG3_TARGET_FILE%"
rem xcopy /Y /E /I "%~dp0\TestModule\*" "%BG3_FOLDER%\Data\"