#!/bin/bash
# Run as root.

DTS=cape-bone-julius-00A0.dts
DTBO=cape-bone-julius-00A0.dtbo

if [ ! -f ./dts/$DTS ] ; then
    echo "Can't find the DTS file - $DTS"
    exit 1
fi

echo "Compiling $DTS"
dtc -O dtb -o ./dts/$DTBO -b 0 -@ ./dts/$DTS

PINS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pins
SLOTS=/sys/devices/bone_capemgr.*/slots

echo
echo "Copying dtbo file to /lib/firmware"
cp ./dts/$DTBO /lib/firmware

echo
echo "Loading Overlays - am33xx_pwm"
echo "am33xx_pwm" > $SLOTS
cat $SLOTS

echo
echo "Loading Overlays - cape-bone-julius"
echo "cape-bone-julius" > $SLOTS
cat $SLOTS

echo
echo "All done"