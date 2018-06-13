# Google-BBR
BBR congestion control algorithm

This repository will build the kernel module.

# How to Use
Make sure you have the same version kernel headers as your kernel installed 

then

    git clone https://github.com/czkwg8/Google-BBR
    cd Google-BBR
    make && make install

If you found a warning was treated as an error,you may need to install gcc-4.9.

After the installion,enable the module

    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p

Check if BBR is working

    lsmod | grep bbr
    sysctl net.ipv4.tcp_available_congestion_control
    sysctl net.ipv4.tcp_congestion_control