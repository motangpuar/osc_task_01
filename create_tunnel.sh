#!/bin/bash

create_tunnel() {

    # ip tuntap add dev tun_cu-du mode tap
    # ip tuntap add dev tun_cu-amf mode tap
    # ip tuntap add dev tun_du-cu mode tap
    # ip tuntap add dev tun_rf-ue mode tap

    # ip link add $if_local type veth peer name $if_bridge

    ip link add tun_cu-du type veth 
    ip link add tun_cu-amf type veth
    ip link add tun_du-cu type veth
    ip link add tun_rf-ue type veth
    
    ip addr add 192.168.35.12/24 dev tun_cu-du
    ip addr add 192.168.35.13/24 dev tun_du-cu
    ip addr add 192.168.34.12/24 dev tun_cu-amf
    #ip addr add 192.168.34.12/24 dev tun_cu-amf
    
    ip link set tun_cu-du master oai_br0
    ip link set tun_du-cu master oai_br0
    ip link set tun_cu-amf master oai_br0
    
    ip link set up dev tun_cu-du
    ip link set up dev tun_du-cu
    ip link set up dev tun_cu-amf
}

clean_tunnel() {
    ip link del tun_cu-du
    ip link del tun_du-cu
    ip link del tun_cu-amf
    ip link del tun_rf-ue
}

if [ "$#" -eq 0 ]
then
    echo "No arguments supplied"
    exit 1
else
    if [ "$1" == "create" ]
    then
        create_tunnel;
    fi

    if [ "$1" == "clean" ]
    then
        clean_tunnel;
    fi
fi
