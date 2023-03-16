# AX6S

## Flash firmware

- Flash `miwifi_rb03_firmware_stable_1.2.7.bin` with `MIWIFIRepairTool.x86.zip`
- `telnet 192.168.31.1` and move *.factory.bin to `/tmp` , password can be calculate by `S/N`
- excute code below

    ```bash
    nvram set ssh_en=1 & nvram set uart_en=1 & nvram set boot_wait=on & nvram set bootdelay=3 & nvram set flag_try_sys1_failed=0 & nvram set flag_try_sys2_failed=1

    nvram set flag_boot_rootfs=0 & nvram set "boot_fw1=run boot_rd_img;bootm"

    nvram set flag_boot_success=1 & nvram commit & /etc/init.d/dropbear enable & /etc/init.d/dropbear start

    # excute in ssh
    # python -m http.server
    mtd -r write /tmp/*.factory.bin firmware
    ```

## After install

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

## Optimize

another driver of wifi

```bash
# https://github.com/openwrt/mt76/blob/master/firmware/mt7915_eeprom.bin
cp /tmp/mt7915_eeprom.bin /lib/firmware/mediatek/
rmmod /lib/modules/5.10.111/mt7915e.ko
insmod mt7915e
dmesg | tail
```
