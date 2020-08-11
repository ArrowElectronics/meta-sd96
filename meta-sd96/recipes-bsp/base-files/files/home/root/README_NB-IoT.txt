    Setting up NB-IoT connection

    This image for Shield96 has support for Shiratech LTE CAT-M1/NB1 96boards
format mezzanine board. PPP connection can be started through the Quectel BG96
module found on the mezzanine board. This image has support for Arkessa and
1NCE SIM cards. By default the 1NCE SIM card is used.
    If the Shiratech NB-IoT mezzanine is connected and 1NCE SIM card is
inserted the following command initiates the internet connection through the
ppp0 interface:
      # ifup ppp0
    And this command shuts it down:
      # ifdown ppp0

    If the Arkessa SIM card is inserted one needs to edit
/etc/ppp/peers/quectel-chat-connect and select the correct APN (see the given
file for comments). If another SIM card is used one needs to modify this file
according to the SIM card providers instructions.




    WiFi AP mode

    Internet sharing through NB-IoT in WiFi access point mode is also
supported. The "ifup ppp0" command automatically enables internet sharing
when WiFi AP mode is active.




    A note on power consumption

    During normal operation the Shiratech NB-IoT mezzanine draws a lot of
current. It is advised to connect both micro-USB device connectors of Shield96
to the PC to support increased current demand.

