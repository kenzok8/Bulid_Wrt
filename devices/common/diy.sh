#!/bin/bash
#=================================================
shopt -s extglob

[ ! -f feeds.conf ] && {
sed -i '$a src-git kenzok8 https://github.com/kenzok8/jell.git;main' feeds.conf.default
}

sed -i "s?targets/%S/packages?targets/%S/\$(LINUX_VERSION)?" include/feeds.mk

sed -i '/	refresh_config();/d' scripts/feeds

./scripts/feeds update -a
./scripts/feeds install -a -p kenzok8 -f
./scripts/feeds install -a

echo "$(date +"%s")" >version.date
sed -i '/$(curdir)\/compile:/c\$(curdir)/compile: package/opkg/host/compile' package/Makefile
sed -i 's/$(TARGET_DIR)) install/$(TARGET_DIR)) install --force-overwrite --force-depends/' package/Makefile
sed -i "s/DEFAULT_PACKAGES:=/DEFAULT_PACKAGES:=luci-app-advanced luci-app-firewall luci-app-gpsysupgrade luci-app-opkg luci-app-upnp luci-app-autoreboot \
luci-app-wizard luci-base luci-compat luci-lib-ipkg luci-lib-fs \
coremark wget-ssl curl htop nano zram-swap kmod-lib-zstd kmod-tcp-bbr bash openssh-sftp-server block-mount resolveip ds-lite swconfig /" include/target.mk
sed -i "s/procd-ujail//" include/target.mk

sed -i "s/^.*vermagic$/\techo '1' > \$(LINUX_DIR)\/.vermagic/" include/kernel-defaults.mk

mv -f feeds/kenzok8/r81* tmp/

sed -i "s/192.168.1.1/192.168.1.252/" package/feeds/kenzok8/base-files/files/bin/config_generate
sed -i "s/192.168.1.1/192.168.1.252/" package/base-files/files/bin/config_generate

(
svn co https://github.com/coolsnowwolf/lede/trunk/target/linux/generic/hack-5.10 target/linux/generic/hack-5.10
rm -rf target/linux/generic/hack-5.10/{220-gc_sections*,781-dsa-register*,780-drivers-net*,996-fs-ntfs3*,100-update-mtk_wed_h.patch}
) &

sed -i "/BuildPackage,miniupnpd-iptables/d" feeds/packages/net/miniupnpd/Makefile
sed -i 's/\/cgi-bin\/\(luci\|cgi-\)/\/\1/g' `find package/feeds/kenzok8/luci-*/ -name "*.lua" -or -name "*.htm*" -or -name "*.js"` &
sed -i 's/Os/O2/g' include/target.mk
sed -i "/mediaurlbase/d" package/feeds/*/luci-theme*/root/etc/uci-defaults/*
sed -i 's/=bbr/=cubic/' package/kernel/linux/files/sysctl-tcp-bbr.conf

# find target/linux/x86 -name "config*" -exec bash -c 'cat kernel.conf >> "{}"' \;
sed -i 's/max_requests 3/max_requests 20/g' package/network/services/uhttpd/files/uhttpd.config
#rm -rf ./feeds/packages/lang/{golang,node}
sed -i "s/tty\(0\|1\)::askfirst/tty\1::respawn/g" target/linux/*/base-files/etc/inittab

date=`date +%m.%d.%Y`
sed -i -e "/\(# \)\?REVISION:=/c\REVISION:=$date" -e '/VERSION_CODE:=/c\VERSION_CODE:=$(REVISION)' include/version.mk

sed -i \
	-e "s/+\(luci\|luci-ssl\|uhttpd\)\( \|$\)/\2/" \
	-e "s/+nginx\( \|$\)/+nginx-ssl\1/" \
	-e 's/+python\( \|$\)/+python3/' \
	-e 's?../../lang?$(TOPDIR)/feeds/packages/lang?' \
	package/feeds/kenzok8/*/Makefile

(
if [ -f sdk.tar.xz ]; then
	sed -i 's,$(STAGING_DIR_HOST)/bin/upx,upx,' package/feeds/kenzok8/*/Makefile
	mkdir sdk
	tar -xJf sdk.tar.xz -C sdk
	cp -rf sdk/*/staging_dir/* ./staging_dir/
	rm -rf sdk.tar.xz sdk
	sed -i '/\(tools\|toolchain\)\/Makefile/d' Makefile
	if [ -f /usr/bin/python ]; then
		ln -sf /usr/bin/python staging_dir/host/bin/python
	else
		ln -sf /usr/bin/python3 staging_dir/host/bin/python
	fi
	ln -sf /usr/bin/python3 staging_dir/host/bin/python3
fi
) &
