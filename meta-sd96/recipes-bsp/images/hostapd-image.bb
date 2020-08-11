DESCRIPTION = "A console-only image with more full-featured Linux system \
functionality installed."

IMAGE_FEATURES += "ssh-server-openssh"
IMAGE_ROOTFS_SIZE = "3670016"

PACKAGECONFIG_append_pn-gnutls = " p11-kit"
MACHINE_EXTRA_RRECOMMENDS += "kernel-modules"

IMAGE_INSTALL_append_sama5d2 = " nodejs nodejs-npm greengrass"

IMAGE_INSTALL = "\
    packagegroup-core-boot \
    packagegroup-core-full-cmdline \
    packagegroup-core-buildessential \
    packagegroup-base-wifi \
    packagegroup-base-bluetooth \
    packagegroup-base-usbgadget \
    kernel-modules \
    kmod \
    python3 \
    python3-pip \
    openssl \
    openssl-bin \
    cmake \
    libp11 \
    libp11-dev \
    gnutls-bin \
    opkg \
    opkg-utils \
    ppp \
    mchp-wireless-firmware \
    udev \
    git \
    ethtool \
    p11-kit \
    hidapi \
    python3-asn1crypto \
    python3-cffi \
    python3-click \
    python3-cryptography \
    python3-cryptoauthlib \
    cryptoauthlib \
    cryptoauthlib-dev \
    python3-flask \
    python3-pyserial \
    python3-can \
    python3-smbus \
    python3-spidev \
    python3-wrapt \
    mpio \
    python3-evdev \
    boost \
    boost-dev \
    hostapd \
    iptables \
    cronie \
    ppp \
    minicom \
    nano \
    ${CORE_IMAGE_EXTRA_INSTALL} \
    "

inherit core-image
