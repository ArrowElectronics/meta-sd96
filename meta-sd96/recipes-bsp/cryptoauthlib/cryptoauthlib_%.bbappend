FILESEXTRAPATHS_append := "${THISDIR}/files:"

SRC_URI += "file://cryptoauthlib.module"
SRC_URI += "file://0.conf"
SRC_URI += "file://slot.conf.tmpl"
SRC_URI += "file://pkcs11.conf"

do_install_append() {
    install -d ${D}${localstatedir}/lib/cryptoauthlib
    install -m 755 ${WORKDIR}/0.conf ${D}${localstatedir}/lib/cryptoauthlib/
    install -m 755 ${WORKDIR}/slot.conf.tmpl ${D}${localstatedir}/lib/cryptoauthlib/
    install -d ${D}${base_prefix}/home/root/.config/pkcs11/modules
    install -m 755 ${WORKDIR}/cryptoauthlib.module ${D}${base_prefix}/home/root/.config/pkcs11/modules/
    install -d ${D}${sysconfdir}/pkcs11
    install -m 755 ${WORKDIR}/pkcs11.conf ${D}${sysconfdir}/pkcs11/
}

FILES_${PN} += "/var/lib/cryptoauthlib/0.conf"
FILES_${PN} += "/var/lib/cryptoauthlib/slot.conf.tmpl"
FILES_${PN} += "/home/root/.config/pkcs11/modules/cryptoauthlib.module"
FILES_${PN} += "/etc/pkcs11/pkcs11.conf"

