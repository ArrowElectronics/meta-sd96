#!/bin/sh
### BEGIN INIT INFO
# Provides:             protect_links
# Required-Start:
# Required-Stop:
# Default-Start:        5
# Default-Stop:
### END INIT INFO

echo 1 > /proc/sys/fs/protected_hardlinks
echo 1 > /proc/sys/fs/protected_symlinks
