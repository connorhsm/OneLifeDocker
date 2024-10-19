@echo off
:: Usage:
::   build.cmd <ohol|2hol>

call utils\functions\check-args.cmd %1
if errorlevel 1 exit /b 1

docker compose -f docker-compose.%1.yml build --pull --no-cache
if errorlevel 1 exit /b 1

for /f "tokens=*" %%i in ('docker run --rm %1-server:latest cat /usr/versionNumber.txt') do set VERSION=%%i
docker tag %1-server:latest %1-server:%VERSION%

echo Built server image - %1-server:latest %1-server:%VERSION%
