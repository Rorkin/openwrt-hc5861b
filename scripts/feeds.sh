#!/bin/bash
set -e

echo "==========================================="
echo "  Adding Passwall2 feeds"
echo "==========================================="

# 检查是否已有 passwall 相关源（ImmortalWrt 可能自带）
if grep -q "passwall" feeds.conf.default 2>/dev/null; then
  echo "ℹ️  Passwall feeds already present in ImmortalWrt"
  cat feeds.conf.default
else
  cat >> feeds.conf.default << 'EOF'
src-git passwall_packages https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git;main
src-git passwall2 https://github.com/Openwrt-Passwall/openwrt-passwall2.git;main
EOF
  echo "✅ Passwall2 feeds added"
fi

echo ""
echo "--- feeds.conf.default ---"
cat feeds.conf.default
echo "---------------------------"
