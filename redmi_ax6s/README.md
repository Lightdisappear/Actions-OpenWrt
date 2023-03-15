# AX6S

`feeds.conf` for opkg

```bash
# ONLY for ax6s
src/gz openwrt_core https://downloads.openwrt.org/releases/22.03.3/targets/mediatek/mt7622/packages
# IMPORTANT
# add repository of correspond architecture
# 'aarch64_cortex-a53' is the architecture of the cpu
src/gz base https://downloads.openwrt.org/releases/packages-22.03/aarch64_cortex-a53/base
src/gz luci https://downloads.openwrt.org/releases/packages-22.03/aarch64_cortex-a53/luci
src/gz packages https://downloads.openwrt.org/releases/packages-22.03/aarch64_cortex-a53/packages
src/gz routing https://downloads.openwrt.org/releases/packages-22.03/aarch64_cortex-a53/routing
src/gz telephony https://downloads.openwrt.org/releases/packages-22.03/aarch64_cortex-a53/telephony
```
