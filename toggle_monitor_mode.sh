# /bin/bash

# ! Root required !
# Takes one argument as interface name (example: wlp1s0)

IFACE=$1

set_mode_monitor(){
    service NetworkManager stop && \
    ip link set $IFACE down && \
    iw dev $IFACE set type monitor && \
    ip link set $IFACE up
}


set_mode_managed(){
    ip link set $IFACE down && \
    iw dev $IFACE set type managed && \
    ip link set $IFACE up && \
    service NetworkManager start
}

if [ ${IFACE:0:1} == "w" ]; then
    if [ $(iw dev | grep -c managed) == 1 ]; then
       set_mode_monitor && \
       echo "Monitor mode for $IFACE Enabled"
    else
        set_mode_managed && \
        echo "Monitor mode for $IFACE Disabled"
    fi
else
    echo "$IFACE is not a wireless interface!"
fi

