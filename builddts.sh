#!/bin/bash

echo "Building dts files - "

cd ~
dtc -O dtb -o ./scripts/dts/cape-bone-julius-00A0.dtbo -b 0 -@ ./scripts/dts/cape-bone-julius-00A0.dts

sudo cp ./scripts/dts/cape-bone-julius-00A0.dtbo /lib/firmware/