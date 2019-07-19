#!/bin/bash
#
# Title: WIFI_CONNECT
# Description: Simplifies WiFi client mode connection. Expects $WIFI_SSID and $WIFI_PASS
# Author: Hak5Darren

function WIFI_CONNECT() {
    logger running extension: wifi_connect
    ifconfig wlan0 up;sleep 2
    echo -e "network={\nssid=\"$WIFI_SSID\"\npsk=\"$WIFI_PASS\"\npriority=1\n}">/tmp/wpa.conf
    wpa_supplicant -B -Dnl80211 -i wlan0 -c /tmp/wpa.conf
    while(iwconfig wlan0 | grep Not-Associated); do sleep 1; done
    udhcpc -i wlan0
}
export -f WIFI_CONNECT
