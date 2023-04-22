
@echo on

title CountDown  made by Taojiu
color 0a

set /a count=10
:loop
cls
echo %count%
ping -n 2 127.0.0.1 > nul
set /a count-=1
if %count% gtr 0 goto loop

py C:\Users\Administrator\Desktop\test\autostream.py

start /d "C:\Program Files\obs-studio\bin\64bit" "" obs64.exe --startstreaming
pause
