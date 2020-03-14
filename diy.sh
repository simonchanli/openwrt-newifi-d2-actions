#!/bin/bash
#=================================================
# Description: DIY script
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#=================================================

# Modify default IP
sed -i 's/192.168.1.1/192.168.123.1/g' package/base-files/files/bin/config_generate

# Add SSID 2.5G
sed -i '/channel="11"/a\\t\tssid="OpenWrt"' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# ADD SSID 5.0G
sed -i '/channel="36"/a\\t\t\tssid="OpenWrt_5G"' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default SSID
sed -i 's/OpenWrt/${ssid}/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# Modify default encryption
sed -i 's/none/psk-mixed/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh

# ADD default wifi password
sed -i '/set wireless.default_radio${devidx}.encryption=psk-mixed/a\\t\t\tset wireless.default_radio${devidx}.key=password' package/kernel/mac80211/files/lib/wifi/mac80211.sh
