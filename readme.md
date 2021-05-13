# Simple Killswitch for a GPU Miner

This is a killswitch that will shutdown and restart (seconds, minutes, or hours later) a GPU cryptocurrency miner of your choice.  The killswitch is triggered by the temperature of your GPU.  Most modern GPUs have really good fans and will be completely cooled down within seconds or minutes of the miner being terminated.

This is made for someone who already has a miner setup and wants some software to watch their back.  If you are paranoid that your expensive GPUs are going to burn up when you take a vacation but still want to make some Ether, this is for you.  It's very simple and easy.

## Requirements
Some things you need before you use it
1. Windows 10.  The program could be easily modified to run on any system.  It is incredibly simple.  But this version is only tested on Windows 10, and will *probably* work on most modern Windows versions without modification.
2. MSI afterburner.  It is a free software provided by MSI.  I personally had to download it from some 3d party website (https://www.guru3d.com/files-details/afterburner-download-msi.html) because MSI's install page is busted.  You could easily write or find some other program to take Afterburner's place but this is what I use because I use GUI windows and I overclock.
3. A mining tool.  This killswitch was tested with teamredminer and t-rex.  It should work fine with any miner, as long as it can be launched from a shell. i.e.
```
teamredminer.exe -a ethash -o stratum+tcp://us2.ethermine.org:4444 -u 0x960cA39E571E5a8B79263d87272b4Bc3109B7d61.rx6700tx
```
  
## Procedure:
You must do this for every machine that you wish to be covered by the killswitch.
1. Install MSI afterburner.  Sidenote: you can use this to overclock your GPU and save power while also hashing faster.  You can read a guide about this here https://www.tomshardware.com/how-to/optimize-your-gpu-for-ethereum-mining or just google your card.  Generally if you're mining ETH you want to downsize the core clock a bit and bring the memory clock up.  Experiment with values that get the best hashrate/power consumption for you.
2. Setup your miner.  If you're here, you probably already did this.
3. Download the miner-killswitch.bat file.  You can put it anywhere you wish.
4. Configure the miner-killswitch.bat file.  If you open the file to edit, there are instructions for the configuration process.  It is not hard.
5. Optional. Test the killswitch.  Change the killswitch to have a low timer like 3.  Start your miner and double click the killswitch file.  The miner should stop and then a new instance should run.  If not, then something is not configured right.  Don't forget to change the timer back to what you want.
6. Tell MSI afterburner where the killswitch is.  Go to MSI Afterburner Settings(gear icon) > monitoring(make sure GPU temp 1 is selected) > GPU temperature graph properties > alarm when value is out of range (set values here) > ... > launch application on alarm(check) > path(set to this file)
7. Optional. Double check to make sure afterburner can use the killswitch.  Set the temp to something low [0, 60] and run the miner.  If the killswitch is activated at 60C then you're good.  Change temps back to what you want and save.
8. run your miner like normal, or just keep it running from step 7 if you did that.

That's all for this one - dman out -