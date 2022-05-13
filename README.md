### Bulid_Wrt 官方源码
[1]: https://img.shields.io/badge/license-GPLV2-brightgreen.svg
[2]: /LICENSE
[3]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg
[4]: https://github.com/kenzok78/Bulid_Wrt/pulls
[5]: https://img.shields.io/badge/Issues-welcome-brightgreen.svg
[6]: https://github.com/kenzok78/Bulid_Wrt/issues/new
[7]: https://img.shields.io/github/v/release/hyird/Action-Openwrt
[8]: https://github.com/kenzok78/Bulid_Wrt/releases
[10]: https://img.shields.io/badge/Contact-telegram-blue
[11]: https://t.me/joinchat/JjxmyRZZXJWb74I-sCrryA
[12]: https://github.com/kenzok78/Bulid_Wrt/workflows/autobuild/badge.svg
[13]: https://github.com/kenzok78/Bulid_Wrt/actions

[![license][1]][2]
[![GitHub Stars](https://img.shields.io/github/stars/kenzok78/Bulid_Wrt.svg?style=flat-square&label=Stars)](https://github.com/kenzok78/Bulid_Wrt/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/kenzok78/Bulid_Wrt.svg?style=flat-square&label=Forks)](https://github.com/kenzok78/Bulid_Wrt)
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

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/kenzok78/Bulid_Wrt?style=for-the-badge&label=Download)](https://github.com/kenzok78/Bulid_Wrt/actions)

##### 特色:

+ 官网源码,内核5.15 最新源码同步.

+ 原生纯净,包含ipv6,主流开源插件.

+ 针对国内特殊网络环境,自定义优化.

+ 清爽主题argon,nginx可玩性扩展.

+ 无需专业知识,云编译定制编译固件.

+ 持续更新,定时自动云编译更新固件.

##### 关于Secrets,TOKEN的小知识

* 云编译需要 [在此](https://github.com/settings/tokens) 创建个token,然后在此仓库Settings->Secrets中添加个名字为REPO_TOKEN的Secret,填入token值

* 在仓库Settings->Secrets中添加 SCKEY 可通过[Server酱](http://sc.ftqq.com) 推送编译结果到微信

* 在仓库Settings->Secrets中添加 TELEGRAM_CHAT_ID, TELEGRAM_TOKEN 可推送编译结果到Telegram Bot

[另外仓库| 四个主流代码x86固件编译](https://github.com/kenzok78/Build-OpenWrt)

##### 默认插件包含:

+ Opkg 软件包管理
+ ssr-plus
+ openclash
+ passwall
+ bypass
+ UPNP 自动端口转发
+ Turbo ACC 网络加速

##### 默认后台地址 192.168.1.252,密码 root