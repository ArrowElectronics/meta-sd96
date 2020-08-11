FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI += "file://sysctl.conf.ip_forward"

do_install_append() {
        install -m 0644 ${WORKDIR}/sysctl.conf.ip_forward ${D}${sysconfdir}/sysctl.conf
}
