@echo off
setlocal ENABLEDELAYEDEXPANSION
::Author: Derek Mandl
::Date: 5/13/2021
::readme.md for instructions of usage

::miner::
::must be set equal to the execuatable name in microsoft tasklist
::This is NOT the name of the program in task manager.  It is the name of the .exe file you run for your miner.
::ex: teamredminer.exe t-rex.exe phoenixminer.exe
set miner=teamredminer.exe

::run command::
::your command for running your miner
set run=C:\Users\dmand\mining\teamredminer-v0.8.2.1-win\teamredminer.exe -a ethash -o stratum+tcp://us2.ethermine.org:4444 -u 0x960cA39E571E5a8B79263d87272b4Bc3109B7d61.rx6700tx

::timer::
::the amount of time you wish to wait before restarting in seconds
::600s is 10 minutes.  Your GPU should be cooled down by then but you can change this to be safer/more dangerous.
::Warning!  I do not know what will happen if the GPU is still out of temp range when the miner reboots.  It may not trigger the killswitch and burn out.
set timer=600

taskkill /IM %miner% /F
ping localhost -n %timer% >nul
call %run%	
endlocal