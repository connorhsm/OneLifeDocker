@echo off
:: Usage:
::    destroy.cmd <ohol|2hol>

call utils\functions\check-args.cmd %1
if errorlevel 1 exit /b 1

docker compose -f docker-compose.%1.yml down
