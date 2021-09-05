### Actions OpenWrt Snapshot
[1]: https://img.shields.io/badge/license-GPLV2-brightgreen.svg
[2]: /LICENSE
[3]: https://img.shields.io/badge/PRs-welcome-brightgreen.svg
[4]: https://github.com/kenzok78/OpenWrt/pulls
[5]: https://img.shields.io/badge/Issues-welcome-brightgreen.svg
[6]: https://github.com/kenzok78/OpenWrt/issues/new
[7]: https://img.shields.io/github/v/release/hyird/Action-Openwrt
[8]: https://github.com/kenzok78/OpenWrt/releases
[10]: https://img.shields.io/badge/Contact-telegram-blue
[11]: https://t.me/joinchat/JjxmyRZZXJWb74I-sCrryA
[12]: https://github.com/kenzok78/OpenWrt/workflows/autobuild/badge.svg
[13]: https://github.com/kenzok78/OpenWrt/actions

[![license][1]][2]
[![GitHub Stars](https://img.shields.io/github/stars/kenzok78/OpenWrt.svg?style=flat-square&label=Stars)](https://github.com/kenzok78/OpenWrt/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/kenzok78/OpenWrt.svg?style=flat-square&label=Forks)](https://github.com/kenzok78/OpenWrt)
[![PRs Welcome][3]][4]
[![Issue Welcome][5]][6]
[![AutoBuild][12]][13]

<a href="https://t.me/joinchat/JjxmyRZZXJWb74I-sCrryA" target="_blank">Telegram</a>

##### 源码来源：
[![garypang13](https://img.shields.io/badge/autoBuild-garypang13-red.svg?style=flat&logo=appveyor)](https://github.com/garypang13/OpenWrt)
 [![Lienol](https://img.shields.io/badge/passwall-openwrt-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/xiaorouji/openwrt-passwall) 
[![immortalwrt](https://img.shields.io/badge/immortalwrt-openwrt-orange.svg?style=flat&logo=appveyor)](https://github.com/immortalwrt/immortalwrt) 
[![Lean](https://img.shields.io/badge/package-Lean-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede) 

##### 固件下载:

[![GitHub release (latest by date)](https://img.shields.io/github/v/release/kenzok78/Bulid_Wrt?style=for-the-badge&label=Download)](https://github.com/kenzok78/Bulid_Wrt/actions)
##### 特色:

+ 官网源码,内核升级到5.4. 最新源码同步.

+ 原生极致纯净,固件默认只包含基础上网功能,主流开源插件

+ 性能,友好度,易用性,插件,以及针对国内特殊环境等的自定义优化

+ 自定制清爽主题风格

+ 无需专业知识,无需linux服务器,人人皆可通过云编译定制编译自己的专属固件.

+ 持续更新, 每周日零点定时自动云编译更新固件,不用再担心因停更而需更换固件.

##### 关于Secrets、TOKEN的小知识

* 云编译需要 [在此](https://github.com/settings/tokens) 创建个token,然后在此仓库Settings->Secrets中添加个名字为REPO_TOKEN的Secret,填入token值

* 在仓库Settings->Secrets中添加 SCKEY 可通过[Server酱](http://sc.ftqq.com) 推送编译结果到微信

* 在仓库Settings->Secrets中添加 TELEGRAM_CHAT_ID, TELEGRAM_TOKEN 可推送编译结果到Telegram Bot

##### 编译触发方式: 

   + 方式1: Actions页面选择 Repo Dispatcher 点击 Run workflow
   
   + 方式2: 请在支持油猴的浏览器中安装 [脚本](https://greasyfork.org/scripts/407616-github-actions-trigger/code/Github%20Actions%20Trigger.user.js) ,仓库右上角会出现 x86_64 Actions,K2P Actions等按钮,点击对应按钮即可.
   
   + 更多玩法 [repo-dispatcher](https://github.com/tete1030/github-repo-dispatcher)

[p3terx | 云编译教程](https://p3terx.com/archives/OpenWrt-with-github-actions.html)

##### 默认插件包含:

+ Opkg 软件包管理
+ ssr-plus
+ openclash
+ passwall
+ bypass
+ dnsfilter 基于DNS的广告过滤
+ UPNP 自动端口转发
+ Turbo ACC 网络加速

##### 默认后台地址 192.168.3.1, 密码 root

##### 注意：

1. **不**要用 **root** 用户 git 和编译！！！
2. 国内用户编译前请准备好梯子,使用大陆白名单或全局模式
3. 请使用Ubuntu 64bit，推荐  Ubuntu 18 或 Ubuntu 20

##### 一键脚本:

 首次编译:
```
screen -S openwrt
wget -O compile.sh https://raw.githubusercontent.com/kenzok78/OpenWrt/master/onekey/compile.sh && bash compile.sh
```

 二次编译:
```
screen -S openwrt
wget -O recompile.sh https://raw.githubusercontent.com/kenzok78/OpenWrt/master/onekey/recompile.sh && bash recompile.sh
```




