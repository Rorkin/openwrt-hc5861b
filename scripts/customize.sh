#!/bin/bash
set -e

echo "==========================================="
echo "  Customizing HC5861B (极路由3 Pro R33)"
echo "==========================================="

CFG="package/base-files/files/bin/config_generate"

if [ ! -f "$CFG" ]; then
  echo "❌ config_generate not found"
  exit 1
fi

# =========================================
# 1. LAN IP → 192.168.10.1
# =========================================
sed -i 's/192\.168\.1\.1/192.168.10.1/g' "$CFG"
grep -q "192.168.10.1" "$CFG" && echo "✅ LAN IP → 192.168.10.1" || { echo "❌ IP change failed"; exit 1; }

# =========================================
# 2. 主机名
# =========================================
sed -i "s/hostname='OpenWrt'/hostname='HiWiFi-3Pro'/g" "$CFG"
sed -i "s/hostname='ImmortalWrt'/hostname='HiWiFi-3Pro'/g" "$CFG"
echo "✅ Hostname → HiWiFi-3Pro"

# =========================================
# 3. 时区 → 中国
# =========================================
sed -i "s/timezone='UTC'/timezone='CST-8'/g" "$CFG"
if ! grep -q "zonename='Asia/Shanghai'" "$CFG"; then
  sed -i "/timezone='CST-8'/a\\\t\tset system.@system[0].zonename='Asia/Shanghai'" "$CFG"
fi
echo "✅ Timezone → CST-8"

echo "==========================================="
echo "  Done"
echo "==========================================="
