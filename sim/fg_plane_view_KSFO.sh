#!/bin/sh
AIRPORT=KSFO #ULLI - Pulkovo
AUTOTESTDIR=$(dirname $0)

# nice fgfs \
#     --native-fdm=socket,in,10,,5503,udp \
#     --fdm=external \
#     --aircraft=Rascal110-JSBSim \
#     --fg-aircraft="$AUTOTESTDIR/aircraft" \
#     --airport=$AIRPORT \
#     --geometry=650x550 \
#     --bpp=32 \
#     --disable-hud-3d \
#     --disable-horizon-effect \
#     --timeofday=noon \
#     --disable-fullscreen \
#     --disable-random-objects \
#     --disable-ai-models \
#     --fog-disable \
#     --disable-specular-highlight \
#     --disable-anti-alias-hud \
#     --prop:/sim/terrasync/http-server=http://flightgear.sourceforge.net/scenery \
#     --wind=0@0 \
#     $*


nice fgfs \
    --native-fdm=socket,in,60,,5503,udp \
    --fdm=external \
    --aircraft=Rascal110-JSBSim \
    --fg-aircraft="$AUTOTESTDIR/aircraft" \
    --airport=$AIRPORT \
    --geometry=650x550 \
    --disable-hud-3d \
    --timeofday=noon \
    --disable-fullscreen \
    --prop:/sim/terrasync/http-server=http://flightgear.sourceforge.net/scenery \
    --wind=0@0 \
    $*

# sim_vehicle.py -v ArduPlane -L KSFO --enable-fgview --console --map

