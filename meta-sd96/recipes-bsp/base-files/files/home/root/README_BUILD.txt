    meta-sd96 layer will create various uSD card images running on the Shield96
board. It is possible to boot from NOR flash + uSD card or only from uSD card.



    Creating hostapd-image

    For creating the build environment one needs to use the 'repo' tool which
is available in most Linux distributions. The build process will follow the
"meta-atmel" way, only the build environment initialization is different and
simpler. See meta-atmel: https://github.com/linux4sam/meta-atmel/tree/dunfell

    The required steps:
    - create a working directory and enter it
    - initialize the build folders by issuing:
      $ repo init -u https://github.com/bkardosa/meta-sd96.git -b dunfell
      $ repo sync

    - the above commands may display various warning or error messages which can be ignored if the
      last displayed lines look like this:
        Fetching projects: 100% (8/8), done.
        Checking out projects: 100% (8/8), done.

    - the following commands need to be executed for rebuilding the image:
      $ cd poky
      $ export TEMPLATECONF=${TEMPLATECONF:-../meta-atmel/conf}
      $ export MACHINE=sama5d27-sd96
      $ source oe-init-build-env build-sd96
      $ bitbake hostapd-image

    Rebuilding the image will take 1-2 hours or more depending on machine and
internet speed and require around 25GiB disk space.




    Creating uSD card image

    - copy initial filesystem image to uSD card:
      $ cd tmp/deploy/images/sama5d27-sd96/
      $ sudo dd if=hostapd-image-sama5d27-sd96.wic bs=1M of=/dev/sdX && sync
      where /dev/sdX is the location of an UNMOUNTED uSD card

    Booting from uSD card

    - insert uSD card
    - open J3
    - connect J10 to PC
    - start TeraTerm or similar terminal emulator, configure the COM port to
      115200,N81
    - after reboot one can log in as 'root', no password



    Writing at91bootstrap into NOR flash and booting from NOR

    - prepare at91bootstrap for SAM-BA (still in .../tmp/deploy/images/sama5d27-sd96 folder ):
      $ cp at91bootstrap.bin <SAM-BA folder>

    - on Shield96 board remove J3, remove uSD card, connect J10 to PC and press nRST
    - on PC execute:
      sam-ba.exe -p serial:COM37 -d sama5d2 -a bootconfig -c readcfg:bscr -c readcfg:bureg0

    - shorten J3, then execute
      sam-ba.exe -p serial:COM37 -d sama5d2 -a qspiflash:1:2:66 -c erase::0x100000
      sam-ba.exe -p serial:COM37 -d sama5d2 -a qspiflash:1:2:66 -c write:at91bootstrap.bin
      sam-ba.exe -p serial:COM37 -d sama5d2 -a bootconfig -c writecfg:bureg0:QSPI0_DISABLED,QSPI1_IOSET2,SPI0_DISABLED,SPI1_DISABLED,NFC_DISABLED,SDMMC0_DISABLED,SDMMC1,UART1_IOSET1,JTAG_IOSET3,EXT_MEM_BOOT
      sam-ba.exe -p serial:COM37 -d sama5d2 -a bootconfig -c writecfg:bscr:bureg0,valid

    - open TeraTerm for COM37, configure it to 115200,N81
    - insert uSD card into Shield96
    - press nRST
    - smile :)
    (sometimes Linux gets faster to the login prompt if an ethernet cable is connected)
