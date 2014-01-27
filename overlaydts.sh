#!/bin/bash

export SLOTS=/sys/devices/bone_capemgr.9/slots
export PINS=/sys/kernel/debug/pinctrl/44e10800.pinmux/pins

echo "Copying dts files - "

sudo su
cd /lib/firmware
echo am33xx_pwm > $SLOTS
echo cape-bone-julius > $SLOTS