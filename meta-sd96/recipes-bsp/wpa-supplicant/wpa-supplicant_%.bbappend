FILESEXTRAPATHS_append := "${THISDIR}/files:"
  
SRC_URI += "file://wpa_supplicant_no_open.conf"


do_install_append() {
    rm ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant
    install -m 755 ${WORKDIR}/wpa-supplicant.sh ${D}${sysconfdir}/network/if-post-down.d/wpa-supplicant
    ln -s ../if-post-down.d/wpa-supplicant ${D}${sysconfdir}/network/if-pre-up.d/wpa-supplicant

    install -m 600 ${WORKDIR}/wpa_supplicant_no_open.conf ${D}${sysconfdir}/wpa_supplicant.conf
}

