#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default

# Uncomment a feed source
# sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default
sed -i '$a src-git helloworld https://github.com/fw876/helloworld' feeds.conf.default

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# Add openclash package
rm -rf ~/master.zip && rm -rf ~/OpenClash-master && rm -rf openwrt/package/luci-app-openclash
wget https://github.com/vernesong/OpenClash/archive/master.zip -O ~/master.zip
unzip ~/master.zip -d ~/
# Workflow has been cd to openwrt dir, just cp to package dir
# cd openwrt
# $GITHUB_WORKSPACE/$DIY_P1_SH
cp -r ~/OpenClash-master/luci-app-openclash package/

#mkdir package/luci-app-openclash
#cd package/luci-app-openclash
#git init
#git remote add -f origin https://github.com/vernesong/OpenClash.git
#git config core.sparsecheckout true
#echo "luci-app-openclash" >> .git/info/sparse-checkout
#git pull origin master
#git branch --set-upstream-to=origin/master master
#cd ../../
