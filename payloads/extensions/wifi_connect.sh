#!/bin/bash
#
# Title: WIFI_CONNECT
# Description: Simplifies WiFi client mode connection. Expects $WIFI_SSID and $WIFI_PASS
# Author: Hak5Darren

function WIFI_CONNECT() {
    [[ "x$WIFI_INT" == "x" ]] && WIFI_INT=wlan0
    ifconfig $WIFI_INT up;sleep 10
    echo -e "network={\nssid=\"$WIFI_SSID\"\npsk=\"$WIFI_PASS\"\npriority=1\n}">/tmp/wpa-$WIFI_INT.conf
    wpa_supplicant -B -Dnl80211 -i $WIFI_INT -c /tmp/wpa-$WIFI_INT.conf
    while(iwconfig $WIFI_INT | grep Not-Associated); do sleep 1; done
    udhcpc -i $WIFI_INT
}
export -f WIFI_CONNECT
