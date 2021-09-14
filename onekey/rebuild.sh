#/bin/bash
echo
echo
echo "本脚本仅适用于在Ubuntu环境下编�?https://github.com/kenzok78/Bulid_Wrt"
echo
echo

if [ "$USER" == "root" ]; then
	echo
	echo
	echo "请勿使用root用户编译，换一个普通用户吧~~"
	sleep 3s
	exit 0
fi

echo
echo

clear

rm -Rf openwrt/common openwrt/files openwrt/devices
svn export https://github.com/kenzok78/Bulid_Wrt/trunk/devices openwrt/devices
cd openwrt

git checkout .
git pull

[ $(grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/.*DEVICE_(.*)=y/\1/') == generic ] && {
 firmware=$(grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/CONFIG_TARGET_(.*)_DEVICE_.*=y/\1/')
 } || { firmware=$(grep '^CONFIG_TARGET.*DEVICE.*=y' .config | sed -r 's/.*DEVICE_(.*)=y/\1/')
 }

if [ $firmware == "x86_64" ]; then
	firmware="x86_64"
elif [ $firmware == "friendlyarm_nanopi-r2s" ]; then
	firmware="nanopi-r2s"
elif [ $firmware == "friendlyarm_nanopi-r4s" ]; then
	firmware="nanopi-r4s"
elif [ $firmware == "rpi-4" ]; then
	firmware="Rpi-4B"
elif [ $firmware == "d-team_newifi-d2" ]; then
	firmware="newifi-d2"
else
	echo "无法识别固件类型,请退�?
fi

echo

read -p "请输入后台地址 [回车默认192.168.3.1]: " ip
ip=${ip:-"192.168.3.1"}
echo "您的后台地址�? $ip"

rm -Rf feeds package/feeds common files diy tmp
make clean
[ -f ".config" ] && mv .config .config.bak
cp -rf devices/common/* ./
cp -rf devices/$firmware/* ./
if [ -f "devices/common/diy.sh" ]; then
		chmod +x devices/common/diy.sh
		/bin/bash "devices/common/diy.sh"
fi
if [ -f "devices/$firmware/diy.sh" ]; then
		chmod +x devices/$firmware/diy.sh
		/bin/bash "devices/$firmware/diy.sh"
fi
cp -Rf ./diy/* ./
if [ -f "devices/common/default-settings" ]; then
	sed -i 's/192.168.3.1/$ip/' devices/common/default-settings
	cp -f devices/common/default-settings package/*/*/default-settings/files/uci.defaults
fi
if [ -f "devices/$firmware/default-settings" ]; then
	sed -i 's/192.168.3.1/$ip/' devices/$firmware/default-settings
	cat devices/$firmware/default-settings >> package/*/*/default-settings/files/uci.defaults
fi
if [ -n "$(ls -A "devices/common/patches" 2>/dev/null)" ]; then
          find "devices/common/patches" -type f -name '*.patch' ! -name '*.revert.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -p1 --forward"
fi
if [ -n "$(ls -A "devices/$firmware/patches" 2>/dev/null)" ]; then
          find "devices/$firmware/patches" -type f -name '*.patch' ! -name '*.revert.patch' -print0 | sort -z | xargs -I % -t -0 -n 1 sh -c "cat '%'  | patch -d './' -p1 --forward"
fi
[ -f ".config.bak" ] && cp -f .config.bak .config || {
cp -f devices/common/.config .config
echo >> .config
cat devices/$firmware/.config >> .config
}

[ firmware == "other" ] || {
while true; do
read -p "是否增删插件? [y/N]: " YN
case ${YN:-N} in
	[Yy])
		make menuconfig
	echo ""
	;;
	[Nn]) 
	make defconfig
		break
	;;
esac
done
}
echo
echo
echo "                      *****5秒后开始编�?****

1.你可以随时按Ctrl+C停止编译

3.大陆用户编译前请准备好梯�?使用大陆白名单或全局模式"
echo
echo
sleep 3s

sed -i 's,$(STAGING_DIR_HOST)/bin/upx,upx,' package/feeds/custom/*/Makefile

make -j$(($(nproc)+1)) download v=s ; make -j$(($(nproc)+1)) || make -j1 V=s

if [ "$?" == "0" ]; then
echo "

编译完成~~~

初始后台地址: $ip
初始用户名密�? root  root

"
fi

