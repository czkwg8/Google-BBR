# Google-BBR
BBR congestion control algorithm

This repository will build the kernel modules (BBR and Fair Queue traffic policing).

Added BBR_POWERED.c and fq_codel.c on 2018.11.2

# How to Use
Make sure you have the same version kernel headers as your kernel installed 

then

    git clone https://github.com/czkwg8/Google-BBR
    cd Google-BBR
    make && make install

If you found a warning was treated as an error,you may need to install gcc-4.9.

After the installion,enable the modules ( You could try fq_codel and bbr_powered as well )

    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p

Check if BBR is working

    lsmod | grep bbr
    sysctl net.ipv4.tcp_available_congestion_control
    sysctl net.ipv4.tcp_congestion_control