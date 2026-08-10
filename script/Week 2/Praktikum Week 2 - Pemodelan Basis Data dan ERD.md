# Praktikum Minggu 2 — Pemodelan Basis Data dan ERD

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data, termasuk jenis-jenis pemodelan basis data (C2).

## 1. Tujuan Praktikum

Setelah menyelesaikan praktikum, mahasiswa mampu:

1. membedakan model konseptual, logis, dan fisik;
2. mengidentifikasi entitas, atribut, dan relasi dari deskripsi kasus;
3. membedakan jenis atribut key, simple, multivalue, composite, dan derivatif;
4. menentukan derajat relasi unary, binary, atau ternary;
5. menentukan kardinalitas 1:1, 1:N, dan N:M;
6. menentukan partisipasi minimum hubungan;
7. menyelesaikan relasi N:M menggunakan entitas asosiatif;
8. membuat ERD konseptual yang konsisten dengan aturan bisnis;
9. menjelaskan diagram menggunakan kalimat yang mudah dipahami.

## 2. Alokasi Waktu

Durasi praktikum sesuai RPS adalah **1 × 170 menit**.

| Kegiatan | Waktu |
|---|---:|
| Persiapan dan pretest | 15 menit |
| Latihan identifikasi komponen model | 25 menit |
| Latihan atribut, derajat, dan kardinalitas | 35 menit |
| Analisis studi kasus Toko XYZ | 30 menit |
| Pembuatan ERD | 40 menit |
| Validasi dan perbaikan ERD | 15 menit |
| Penyusunan kesimpulan | 10 menit |

## 3. Perangkat yang Dibutuhkan

Mahasiswa dapat menggunakan salah satu alat berikut:

- diagrams.net/draw.io;
- MySQL Workbench bagian EER Diagram;
- Visual Paradigm;
- Lucidchart;
- aplikasi pemodelan lain yang disetujui dosen;
- kertas dan alat tulis untuk sketsa awal.

Simpan diagram dalam format sumber aplikasi dan ekspor hasilnya menjadi PDF atau PNG yang terbaca jelas.

## 4. Ketentuan Notasi

Gunakan satu notasi secara konsisten. Praktikum dapat menggunakan notasi Chen atau Crow's Foot.

### Notasi Chen

| Komponen | Simbol |
|---|---|
| Entitas | Persegi panjang |
| Relasi | Belah ketupat |
| Atribut | Elips |
| Atribut key | Nama atribut digarisbawahi |
| Atribut multivalue | Elips ganda |
| Atribut derivatif | Elips bergaris putus-putus |

### Notasi Crow's Foot

Entitas digambarkan sebagai kotak yang berisi nama dan atribut. Ujung garis menunjukkan minimum serta maksimum hubungan:

- lingkaran: minimum 0 atau opsional;
- garis: satu;
- kaki gagak: banyak.

Jangan mencampur simbol Chen dan Crow's Foot tanpa penjelasan.

## 5. Pretest

Jawab singkat sebelum memulai:

1. Apa perbedaan entitas dan atribut?
2. Apa fungsi primary key?
3. Apa perbedaan derajat relasi dan kardinalitas?
4. Berikan satu contoh relasi N:M.
5. Mengapa model konseptual tidak perlu memuat tipe data MySQL?

## 6. Latihan A — Tingkat Pemodelan

Perhatikan kebutuhan sistem akademik berikut:

> Sistem menyimpan mahasiswa, mata kuliah, dosen, kegiatan mengajar, KRS, dan nilai. Mahasiswa mengambil mata kuliah melalui kelas yang diajar dosen.

Lengkapi tabel:

| Tingkat | Pertanyaan | Hasil yang dibuat |
|---|---|---|
| Konseptual | Objek dan hubungan apa yang penting? | ... |
| Logis | Atribut, key, dan struktur relasional apa yang diperlukan? | ... |
| Fisik | Bagaimana struktur diterapkan pada MySQL? | ... |

### Contoh Jawaban Awal

- Konseptual: Mahasiswa mengambil Mata Kuliah; Dosen mengajar Mata Kuliah.
- Logis: `Mahasiswa(nim, nama)` dan `MataKuliah(kode_mk, nama_mk, sks)`.
- Fisik: `nim VARCHAR(15) PRIMARY KEY` pada MySQL.

Kembangkan jawaban dengan memasukkan kelas mengajar dan KRS.

## 7. Latihan B — Entitas atau Bukan Entitas

Untuk setiap istilah berikut, tentukan apakah lebih tepat menjadi entitas, atribut, relasi, atau belum dapat diputuskan tanpa kebutuhan tambahan.

| Istilah | Klasifikasi | Alasan |
|---|---|---|
| Mahasiswa | ... | ... |
| NIM | ... | ... |
| Mengambil | ... | ... |
| Alamat | ... | ... |
| Nomor telepon | ... | ... |
| Mata kuliah | ... | ... |
| Nilai | ... | ... |
| Program studi | ... | ... |

Ingat bahwa klasifikasi bergantung kebutuhan. Alamat dapat menjadi atribut composite atau entitas tersendiri jika sistem mengelola banyak alamat beserta jenis dan riwayatnya.

## 8. Latihan C — Jenis Atribut

Klasifikasikan atribut berikut:

| Atribut | Key | Simple | Multivalue | Composite | Derivatif | Penjelasan |
|---|:---:|:---:|:---:|:---:|:---:|---|
| NIM | | | | | | |
| Nama lengkap | | | | | | |
| Nomor telepon | | | | | | |
| Tanggal lahir | | | | | | |
| Umur | | | | | | |
| Alamat | | | | | | |
| Total transaksi | | | | | | |

Satu atribut dapat dipandang berbeda jika kebutuhan sistem berubah. Tuliskan asumsi yang digunakan.

## 9. Latihan D — Derajat Relasi

Klasifikasikan relasi berikut sebagai unary, binary, atau ternary:

1. Mata Kuliah memiliki prasyarat Mata Kuliah lain.
2. Dosen mengajar Mata Kuliah.
3. Pegawai membawahi Pegawai.
4. Supplier memasok Barang ke Gudang.
5. Mahasiswa menggunakan Ruangan untuk mempelajari Mata Kuliah.

Untuk relasi ternary, jelaskan apakah maknanya tetap sama jika dipecah menjadi beberapa relasi binary.

## 10. Latihan E — Kardinalitas dan Partisipasi

Ubah pernyataan berikut menjadi kardinalitas dan partisipasi minimum:

1. Satu program studi memiliki banyak mahasiswa; setiap mahasiswa harus berada pada satu program studi.
2. Satu mahasiswa dapat memiliki satu skripsi; satu skripsi harus dimiliki satu mahasiswa.
3. Seorang mahasiswa dapat mengambil banyak mata kuliah; satu mata kuliah dapat diambil banyak mahasiswa.
4. Seorang dosen dapat belum menjadi pembimbing; mahasiswa tingkat akhir harus memiliki satu pembimbing.
5. Satu pesanan harus mempunyai sedikitnya satu detail pesanan.

Tuliskan jawaban dalam dua bentuk:

- notasi, misalnya `ProgramStudi 1 ── N Mahasiswa`;
- kalimat dua arah yang menyebut kata **dapat** atau **harus**.

## 11. Studi Kasus Utama — Toko XYZ

### Deskripsi

Toko XYZ memiliki lebih dari satu gudang untuk menyimpan berbagai jenis barang. Barang di dalam gudang dikirim oleh beberapa supplier. Toko menjual berbagai barang yang dikelompokkan ke dalam kategori, termasuk pangan dan sandang.

### 11.1 Identifikasi Kebutuhan

Jawab pertanyaan berikut:

1. Data apa yang perlu disimpan tentang gudang?
2. Data apa yang perlu disimpan tentang barang?
3. Data apa yang perlu disimpan tentang supplier?
4. Apakah satu barang dapat berada di lebih dari satu gudang?
5. Apakah satu barang dapat dipasok lebih dari satu supplier?
6. Di mana jumlah stok seharusnya ditempatkan?
7. Apakah pangan dan sandang menjadi entitas terpisah atau instance Kategori?

Jika deskripsi tidak memberikan jawaban, buat asumsi yang wajar dan tuliskan secara eksplisit.

### 11.2 Entitas Awal

Gunakan entitas berikut sebagai titik awal:

- `Toko`;
- `Gudang`;
- `Barang`;
- `Supplier`;
- `Kategori`.

Tambahkan entitas asosiatif bila ditemukan relasi N:M.

### 11.3 Aturan Bisnis Minimum

Tuliskan sedikitnya delapan aturan bisnis. Contoh:

1. Satu toko memiliki satu atau banyak gudang.
2. Setiap gudang dimiliki tepat satu toko.
3. Satu gudang dapat menyimpan banyak barang.
4. Satu barang dapat disimpan di banyak gudang.
5. Jumlah stok dicatat untuk setiap pasangan gudang dan barang.
6. Satu supplier dapat memasok banyak barang.
7. Satu barang dapat dipasok oleh banyak supplier.
8. Setiap barang harus berada pada satu kategori.
9. Satu kategori dapat mempunyai banyak barang.

Aturan contoh boleh diperbaiki jika asumsi kelompok berbeda, tetapi perubahan harus dijelaskan.

### 11.4 Daftar Entitas dan Atribut

Lengkapi tabel:

| Entitas | Atribut key | Atribut non-key | Keterangan |
|---|---|---|---|
| Toko | ... | ... | ... |
| Gudang | ... | ... | ... |
| Barang | ... | ... | ... |
| Supplier | ... | ... | ... |
| Kategori | ... | ... | ... |
| Entitas asosiatif 1 | ... | ... | ... |
| Entitas asosiatif 2 | ... | ... | ... |

### 11.5 Identifikasi Relasi

Lengkapi tabel:

| Entitas A | Nama relasi | Entitas B | Kardinalitas | Partisipasi | Alasan |
|---|---|---|---|---|---|
| Toko | memiliki | Gudang | 1:N | ... | ... |
| Gudang | menyimpan | Barang | N:M | ... | ... |
| Supplier | memasok | Barang | N:M | ... | ... |
| Kategori | mengelompokkan | Barang | 1:N | ... | ... |

### 11.6 Penyelesaian Relasi N:M

Relasi Gudang–Barang dapat diubah menjadi entitas asosiatif `StokGudang`:

```text
GUDANG 1 ── N STOK_GUDANG N ── 1 BARANG
```

Atribut yang mungkin dimiliki:

- `id_gudang`;
- `id_barang`;
- `jumlah_stok`;
- `lokasi_rak`;
- `stok_minimum`.

Relasi Supplier–Barang dapat diubah menjadi `Pasokan` dengan atribut seperti harga beli, waktu pengiriman, dan jumlah minimum pesan.

### 11.7 Membuat ERD Konseptual

Gambarkan ERD yang memuat:

- seluruh entitas;
- atribut key;
- atribut non-key penting;
- nama relasi;
- kardinalitas;
- partisipasi minimum;
- entitas asosiatif untuk N:M.

Pada tahap konseptual, jangan menambahkan detail MySQL seperti `VARCHAR(100)`, `AUTO_INCREMENT`, engine, atau indeks.

## 12. Validasi ERD

ERD belum selesai hanya karena tampilannya rapi. Lakukan pemeriksaan berikut.

### 12.1 Membaca Relasi Dua Arah

Contoh:

- satu Gudang dapat memiliki banyak StokGudang;
- setiap StokGudang harus merujuk tepat satu Gudang.

Tuliskan kalimat dua arah untuk seluruh relasi.

### 12.2 Uji dengan Skenario Data

Pastikan model dapat menyimpan:

1. satu barang pada dua gudang dengan jumlah berbeda;
2. satu supplier memasok tiga barang;
3. satu barang dipasok dua supplier dengan harga berbeda;
4. satu kategori belum memiliki barang;
5. satu gudang baru belum memiliki stok.

Jika skenario tidak dapat disimpan tanpa mengulang kolom atau mengosongkan data secara tidak wajar, perbaiki model.

### 12.3 Checklist Kualitas ERD

- [ ] Setiap entitas mempunyai nama yang jelas.
- [ ] Setiap entitas memiliki atribut key.
- [ ] Tidak ada atribut berisi daftar nilai.
- [ ] Atribut ditempatkan pada pemilik yang tepat.
- [ ] Setiap relasi mempunyai nama kata kerja.
- [ ] Kardinalitas dapat dijelaskan dengan aturan bisnis.
- [ ] Partisipasi wajib/opsional telah ditentukan.
- [ ] Seluruh relasi N:M telah memiliki entitas asosiatif.
- [ ] Diagram memakai satu notasi secara konsisten.
- [ ] Diagram dapat dibaca pada hasil ekspor.

## 13. Latihan Pengayaan

Pilih salah satu kasus.

### Kasus A — Sekolah

Sekolah ingin mengelola siswa, guru, mata pelajaran, kelas, dan nilai. Identifikasi entitas, atribut, relasi, kardinalitas, dan entitas asosiatif.

### Kasus B — Rumah Sakit

Rumah sakit ingin mengelola pasien, dokter, jadwal pemeriksaan, dan rekam medis. Tentukan apakah RekamMedis menjadi entitas serta jelaskan hubungannya.

### Kasus C — Perpustakaan

Perpustakaan mengelola anggota, buku, eksemplar fisik, pengarang, dan peminjaman. Bedakan Buku dan Eksemplar serta selesaikan relasi Buku–Pengarang.

## 14. Pertanyaan Analisis

1. Mengapa `jumlah_stok` tidak tepat ditempatkan langsung pada Barang jika barang tersimpan di banyak gudang?
2. Apa perbedaan Kategori sebagai entitas dengan pangan/sandang sebagai nilai kategori?
3. Mengapa atribut `umur` biasanya tidak perlu disimpan?
4. Apa akibatnya jika relasi N:M tidak diselesaikan?
5. Mengapa ERD konseptual tidak mencantumkan tipe data MySQL?
6. Apakah alamat sebaiknya menjadi atribut composite atau entitas? Jelaskan asumsi.
7. Bagaimana semantic data model membantu menjelaskan ERD?

## 15. Luaran Praktikum

Mahasiswa mengumpulkan:

1. jawaban pretest;
2. tabel tingkat pemodelan;
3. klasifikasi entitas dan atribut;
4. klasifikasi jenis atribut;
5. latihan derajat relasi;
6. latihan kardinalitas dan partisipasi;
7. daftar kebutuhan Toko XYZ;
8. sedikitnya delapan aturan bisnis;
9. daftar entitas, atribut, dan key;
10. tabel relasi dan kardinalitas;
11. ERD konseptual Toko XYZ;
12. hasil validasi menggunakan skenario data;
13. kesimpulan.

## 16. Format Laporan

Susunan laporan:

1. halaman identitas;
2. tujuan praktikum;
3. alat yang digunakan;
4. jawaban latihan A–E;
5. analisis studi kasus;
6. aturan bisnis;
7. ERD;
8. hasil validasi dan revisi;
9. jawaban pertanyaan analisis;
10. kesimpulan;
11. lampiran file sumber diagram.

Gunakan gambar beresolusi cukup. Teks pada diagram harus dapat dibaca tanpa memperbesar secara berlebihan.

## 17. Rubrik Penilaian

| Komponen | Bobot | Kriteria utama |
|---|---:|---|
| Pemahaman tingkat model | 10% | Konseptual, logis, dan fisik dibedakan dengan tepat |
| Identifikasi entitas dan atribut | 20% | Lengkap, relevan, dan tidak tertukar |
| Key dan jenis atribut | 10% | Key tepat dan klasifikasi atribut dapat dijelaskan |
| Relasi, derajat, dan kardinalitas | 25% | Konsisten dengan aturan bisnis |
| Penyelesaian N:M | 10% | Entitas asosiatif dan atribut relasi tepat |
| Kualitas diagram | 10% | Notasi konsisten dan mudah dibaca |
| Validasi dan argumentasi | 10% | Model diuji dan keputusan dijelaskan |
| Kerapian laporan | 5% | Struktur lengkap dan bahasa jelas |
| **Total** | **100%** | |

## 18. Kriteria Keberhasilan

Praktikum dinyatakan berhasil apabila mahasiswa dapat menghasilkan ERD yang:

- sesuai deskripsi dan asumsi;
- mempunyai entitas serta key yang jelas;
- memakai jenis atribut dengan tepat;
- mempunyai relasi dan kardinalitas yang dapat dijelaskan;
- menyelesaikan relasi N:M;
- berhasil melewati skenario validasi;
- disampaikan dengan notasi yang konsisten.

## 19. Checklist Pengumpulan

- [ ] Nama file tidak menggunakan `README.md`.
- [ ] Laporan menggunakan format PDF.
- [ ] File sumber diagram disertakan.
- [ ] ERD dapat dibaca dengan jelas.
- [ ] Aturan bisnis tersedia.
- [ ] Semua asumsi dituliskan.
- [ ] Relasi dibaca dua arah.
- [ ] Skenario validasi dijelaskan.
- [ ] Kesimpulan menggunakan bahasa sendiri.
- [ ] Tidak ada bagian laporan yang hanya berupa tangkapan layar tanpa penjelasan.

Kembali ke [Modul Minggu 2 — Pemodelan Basis Data](../../Modul/Week%202%20-%20Pemodelan%20Basis%20Data.md).
