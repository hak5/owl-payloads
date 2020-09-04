# A basic bluetooth scanner

Scans for bluetooth devices, and optionally interrogates them (using hcitool info).

## 1. Hardware

Tested with Hak5's "Mini USB Bluetooth Adapter" (Uses the Qualcomm CSR8510 chipset).

## 2. Configuration Variables

Where to write our output (loot):
```
LOOT_DIR=/root/loot/bluetooth_scan
```
Where scan results should go (using unix timestamp for uniqueness):
```
BT_OUTFILE=`date +%s`.bt.list
```
Where interrogation results should go (using unix timestamp for uniqueness):
```
BT_INFOFILE=`date +%s`.bt.info
```
Your bluetooth device, probably hci0:
```
BTDEV=hci0
```
Setting DEBUG to 1 will result in a lot more output to console and to /tmp/payload.log (does not survive reboot)
```
DEBUG=0
```
Setting INTERROGATE to 1 enables running hcitool info on all discovered devices, and logging to BT_INFOFILE, on by default.
```
INTERROGATE=1
```
Set a custom MAC address for the bluetooth device
```
BT_CUSTOM_MAC="DE:AD:BE:EF:13:37"
```
Set a custom name for the bluetooth device
```
BT_CUSTOM_NAME="DedSec"
```

## 3. Sample output

### a. The loot directory

...should look like this:
```
root@Owl:~/loot/bluetooth_scan# ls -al
drwxr-xr-x    2 root     root             0 Aug  7 10:21 .
drwxr-xr-x    3 root     root             0 Aug  7 08:48 ..
-rw-r--r--    1 root     root             0 Aug  7 10:21 1565173272.bt.info
-rw-r--r--    1 root     root           153 Aug  7 10:24 1565173272.bt.list
```
### b. Basic scan details

Bluetooth MACs are logged when first seen, with a timestamp. I'm not sure if the clock is ever right, but the 'startup' time gives a frame of reference.
```
root@Owl:~/loot/bluetooth_scan# cat 1565172658.bt.list
Wed Aug  7 10:10:59 UTC 2019    Startup
Wed Aug  7 10:18:25 UTC 2019            F8:38:80:B0:AA:AA       iPhone
Wed Aug  7 10:19:10 UTC 2019            30:21:19:C5:AA:BB       SCR1986BT-AS
```

### c. Interrogation results

If INTERROGATE=1, you'll get the results of hcitool info here.

```
root@Owl:~/loot/bluetooth_scan# cat 1565172658.bt.info
Begin F8:38:80:B0:AA:AA ----------------------
Requesting information ...
        BD Address:  F8:38:80:B0:AA:AA
        Device Name: iPhone
        LMP Version: 5.0 (0x9) LMP Subversion: 0x4307
        Manufacturer: Broadcom Corporation (15)
        Features page 0: 0xbf 0xfe 0xcf 0xfe 0xdb 0xff 0x7b 0x87
                <3-slot packets> <5-slot packets> <encryption> <slot offset>
                <timing accuracy> <role switch> <sniff mode> <RSSI>
                <channel quality> <SCO link> <HV2 packets> <HV3 packets>
                <u-law log> <A-law log> <CVSD> <paging scheme> <power control>
                <transparent SCO> <broadcast encrypt> <EDR ACL 2 Mbps>
                <EDR ACL 3 Mbps> <enhanced iscan> <interlaced iscan>
                <interlaced pscan> <inquiry with RSSI> <extended SCO>
                <EV4 packets> <EV5 packets> <AFH cap. slave>
                <AFH class. slave> <LE support> <3-slot EDR ACL>
                <5-slot EDR ACL> <sniff subrating> <pause encryption>
                <AFH cap. master> <AFH class. master> <EDR eSCO 2 Mbps>
                <EDR eSCO 3 Mbps> <3-slot EDR eSCO> <extended inquiry>
                <LE and BR/EDR> <simple pairing> <encapsulated PDU>
                <err. data report> <non-flush flag> <LSTO> <inquiry TX power>
                <EPC> <extended features>
        Features page 1: 0x0f 0x00 0x00 0x00 0x00 0x00 0x00 0x00
        Features page 2: 0x7f 0x0f 0x00 0x00 0x00 0x00 0x00 0x00
Begin 30:21:19:C5:BB:BB ----------------------
Requesting information ...
        BD Address:  30:21:19:C5:BB:BB
        Device Name: SCR1986BT-AS
        LMP Version: 3.0 (0x5) LMP Subversion: 0x1f4
        Manufacturer: CONWISE Technology Corporation Ltd (66)
        Features page 0: 0xbf 0x3a 0x85 0xfa 0x98 0x1d 0x59 0x87
                <3-slot packets> <5-slot packets> <encryption> <slot offset>
                <timing accuracy> <role switch> <sniff mode> <RSSI> <SCO link>
                <HV2 packets> <HV3 packets> <CVSD> <power control>
                <broadcast encrypt> <EDR ACL 2 Mbps> <enhanced iscan>
                <interlaced iscan> <interlaced pscan> <inquiry with RSSI>
                <extended SCO> <AFH cap. slave> <AFH class. slave>
                <3-slot EDR ACL> <5-slot EDR ACL> <pause encryption>
                <AFH cap. master> <AFH class. master> <extended inquiry>
                <simple pairing> <encapsulated PDU> <non-flush flag> <LSTO>
                <inquiry TX power> <EPC> <extended features>
        Features page 1: 0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00
```
