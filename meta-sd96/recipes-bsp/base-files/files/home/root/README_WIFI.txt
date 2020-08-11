    Setting up WiFi in station mode
    (connecting to a WiFi AP)

    - disconnect ethernet and power up the board
    - after power up search for WiFi networks by issuing:
      # iw dev wlan0 scan | grep ssid -i

    - set network password:
      # wpa_passphrase <SSID> <password> >> /etc/wpa_supplicant.conf

    - connect to network by rebooting the board or by issuing:
      # /etc/init.d/networking restart





    Setting up WiFi in AP mode

    - after power up disable docker and enable hostapd:
      # chkconfig docker.init off
      # chkconfig hostapd on

    - change wlan0 settings
      # ln -sf interfaces.wifi_ap /etc/network/interfaces

    - now reboot the board

    After reboot the board will behave as a wireless router. If ethernet cable
is connected it will connect to the upstream ethernet link (eth0) via DHCP.
wlan0 will have a static IP address and a WiFi access point will be started on
it:
    default SSID: Shield96
    default password: Shield96
    SSID and password can be changed by modifying /etc/hostapd.conf





    Changing back to station mode when ethernet is not connected anymore:
      # chkconfig hostapd off
      # ln -sf interfaces.wifi_station /etc/network/interfaces
      # /etc/init.d/networking restart

