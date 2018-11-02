obj-m += tcp_bbr.o
obj-m += sch_fq.o
obj-m += sch_fq_codel.o

all:
		make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

clean:
		make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
		install tcp_bbr.ko /lib/modules/$(shell uname -r)/kernel/net/ipv4
		install sch_fq.ko /lib/modules/$(shell uname -r)/kernel/net/sched
		install sch_fq_codel.ko /lib/modules/$(shell uname -r)/kernel/net/sched
		insmod /lib/modules/$(shell uname -r)/kernel/net/ipv4/tcp_bbr.ko
		insmod /lib/modules/$(shell uname -r)/kernel/net/sched/sch_fq.ko
		insmod /lib/modules/$(shell uname -r)/kernel/net/sched/sch_fq_codel.ko
		depmod -a