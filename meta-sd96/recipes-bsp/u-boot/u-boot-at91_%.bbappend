FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-sdmmc1-fix.patch"
SRC_URI += "file://0002-u-boot-hd96.patch"

COMPATIBLE_MACHINE = 'sama5d27-hd96'

