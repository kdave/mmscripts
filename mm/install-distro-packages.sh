#!/bin/bash

# stolen from marvin, which_distro.sh did not work on oSF

VERIFY=$1

zypper refresh
sudo zypper remove -y gnu-netcat
PACKAGE_LIST="autoconf automake patch gcc bison make 
		libaio-devel libopenssl-devel mono numactl
		openmpi openmpi-devel python-numpy unzip
		libstdc++-devel zlib-devel flex libtool gcc-c++ 
		libaio-devel  libncurses5 ncurses-devel	
		expect systemtap pcre-devel blktrace sysstat	
		binutils-devel expect-devel gcc-fortran		
		vim-enhanced zlib-devel libdwarf-devel		
		libdw-devel audit-devel libunwind-devel		
		slang-devel gtk2-devel python-devel		
		command-not-found libvirt virt-manager qemu 
		kvm kernel-default-devel popt-devel scons nbd	
		libhugetlbfs libhugetlbfs-32bit	hdparm
		glibc-devel-static glibc-devel-static-32bit	
		dstat git git-core libcgroup1 xfsprogs		
		coreutils dmidecode gengetopt gnuplot
		xfsprogs-devel dosfstools ntfsprogs		
		libattr-devel libacl-devel oprofile		
		libnuma-devel gcc-32bit gcc-fortran-32bit	
		openmpi-devel openmpi-32bit libevent-devel	
		screen latencytop pigz ntfs-3g iotop
		libxml2-devel xz-devel smartmontools hdparm
		hwloc hwloc-devel libxml++-devel R-base
		man-pages recode psmisc virt-install
		libvirt-client perf perl-Math-Round
		iperf"
for PACKAGE in $PACKAGE_LIST; do
	zypper install -y $PACKAGE
done

if [ "$VERIFY" != "" ]; then
	# Will pass through silently unless unusual action is required
	# such as downgrading packages due to autoyast weirdness
	for PACKAGE in $PACKAGE_LIST; do
		zypper install $PACKAGE
	done
fi
