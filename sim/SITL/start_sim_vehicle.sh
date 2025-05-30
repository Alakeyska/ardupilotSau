#!/bin/sh
AIRPORT=KSFO #ULLI - Pulkovo
sim_vehicle.py -v ArduPlane -L $AIRPORT --enable-fgview --console --map --mavproxy-args="--load-module=joystick"