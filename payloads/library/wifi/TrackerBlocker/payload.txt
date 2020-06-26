#!/usr/bin/env python

# This script generates high volume of 802.11 Probe Requests frames.
# Each frame have uniq random source MAC.
# It use Scapy http://www.secdev.org/projects/scapy/ for frames crafting.
# You need injection supported device.

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR) # Disable IPv6 warnings

from scapy.all import sendp,Dot11,RadioTap,RandMAC
import sys

device = "nothing"
interval = 0.5

# check arguments
args = sys.argv

for index, a in enumerate(args):
	if a == "-h" or a == "--help":
		print(" ")
		print("This program is intended to confuse wifi trackers. -d is required")
		print("-d    Specify wifi card capible of packet injection")
		print("-t    Specify how often probes should be sent. 0 for as fast as possible, leave empty for 0.5")
		print(" ")
		print("Example: sudo python spammer.py -d wlan0mon -t 1")
		exit()
	if a == "-d":
		# Injection device
		device = args[index + 1]
	if a == "-t":
		# Time betwen frames send. Set 0 to unlimited
		interval = float(args[index + 1])

if device == "nothing":
	print(" ")
	print("must specify an injection device with -d")
	exit()

print 'Press CTRL+C to Abort'

sendp(RadioTap()/
      Dot11(type=0,subtype=4,
      addr1=RandMAC(),
      addr2=RandMAC(),
      addr3=RandMAC()),
      iface=device,loop=1,inter=interval)
