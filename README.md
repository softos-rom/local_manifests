# SoftOS — local manifest (Xiaomi 17 Pro Max · `popsicle`)

**Türkçe** · [English](#english)

[SoftOS](https://t.me/softosrom), Xiaomi 17 Pro Max (`popsicle`) için **LineageOS 24** + MindTheGapps
tabanlı, gayriresmî bir ROM'dur (crDroid değildir). Bu depo, SoftOS'un **açık kaynak tabanını**
LineageOS 24 kaynağına bağlayan local manifest'i ve açık yamaları içerir.

## Depolar
| Yol | Depo | Köken |
|---|---|---|
| `device/xiaomi/popsicle` | [softos-rom/android_device_xiaomi_popsicle](https://github.com/softos-rom/android_device_xiaomi_popsicle) | [lolipuru](https://github.com/lolipuru/android_device_xiaomi_popsicle) |
| `device/xiaomi/sm8850-common` | [softos-rom/android_device_xiaomi_sm8850-common](https://github.com/softos-rom/android_device_xiaomi_sm8850-common) | [lolipuru](https://github.com/lolipuru/android_device_xiaomi_sm8850-common) |
| `device/xiaomi/popsicle-kernel` | [softos-rom/android_device_xiaomi_popsicle-kernel](https://github.com/softos-rom/android_device_xiaomi_popsicle-kernel) | stok çekirdek; başlıklar [xiaomi17-pudding-dev](https://github.com/xiaomi17-pudding-dev/device_xiaomi_pudding-kernel) |
| `hardware/xiaomi` | [softos-rom/android_hardware_xiaomi](https://github.com/softos-rom/android_hardware_xiaomi) | [xiaomi17-pudding-dev](https://github.com/xiaomi17-pudding-dev/android_hardware_xiaomi) / [LineageOS](https://github.com/LineageOS/android_hardware_xiaomi) |
| `vendor/gapps` | [MindTheGapps/vendor_gapps](https://github.com/MindTheGapps/vendor_gapps) | MindTheGapps |

## Derleme
```bash
repo init -u https://github.com/LineageOS/android.git -b lineage-24.0 --git-lfs
git clone https://github.com/softos-rom/local_manifests .repo/local_manifests
repo sync
bash .repo/local_manifests/apply-patches.sh
(cd device/xiaomi/popsicle && ./extract-files.py <stok-OS4.0.5>/images)
# stok çekirdek/DTB/modüller: device/xiaomi/popsicle-kernel/extract-files.sh
source build/envsetup.sh && breakfast popsicle && m bacon
```
Desteklenen tek taban stok HyperOS **OS4.0.5.0.XPBCNXM**'dir. Firmware ve IMEI/modem bölümlerine hiçbir zaman
yazılmaz; bootloader'ı yeniden kilitlemeyin.

## Açık yamalar (`patches/`)
- `frameworks_base/0001` — durum çubuğunda VoLTE/VoNR (HD) ve VoWiFi simgesi, yalnız IMS gerçekten sesi taşırken
  (crDroid / LibreMobileOS çalışmasından, Apache-2.0).
- `packages_apps_Launcher3/0001` — klasör şekli seçilen simge şeklini birebir alır.
- `packages_apps_Settings/0001` — kurulum sihirbazındaki yazı/görüntü boyutu kaydırıcıları değeri gösterir ve kaydeder.

## Çekirdek kaynağı
Çekirdek derlenmez, stok ön-derlenmiş imaj değiştirilmeden kullanılır. Xiaomi'nin yayımladığı kaynak:
[MiCode/Xiaomi_Kernel_OpenSource `popsicle-w-oss`](https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/popsicle-w-oss);
GKI ortak çekirdek: [android16-6.12](https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12).

## Bu depolarda olmayanlar
SoftOS'a özgü bileşenler (arka ekran uygulaması, Xiaomi kamera entegrasyonu, SoftOS arayüz/tema ve
Güncelleyici ekranları, açılış animasyonu ve diğer SoftOS özellikleri) ayrı, **kapalı kaynak** bir katmandadır
ve yayımlanmaz. Bu manifest ile derlenen ağaç, NFC, sensörler, titreşim ve Dolby dahil
donanım parçalarını içeren bir LineageOS yapılandırmasıdır.

## Lisans
Yamalar ve betikler Apache License 2.0; her deponun kendi lisansı ve dosya başlıkları geçerlidir
(çekirdek başlıkları GPL-2.0).

---

## English

[SoftOS](https://t.me/softosrom) is an unofficial ROM for the Xiaomi 17 Pro Max (`popsicle`) based on
**LineageOS 24** + MindTheGapps (not crDroid). This repository holds the local manifest that adds the
**open source base** of SoftOS to a LineageOS 24 tree, plus the open patches (see the table and build
commands above).

**Open patches:** VoLTE/VoNR (HD) and VoWiFi status bar icon shown only while IMS really carries voice
(derived from crDroid / LibreMobileOS work, Apache-2.0); Launcher3 folder shape follows the selected icon
shape; setup wizard font/display size sliders show and persist the value.

**Kernel source:** the stock prebuilt kernel is used unmodified. Xiaomi's published source:
[MiCode/Xiaomi_Kernel_OpenSource `popsicle-w-oss`](https://github.com/MiCode/Xiaomi_Kernel_OpenSource/tree/popsicle-w-oss);
GKI common kernel: [android16-6.12](https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12).

**Not included:** SoftOS-specific components (rear display app, Xiaomi camera integration, SoftOS UI/theme
and updater screens, boot animation and other SoftOS features) are a separate **closed source** layer and
are not published. A build from this manifest is a LineageOS configuration that includes the hardware
parts (NFC, sensors, vibration, Dolby).

The only supported base is stock HyperOS **OS4.0.5.0.XPBCNXM**. Firmware and IMEI/modem partitions are
never written. Never relock the bootloader.

**License:** patches and scripts Apache License 2.0; each repository keeps its own license and file headers
(kernel headers GPL-2.0).
