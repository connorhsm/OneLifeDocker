@echo off
:: Usage:
::    restart.cmd <ohol|2hol> [hard]

call utils\functions\check-args.cmd %1
if errorlevel 1 exit /b 1

if "%2"=="hard" (
		call utils\destroy.cmd %1
) else (
		call utils\stop.cmd %1
)

call utils\start.cmd %1
