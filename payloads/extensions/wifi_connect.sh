#!/bin/bash
#
# Title: WIFI_CONNECT
# Description: Simplifies WiFi client mode connection from internal radio. Expects $WIFI_SSID (network name) and $WIFI_PASS (wpa key)
# Author: Hak5Darren
# Version: 1.0

function WIFI_CONNECT() {
    echo -e "network={\nssid=\"$WIFI_SSID\"\npsk=\"$WIFI_PASS\"\npriority=1\n}">/tmp/wpa.conf
    wpa_supplicant -B -Dnl80211 -i wlan0 -c /tmp/wpa.conf
    ifconfig $WIFI_RADIO up
    udhcpc -i $WIFI_RADIO
}
export -f WIFI_CONNECT
