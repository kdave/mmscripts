#!/bin/bash

# stolen from marvin, which_distro.sh did not work on oSF

VERIFY=$1

zypper refresh
sudo zypper remove -y gnu-netcat
PACKAGE_LIST="autoconf automake patch gcc bison make 
		libaio-devel libopenssl-devel numactl
		libstdc++-devel zlib-devel flex libtool gcc-c++ 
		libaio-devel libncurses5 ncurses-devel	
		expect pcre-devel blktrace sysstat	
		binutils-devel expect-devel gcc-fortran		
		zlib-devel
		libdw-devel
		slang-devel
		scons
		glibc-devel-static glibc-devel-static-32bit	
		dstat git git-core libcgroup1 xfsprogs		
		coreutils dmidecode
		xfsprogs-devel
		libattr-devel libacl-devel
		libevent-devel
		latencytop
		libxml2-devel xz-devel smartmontools
		hwloc hwloc-devel libxml++-devel
		perf perl-Math-Round
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
