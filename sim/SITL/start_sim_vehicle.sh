#!/bin/sh
AIRPORT=KSFO #ULLI - Pulkovo
sim_vehicle.py -v ArduPlane -f plane-3d -L $AIRPORT --enable-fgview --console --map --mavproxy-args="--load-module=joystick"

# --osd