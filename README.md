# 极路由3 Pro (HC5861B/R33) — Passwall2 Hysteria2

## ⚠️ 为什么用 ImmortalWrt 而不是官方 OpenWrt

极路由3 Pro (HC5861B) 使用 **128MB NAND Flash**，
而官方 OpenWrt 只收录了 HC5861（16MB NOR Flash）。

两者 Flash 类型完全不同，固件不能通用。

**ImmortalWrt** 基于官方 OpenWrt，增加了 HC5861B 的 NAND 支持。

## 硬件

| 项目 | 参数 |
|---|---|
| 型号 | HiWiFi R33 / HC5861B / 极路由3 Pro |
| CPU | MT7620A 580MHz (mipsel_24kc) |
| RAM | 128MB DDR2 |
| Flash | **128MB NAND** (非 NOR) |
| 交换芯片 | RTL8367RB 千兆 |
| WiFi | 2.4G (MT7620内置) + 5G (MT7612EN) |

## 默认参数

| 项目 | 值 |
|---|---|
| IP | `192.168.10.1` |
| 密码 | 无 |

## 编译

1. Fork → Actions → Run workflow
2. 等 2~3 小时
3. Release 下载

## 刷机（必须有 Breed）

1. 路由器断电
2. 按住 Reset 不放，插电
3. 等 5 秒松开，电脑访问 `192.168.1.1`
4. Breed → 固件更新 → 上传固件
5. 刷完访问 `192.168.10.1`

## Passwall2 配置 Hysteria2

1. 登录 `192.168.10.1`
2. 服务 → PassWall2 → 节点列表 → 添加
3. 类型选 **Hysteria2**
4. 填写服务器地址、端口、密码
5. 基本设置 → 开启主开关
6. TCP/UDP 节点都选你的 Hysteria2 节点
7. 所有连接路由器的设备自动走代理
