@echo off
setlocal ENABLEDELAYEDEXPANSION
::Author: Derek Mandl
::Date: 5/13/2021
::OS: This will only work on a windows machine obviously and has only been tested in Windows 10.  You could probably modify it easily to work with any Win version.
::Purpose: This program is a killswitch for your ether miner.  i.e. if your GPU gets too hot this killswitch will prevent it from burning out
::Instructions: MSI Afterburner allows you to run a script if your GPU temperature exits a specific range
::i.e. you tell MSI to launch this program if the value leaves the range [0, 89] and the killswitch will shut the miner down and allow the GPU to recover.
::MSI Afterburner Settings(gear icon) > monitoring > GPU temperature graph properties > alarm when value is out of range (set values here) > ... > launch application on alarm(check) > path(set to this file).
::Set your properties in this file, set the killswitch in MSI afterburner as described above, then run your miner as you normally would and you are good to go!
::I reccomend testing it out with a low timer first to make sure you typed everything correctly.
::By using this software you accept all responsibility for damage to your hardware.  I am in no way responsible whatsoever for any damage caused or anything else, really.
::Enjoy!

::miner::
::must be set equal to the execuatable name in tasklist
::if in doubt, run the miner and find it with "tasklist" in cmd.  This is NOT its name in task manager.
::ex: teamredminer.exe t-rex.exe phoenixminer.exe
set miner=teamredminer.exe

::run address::
::your command for running your miner
set run=C:\Users\dmand\mining\teamredminer-v0.8.2.1-win\teamredminer.exe -a ethash -o stratum+tcp://us2.ethermine.org:4444 -u 0x960cA39E571E5a8B79263d87272b4Bc3109B7d61.rx6700tx

::timer::
::the amount of time you wish to wait before restarting in seconds
::600s is 10 minutes.  Your GPU should be cooled down by then but you can change this to be safer/more dangerous.
::Warning!  I do not know what will happen if the GPU is still out of temp range when the miner reboots.  It may not trigger the killswitch and burn out.
set timer=10

taskkill /IM %miner% /F
ping localhost -n %timer% >nul
call %run%	
endlocal