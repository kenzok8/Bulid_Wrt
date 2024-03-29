### Bulid_Wrt 官方源码
[1]: https://img.shields.io/badge/license-GPLV2-brightgreen.svg
[2]: /LICENSE
[3]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg
[4]: https://github.com/kenzok8/Bulid_Wrt/pulls
[5]: https://img.shields.io/badge/Issues-welcome-brightgreen.svg
[6]: https://github.com/kenzok8/Bulid_Wrt/issues/new
[7]: https://img.shields.io/github/v/release/hyird/Action-Openwrt
[8]: https://github.com/kenzok8/Bulid_Wrt/releases
[10]: https://img.shields.io/badge/Contact-telegram-blue
[11]: https://t.me/joinchat/JjxmyRZZXJWb74I-sCrryA
[12]: https://github.com/kenzok8/Bulid_Wrt/actions/workflows/Bulid_Wrt.yml/badge.svg
[13]: https://github.com/kenzok8/Bulid_Wrt/actions

[![license][1]][2]
[![GitHub Stars](https://img.shields.io/github/stars/kenzok8/Bulid_Wrt.svg?style=flat-square&label=Stars)](https://github.com/kenzok8/Bulid_Wrt/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/kenzok8/Bulid_Wrt.svg?style=flat-square&label=Forks)](https://github.com/kenzok8/Bulid_Wrt)
[![PRs Welcome][3]][4]
[![Issue Welcome][5]][6]
[![AutoBuild][12]][13]

<a href="https://t.me/joinchat/JjxmyRZZXJWb74I-sCrryA" target="_blank">Telegram</a>

##### 源码来源：
[![garypang13](https://img.shields.io/badge/autoBuild-garypang13-red.svg?style=flat&logo=appveyor)](https://github.com/garypang13/OpenWrt)
 [![Lienol](https://img.shields.io/badge/passwall-openwrt-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/xiaorouji/openwrt-passwall) 
[![immortalwrt](https://img.shields.io/badge/immortalwrt-openwrt-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt) 
[![Lean](https://img.shields.io/badge/package-Lean-success.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede)
##### 固件下载:

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/kenzok8/Bulid_Wrt?style=for-the-badge&label=固件下载)](https://github.com/kenzok8/Bulid_Wrt/releases/latest)


##### 固件下载链接

- [openwrt ](https://op.dllkids.xyz/op/firmware/)

### 默认插件包含:

+ SSR Plus
+ openclash
+ 动态DDNS
+ UPNP 自动端口转发
+ 默认多个主题
+ 默认管理 IP: 192.168.1.252, 用户名 root，密码 password

* 修改默认ip

```bash
sed -i 's/192.168.1.1/192.168.3.1/g' package/base-files/files/bin/config_generate
```
* 删除原主题	
```bash
rm -rf package/lean/luci-theme-argon
```

* 添加新的主题
```bash
git clone https://github.com/kenzok8/luci-theme-ifit.git package/lean/luci-theme-ifit
```
* 添加常用软件包
```bash
git clone https://github.com/kenzok8/openwrt-packages.git package/openwrt-packages
```
* 删除默认密码
```bash
sed -i "/CYXluq4wUazHjmCDBCqXF/d" package/lean/default-settings/files/zzz-default-settings
```

* 取消bootstrap为默认主题	
```bash
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
```
