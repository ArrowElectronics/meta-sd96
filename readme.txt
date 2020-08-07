    meta-sd96 layer will create various uSD card images running on the Shield96
board. It is possible to boot from NOR flash + uSD card or only from uSD card.



    Creating hostapd-image

    For creating the build environment one needs to use the 'repo' tool which
is available in most Linux distributions. The build process will follow the
"meta-atmel" way, only the build environment initialization is different and
simpler. See meta-atmel: https://github.com/linux4sam/meta-atmel/tree/warrior

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
      $ source oe-init-build-env build-sd96
      $ bitbake core-image-minimal

