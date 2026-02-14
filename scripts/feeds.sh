#!/bin/bash
set -e

echo "==========================================="
echo "  Adding Passwall2 feeds"
echo "==========================================="

# Passwall 代理核心包（hysteria, sing-box, chinadns-ng 等）
echo "src-git passwall_packages https://github.com/xiaorouji/openwrt-passwall-packages.git;main" >> feeds.conf.default

# Passwall2 LuCI 应用
echo "src-git passwall2 https://github.com/xiaorouji/openwrt-passwall2.git;main" >> feeds.conf.default

echo ""
echo "--- feeds.conf.default ---"
cat feeds.conf.default
echo "---------------------------"
