    meta-sd96 layer will create various SD card images running on the
ATSAMA5D27-WLSOM1-EK1 board.



    Creating hostapd-image

    For creating the build environment one needs to use the 'repo' tool which
is available in most Linux distributions. The build process will follow the
"meta-atmel" way, only the build environment initialization is different and
simpler. See meta-atmel: https://github.com/linux4sam/meta-atmel/tree/dunfell

    The required steps:
    - create a working directory and enter it
    - initialize the build folders by issuing:
      $ repo init -u https://github.com/ArrowElectronics/meta-sd96.git -b dunfell-wlsom1
      $ repo sync

    - the above commands may display various warning or error messages which can be ignored if the
      last displayed lines look like this:
        Fetching projects: 100% (5/5), done.
        repo sync has finished successfully.

    - the following commands need to be executed for rebuilding the image:
      $ cd poky
      $ export TEMPLATECONF=${TEMPLATECONF:-../meta-atmel/conf}
      $ export MACHINE=sama5d27-wlsom1-ek-sd
      $ source oe-init-build-env build-wlsom1
      $ bitbake hostapd-image

    Rebuilding the image will take 1-2 hours or more depending on machine and
internet speed and require around 22GiB disk space.



    Creating SD card image

    - copy initial filesystem image to SD card:
      $ cd tmp/deploy/images/sama5d27-wlsom1-ek-sd/
      $ sudo dd if=hostapd-image-sama5d27-wlsom1.wic bs=1M of=/dev/sdX && sync
      where /dev/sdX is the location of an UNMOUNTED SD card



