# OpenWrt 23.05.5 — 极路由3 Pro + Passwall2 Hysteria2

## 硬件

| 项目 | 参数 |
|---|---|
| 型号 | HiWiFi R33 / HC5861B / C312B B52 |
| CPU | MT7620A 单核 580MHz (mipsel_24kc) |
| RAM | 128MB DDR2 |
| Flash | 128MB NAND |
| 交换芯片 | RTL8367RB (千兆) |
| WiFi | 2.4G (MT7620内置) + 5G (MT7612EN) |
| USB | USB 2.0 |

## 固件参数

| 项目 | 值 |
|---|---|
| 默认 IP | `192.168.10.1` |
| 默认密码 | 无 (首次登录设置) |

## 编译

1. Fork 本仓库
2. Actions → Build OpenWrt HC5861B Hysteria2 → Run workflow
3. 等待 2~3 小时
4. Release 页面下载固件

## 刷机

### Breed 下
上传 `sysupgrade.bin`（NAND 设备通常用 sysupgrade）

### OpenWrt 下
```bash
sysupgrade -v /tmp/openwrt-*-sysupgrade.bin
