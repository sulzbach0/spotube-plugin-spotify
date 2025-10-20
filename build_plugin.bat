@echo off
echo Building Spotify Plugin...

REM Create build directory
if not exist build mkdir build

REM Install Hetu if not already installed
echo Installing Hetu...
dart pub global activate hetu_script_dev_tools

REM Compile the plugin
echo Compiling plugin...
hetu compile src/plugin.ht build/plugin.out

REM Copy to example assets
echo Copying to example assets...
copy build\plugin.out example\assets\bytecode\

echo Build completed successfully!
echo You can now run the Flutter example.
pause
