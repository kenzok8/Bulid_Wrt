FROM scratch

MAINTAINER kenzok8 "https://github.com/kenzok78/Bulid_Wrt"

ADD openwrt/bin/targets/*/*/*rootfs*.tar.gz /

RUN if [[ -f /*r2s* && -f /*r4s* ]] ; then rm -rf /*{r2c,r4s}* ; fi
