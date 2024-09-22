@echo off

:check_server_type_arg
if "%1"=="ohol" goto valid
if "%1"=="2hol" goto valid

echo "You must provide a server type argument of 'ohol' or '2hol'"
exit /b 1

:valid
exit /b 0
