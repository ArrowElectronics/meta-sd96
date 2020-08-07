FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0003-at91bootstrap-sd96.patch"

COMPATIBLE_MACHINE = 'sama5d27-sd96'

AT91BOOTSTRAP_CONFIG_sama5d27-sd96 ??= "${AT91BOOTSTRAP_MACHINE}sd_uboot"
AT91BOOTSTRAP_LOAD_sama5d27-sd96 ??= "sdboot-uboot"

