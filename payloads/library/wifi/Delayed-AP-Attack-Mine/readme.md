# Delayed AP Attack Mine
### Set your fuse, make a quick getaway, and let your Signal Owl crack WiFi while everyone else is gone
---
Turn your Signal Owl into a powerful implant by using Besside-ng to attack networks. Besside-ng is an amazing application that aggressively attacks WiFi networks and obtains a hash for cracking offline. In the unlikely event WEP is found, it is cracked immediately. Your Signal Owl already has it installed - but this particular payload delays the attack so you don't have to be present when it runs (or even better when no one is at the target area at all).

An external WiFi adapter is required for this payload. The Hak5 RT5370 was tested and works perfectly.

**WARNING: This program is very aggressive: ensure you are on sound legal ground and only run it if your rules of engagement allow such attacks. Research your target beforehand to ensure you do not have collateral damage.**

*Setup*
1. Boot into ARMING mode
2. Copy the payload to /root/payload.txt
3. Enable to run by:
   `chmod +x payload.txt`
4. Open the payload with nano
5. Change the START_IN value to be length of your "delay fuse" in seconds - this is your time to make your exit, stage left
6. Change the GATHER_FOR value to be the length you want besside-ng to run. Consider your target's level of attention accordingly
7. Set the BSSID if you want to only attack a specific network
8. Save, exit, and shutdown.

The mine is ready for implant.

*Deploy*
1. Connect the WiFi adapter
2. Place the Signal Owl at your target. Once booted and on it will stay steady red until the payload runs
3. Set your watch and leave
4. After the timer is up, besside-ng will run for the specified time during which the LED will flash slightly in ATTACK pattern.
5. After the run, the Signal Owl will power off (LED will of couse be off as well).

*Gather Loot*
1. All loot is found in the /root/loot directory
2. To extract hashes, use:
   `aircrack-ng -J filebase capturefile.cap`
3. Use your favorite password cracker to obtain the passphrase - YMMV based on passphrase difficulty. May I recommend byepass for ease of use?

