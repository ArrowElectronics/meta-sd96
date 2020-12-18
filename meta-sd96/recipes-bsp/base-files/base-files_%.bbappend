FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://etc/init.d/protect_links.sh"
SRC_URI += "file://etc/issue"
SRC_URI += "file://etc/udhcpd_usb0.conf"
SRC_URI += "file://etc/udhcpd_wlan0.conf"
SRC_URI += "file://etc/iptables/share_eth0"
SRC_URI += "file://etc/iptables/share_ppp0"
SRC_URI += "file://etc/network/powerkey_bg96.py"
SRC_URI += "file://etc/modules-load.d/wilc-sdio.conf"
SRC_URI += "file://etc/modules-load.d/ppp-generic.conf"
SRC_URI += "file://etc/modules-load.d/g_ether.conf"
SRC_URI += "file://home/root/README_WIFI.txt"
SRC_URI += "file://home/root/README_NB-IoT.txt"
SRC_URI += "file://home/root/README_BUILD.txt"
SRC_URI += "file://etc/ppp/peers/quectel-chat-connect"
SRC_URI += "file://etc/ppp/peers/quectel-chat-disconnect"
SRC_URI += "file://etc/ppp/peers/quectel-ppp"
SRC_URI += "file://etc/ppp/peers/quectel-ppp-kill"

RDEPENDS_${PN} += "python3-core"

hostname = "shield96"

do_install_append () {
    install -d ${D}${sysconfdir}/init.d
    install -d ${D}${sysconfdir}/rc5.d
    install -m 755 ${WORKDIR}/etc/init.d/protect_links.sh ${D}${sysconfdir}/init.d/
    ln -s ../init.d/protect_links.sh ${D}${sysconfdir}/rc5.d/S21protect_links

    install -m 644 ${WORKDIR}/etc/issue ${D}${sysconfdir}/
    install -m 644 ${WORKDIR}/etc/udhcpd_usb0.conf ${D}${sysconfdir}/
    install -m 644 ${WORKDIR}/etc/udhcpd_wlan0.conf ${D}${sysconfdir}/

    install -d ${D}${sysconfdir}/iptables
    install -m 644 ${WORKDIR}/etc/iptables/share* ${D}${sysconfdir}/iptables/

    install -d ${D}${sysconfdir}/network/if-up.d
    install -m 755 ${WORKDIR}/etc/network/powerkey_bg96.py ${D}${sysconfdir}/network/

    install -d ${D}${sysconfdir}/modules-load.d
    install -m 644 ${WORKDIR}/etc/modules-load.d/* ${D}${sysconfdir}/modules-load.d/

    install -d ${D}${base_prefix}/home/root
    install -m 644 ${WORKDIR}/home/root/README_WIFI.txt ${D}${base_prefix}/home/root/README_WIFI.txt
    install -m 644 ${WORKDIR}/home/root/README_NB-IoT.txt ${D}${base_prefix}/home/root/README_NB-IoT.txt
    install -m 644 ${WORKDIR}/home/root/README_BUILD.txt ${D}${base_prefix}/home/root/README_BUILD.txt

    install -d ${D}${sysconfdir}/ppp/peers
    install -m 644 ${WORKDIR}/etc/ppp/peers/* ${D}${sysconfdir}/ppp/peers/

    cat >> ${D}${sysconfdir}/fstab <<EOF

/dev/mmcblk0p3 swap swap defaults 0 0

EOF
}

FILES_${PN} += "${sysconfdir}/init.d/protect_links.sh"
FILES_${PN} += "${sysconfdir}/issue"
FILES_${PN} += "${sysconfdir}/rc5.d/S21protect_links"
FILES_${PN} += "${sysconfdir}/udhcpd_usb0.conf"
FILES_${PN} += "${sysconfdir}/udhcpd_wlan0.conf"
FILES_${PN} += "${sysconfdir}/iptables/share_eth0"
FILES_${PN} += "${sysconfdir}/iptables/share_ppp0"
FILES_${PN} += "${sysconfdir}/network/powerkey_bg96.py"
FILES_${PN} += "${sysconfdir}/modules-load.d/wilc-sdio.conf"
FILES_${PN} += "${sysconfdir}/modules-load.d/ppp-generic.conf"
FILES_${PN} += "${sysconfdir}/modules-load.d/g_ether.conf"
FILES_${PN} += "${base_prefix}/home/root/README_WIFI.txt"
FILES_${PN} += "${base_prefix}/home/root/README_NB-IoT.txt"
FILES_${PN} += "${base_prefix}/home/root/README_BUILD.txt"
FILES_${PN} += "${sysconfdir}/ppp/peers/quectel-chat-connect"
FILES_${PN} += "${sysconfdir}/ppp/peers/quectel-chat-disconnect"
FILES_${PN} += "${sysconfdir}/ppp/peers/quectel-ppp"
FILES_${PN} += "${sysconfdir}/ppp/peers/quectel-ppp-kill"

