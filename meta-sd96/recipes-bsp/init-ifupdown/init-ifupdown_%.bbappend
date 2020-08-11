FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI += "file://interfaces.wifi_ap"
SRC_URI += "file://interfaces.wifi_station"


do_install_append() {
    rm ${D}${sysconfdir}/network/interfaces
    install -m 0644 ${WORKDIR}/interfaces* ${D}${sysconfdir}/network/
    ln -sf interfaces.wifi_station ${D}${sysconfdir}/network/interfaces
}

FILES_${PN} += "${sysconfdir}/network/interfaces.wifi_ap"
FILES_${PN} += "${sysconfdir}/network/interfaces.wifi_station"

