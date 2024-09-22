@echo off
:: Usage:
::    stop.cmd <ohol|2hol> [force]

call utils\functions\check-args.cmd %1
if errorlevel 1 exit /b 1

set shutdownFile=
if "%2"=="force" (
    set shutdownFile=%1-data\settings\forceShutdownMode.ini
) else (
    set shutdownFile=%1-data\settings\shutdownMode.ini
)

if exist %shutdownFile% (
    echo 1 > %shutdownFile%
    docker logs --tail 1 -f %1-server
    echo 0 > %shutdownFile%
) else (
    echo "Please run this command from the OneLifeDocker directory"
)
