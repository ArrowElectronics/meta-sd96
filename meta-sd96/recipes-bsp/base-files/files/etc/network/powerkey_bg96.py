#!/usr/bin/python3

import os
import os.path
import sys
import time

cmd_on="echo 1 > /sys/class/gpio/PB24/value"
cmd_off="echo 0 > /sys/class/gpio/PB24/value"

def usage( ret ):
  print( "Usage: powerkey_bg96 <x ms>" )
  sys.exit( ret )

def pulse( ms ):
  os.system( cmd_on )
  time.sleep( ms / 1000.0 )
  os.system( cmd_off )

if len(sys.argv) < 2 :
  usage(1)

ms=int(sys.argv[1])
print( "%d ms pulse" % ms )

# do the RESET
if not os.path.exists("/sys/class/gpio/PB14") :
  os.system("echo 46 > /sys/class/gpio/export")
os.system("echo out > /sys/class/gpio/PB14/direction")
os.system("echo 1 > /sys/class/gpio/PB14/value")
time.sleep(1)
os.system("echo 0 > /sys/class/gpio/PB14/value")

# now the pulse on POWER_KEY
if not os.path.exists("/sys/class/gpio/PB24") :
  os.system("echo 56 > /sys/class/gpio/export")
os.system("echo out > /sys/class/gpio/PB24/direction")
os.system(cmd_off)

time.sleep(1)
pulse(ms)
time.sleep(4)

