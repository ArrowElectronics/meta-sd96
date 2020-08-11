FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI += "file://hostapd.init"
SRC_URI += "file://hostapd.conf"

INITSCRIPT_PARAMS = "disable"

do_install_append() {
    install -m 755 ${WORKDIR}/hostapd.init ${D}${sysconfdir}/init.d/hostapd
    install -m 755 ${WORKDIR}/hostapd.conf ${D}${sysconfdir}/
}

