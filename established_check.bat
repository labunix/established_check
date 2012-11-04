@echo off

rem Author labunix
rem Last Update 2012/11/04
rem Licence	: GPL v2
rem
rem Format
rem		: CPEC = Check Port Established Count
rem		: APEC = All Port Established Count
rem yyyy/mm/dd,HH:MM:SS,[Port Number],[CPEC],[APEC]


Set CHKPORT=8080
Set FILE=established_check.tmp
netstat -an > %FILE%
for /f %%A in ('find /c "ESTABLISHED" ^< %FILE%') do set ALLCNT=%%A
netstat -an | find "%CHKPORT%" > %FILE%
for /f %%B in ('find /c "ESTABLISHED" ^< %FILE%') do set PORTCNT=%%B
echo %date%,%time:~0,8%,%CHKPORT%,%PORTCNT%,%ALLCNT%
DEL %FILE%
