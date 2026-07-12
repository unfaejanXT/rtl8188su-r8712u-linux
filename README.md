# Driver r8712u Standalone (Realtek RTL8188SU USB WiFi)

Repositori ini berisi source code driver **`r8712u`** untuk perangkat USB WiFi **Realtek RTL8188SU** (USB ID `0bda:8171`) yang dikemas secara mandiri (*standalone/out-of-tree*) agar dapat dikompilasi dan dipasang pada kernel Linux modern (seperti kernel LTS 6.18+).

---

## Cara Kompilasi & Instalasi

### 1. Prasyarat
Pastikan sistem Anda sudah terpasang paket kernel headers dan compiler (seperti `clang` atau `gcc`).

### 2. Kompilasi
Gunakan `clang` jika kernel Anda dikompilasi menggunakan Clang (seperti pada distribusi CachyOS):
```bash
make LLVM=1
```
Jika kernel Anda menggunakan GCC:
```bash
make
```

### 3. Pemasangan (Install)
Gunakan `pkexec` (atau `sudo`) untuk memasang modul driver ke direktori modul kernel:
```bash
pkexec make install
```

### 4. Pemuatan Modul
Muat driver ke dalam kernel:
```bash
pkexec modprobe r8712u
```

---

## Tanya Jawab (F.A.Q.)

### Q: Apakah driver `r8712u-standalone` ini mendukung arsitektur ARM64?
**A:** **Ya, sangat mendukung.**
Driver ini dikembangkan menggunakan API standar kernel Linux yang bersifat portabel (*multi-platform*). Driver ini tidak mengandung instruksi *assembly* spesifik x86/x86_64, sehingga dapat dikompilasi dan digunakan langsung pada perangkat ARM64 (seperti Raspberry Pi 3/4/5 dengan OS 64-bit) dengan perintah kompilasi yang sama, selama kernel headers versi ARM64 sudah terpasang.

### Q: Dari mana asal source code driver ini dan mengapa tidak ada di kernel 6.18 bawaan?
**A:** **Source code ini diambil langsung dari repositori resmi kernel Linux.**
* **Asal Kode:** Kode sumber ini diekstrak dari direktori `drivers/staging/rtl8712` pada kernel stabil versi `v6.12` sebelum driver ini dihapus secara permanen.
* **Mengapa tidak ada di kernel 6.18+?** 
  1. **Dihapus oleh Kernel Developer:** Karena RTL8188SU adalah perangkat lawas (rilis ~2009) dan kodenya sudah usang (*deprecated*), para pengembang kernel Linux telah menghapus driver bawaan `r8712u` secara permanen mulai dari kernel versi **6.13**.
  2. **Kebijakan Distribusi (CachyOS/Arch):** Distribusi Linux modern sering kali mematikan kompilasi untuk driver staging lama demi performa, keamanan, dan efisiensi ukuran kernel.

### Q: Apa hubungan antara RTL8188SU dengan pencarian driver `r8712u`?
**A:** **RTL8188SU adalah nama produk, sedangkan RTL8712U adalah arsitektur chipset internalnya.**
* **Nama Komersial vs Chipset:** RTL8188SU adalah nama pemasaran USB dongle Anda. Di dalamnya, perangkat ini menggunakan chip silikon berbasis arsitektur **RTL8712U** (huruf **U** berarti menggunakan antarmuka USB).
* **Driver Tunggal:** Realtek membuat driver tunggal bernama **`r8712u`** yang bisa menangani seluruh keluarga chip berbasis RTL8712U (seperti RTL8188SU, RTL8191SU, dan RTL8192SU) agar lebih efisien.
* **USB ID Match:** Di dalam kode driver `r8712u`, terdapat tabel pencocokan identitas perangkat yang mendaftarkan USB ID milik RTL8188SU (`0bda:8171`) sebagai perangkat yang didukung oleh driver ini.

---

## Sumber & Referensi

1. **Kode Sumber Driver:** Diambil dari repositori resmi Linux Kernel Staging Tree versi `6.12.y`:
   - [Linux Kernel Staging Drivers - RTL8712](https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/staging/rtl8712?h=v6.12.9)
2. **Referensi Penghapusan Driver:** Commit perubahan penghapusan driver staging `r8712u` pada kernel mainline versi `6.13-rc1`.
3. **Firmware:** File firmware `rtl8712u.bin` disediakan oleh paket hulu `linux-firmware` resmi di bawah direktori `/lib/firmware/rtlwifi/`.
