FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI += "file://0001-sama5d27-hd96-dt.patch"

COMPATIBLE_MACHINE = 'sama5d27-hd96'
KERNEL_MODULE_AUTOLOAD = "atmel_usba_udc"

