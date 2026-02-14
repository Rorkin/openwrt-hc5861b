#!/bin/bash
set -e

echo "==========================================="
echo "  Customizing HC5861B (极路由3 Pro R33)"
echo "==========================================="

CFG="package/base-files/files/bin/config_generate"

if [ ! -f "$CFG" ]; then
  echo "❌ config_generate not found: $CFG"
  exit 1
fi

# =========================================
# 1. 默认 LAN IP → 192.168.10.1
# =========================================
sed -i 's/192\.168\.1\.1/192.168.10.1/g' "$CFG"
if grep -q "192.168.10.1" "$CFG"; then
  echo "✅ Default LAN IP → 192.168.10.1"
else
  echo "❌ Failed to change LAN IP"
  exit 1
fi

# =========================================
# 2. 主机名
# =========================================
sed -i "s/hostname='OpenWrt'/hostname='HiWiFi-3Pro'/g" "$CFG"
echo "✅ Hostname → HiWiFi-3Pro"

# =========================================
# 3. 时区 → 中国
# =========================================
sed -i "s/timezone='UTC'/timezone='CST-8'/g" "$CFG"
if ! grep -q "zonename='Asia/Shanghai'" "$CFG"; then
  sed -i "/timezone='CST-8'/a\\\t\tset system.@system[0].zonename='Asia/Shanghai'" "$CFG"
fi
echo "✅ Timezone → CST-8 (Asia/Shanghai)"

echo "==========================================="
echo "  Customization complete"
echo "==========================================="
