#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/bootdevice/by-name/recovery:100663296:0f5bc6d1eb1b7853dd98087ead2ad0ab78f3adfe; then
  applypatch  \
          --patch /vendor/recovery-from-boot.p \
          --source EMMC:/dev/block/bootdevice/by-name/boot:100663296:31b8dc32909db2e52ac666c1deaedda3cb8e08b3 \
          --target EMMC:/dev/block/bootdevice/by-name/recovery:100663296:0f5bc6d1eb1b7853dd98087ead2ad0ab78f3adfe && \
      log -t recovery "Installing new oppo recovery image: succeeded" && \
      setprop ro.recovery.updated true || \
      log -t recovery "Installing new oppo recovery image: failed" && \
      setprop ro.recovery.updated false
else
  log -t recovery "Recovery image already installed"
  setprop ro.recovery.updated true
fi
