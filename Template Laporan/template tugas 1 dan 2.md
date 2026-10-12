# LAPORAN TERINTEGRASI
## ANALISIS, PERANCANGAN, DAN IMPLEMENTASI BASIS DATA

<br>

**[LOGO INSTITUSI]**

**[NAMA INSTITUSI/UNIVERSITAS]**  
**[FAKULTAS/PROGRAM STUDI]**

<br><br>

**Studi Kasus:**  
**[NAMA OBJEK/MITRA/STUDI KASUS]**

<br><br>

Disusun untuk memenuhi tugas mata kuliah **Basis Data (SI2514010)**

**Dosen Pengampu:**  
Arif Wicaksono Septyanto, S.Kom., M.Kom.

<br><br>

**Disusun oleh:**

| Nama | NIM | Kelas |
|---|---|---|
| [Nama mahasiswa] | [NIM] | [Kelas] |

Jika dikerjakan berkelompok, tambahkan satu baris untuk setiap anggota. Isi **Nama** dengan nama lengkap, **NIM** dengan nomor induk mahasiswa, dan **Kelas** dengan kelas mata kuliah.

<br>

**[KOTA]**  
**[TAHUN]**

---

# LEMBAR PENGESAHAN

Laporan terintegrasi berjudul **“[Judul laporan/studi kasus]”** telah disusun untuk memenuhi tugas mata kuliah Basis Data.

|  | [Kota], [Tanggal Bulan Tahun] |
|---|---|
| Mengetahui,  | Penyusun, |
| Dosen Pengampu  |  |
|  |  |
| (Arif Wicaksono Septyanto, S.Kom., M.Kom.) | ([Nama mahasiswa]) |

---

# KATA PENGANTAR

Puji syukur ke hadirat Tuhan Yang Maha Esa karena laporan berjudul **“[Judul laporan]”** ini dapat diselesaikan. Laporan ini memuat rangkaian analisis kebutuhan, perancangan ERD, serta implementasi basis data menggunakan SQL berdasarkan studi kasus **[nama objek/mitra]**.

Penulis mengucapkan terima kasih kepada **[nama pihak/mitra]** dan dosen pengampu yang telah memberikan arahan. Penulis menyadari bahwa laporan ini masih memiliki kekurangan. Kritik dan saran sangat diharapkan untuk perbaikan.

[Kota], [Tanggal Bulan Tahun]  
Penulis

---

# DAFTAR ISI

> Perbarui daftar isi setelah laporan selesai disusun.

1. [BAB I PENDAHULUAN](#bab-i-pendahuluan)  
2. [BAB II ANALISIS KEBUTUHAN](#bab-ii-analisis-kebutuhan)  
3. [BAB III PERANCANGAN BASIS DATA](#bab-iii-perancangan-basis-data)  
4. [BAB IV IMPLEMENTASI BASIS DATA](#bab-iv-implementasi-basis-data)  
5. [BAB V DOKUMENTASI QUERY DAN ANALISIS](#bab-v-dokumentasi-query-dan-analisis)  
6. [BAB VI PENUTUP](#bab-vi-penutup)  
7. [LAMPIRAN](#lampiran)

---

# BAB I PENDAHULUAN

## 1.1 Latar Belakang

Jelaskan kondisi, proses bisnis, dan alasan pemilihan **[nama objek/mitra]**. Uraikan masalah pencatatan, penyimpanan, pencarian, pelaporan, atau pengelolaan data yang ditemukan.

## 1.2 Identifikasi Masalah

1. [Masalah pertama yang ditemukan].
2. [Masalah kedua yang ditemukan].
3. [Masalah lainnya].

## 1.3 Rumusan Masalah

1. Bagaimana menganalisis kebutuhan data pada **[nama objek/mitra]**?
2. Bagaimana merancang ERD berdasarkan hasil observasi dan wawancara?
3. Bagaimana mengimplementasikan rancangan tersebut ke dalam DBMS menggunakan SQL?

## 1.4 Tujuan

1. Mengidentifikasi permasalahan dan kebutuhan data client/mitra.
2. Menghasilkan rancangan ERD konseptual dan logis.
3. Mengimplementasikan rancangan basis data menggunakan DDL dan DML.
4. Menghasilkan query yang menjawab kebutuhan informasi client.

## 1.5 Batasan

Tuliskan batasan objek, proses, data, DBMS, dan fitur yang digunakan. Contoh: laporan mencakup **[daftar proses]**, menggunakan **[nama DBMS]**, dan tidak mencakup **[di luar ruang lingkup]**.

## 1.6 Metode Pengumpulan Data

Isi satu baris untuk setiap metode yang benar-benar dilakukan. **Waktu/Tempat** berisi kapan dan di mana kegiatan dilakukan, **Narasumber/Sumber** berisi pihak atau dokumen yang digunakan, sedangkan **Hasil** berisi informasi yang diperoleh.

| Metode | Waktu/Tempat | Narasumber/Sumber | Hasil |
|---|---|---|---|
| Wawancara | 10 September 2026, Toko Maju | Bapak Andi, pemilik toko | Diperoleh informasi proses penjualan dan pencatatan stok |
| Observasi | 10 September 2026, area kasir | Aktivitas kasir | Ditemukan transaksi masih dicatat pada buku |
| Dokumentasi | 10 September 2026 | Nota dan daftar produk | Diperoleh contoh atribut produk dan transaksi |

Ganti contoh di atas dengan data sebenarnya. Jangan menulis metode yang tidak dilakukan.

---

# BAB II ANALISIS KEBUTUHAN

## 2.1 Profil Objek/Mitra

Tuliskan nama, alamat/lokasi, bidang usaha/aktivitas, sejarah singkat, pihak yang terlibat, dan proses utama objek.

## 2.2 Proses Bisnis yang Diamati

Jelaskan alur proses bisnis dari awal sampai akhir. Sertakan diagram alur jika diperlukan.

## 2.3 Hasil Wawancara dan Observasi

Tuliskan fakta yang diperoleh, bukan pendapat atau asumsi. Satu baris dapat berisi satu pertanyaan penting, satu temuan observasi, atau satu jawaban client.

| No. | Pertanyaan/Aspek | Jawaban/Hasil Pengamatan | Sumber |
|---|---|---|---|
| 1 | Bagaimana pencatatan transaksi dilakukan? | Kasir menulis transaksi pada nota, kemudian direkap pada akhir hari. | Wawancara pemilik |
| 2 | Apa kendala dari cara tersebut? | Pemilik kesulitan mencari riwayat transaksi dan mengetahui stok terkini. | Wawancara pemilik |

## 2.4 Permasalahan dan Kebutuhan Client

Hubungkan setiap masalah dengan solusi data yang dibutuhkan. Prioritas **Tinggi** berarti kebutuhan tersebut penting untuk proses utama client.

| No. | Permasalahan | Kebutuhan solusi/data | Prioritas |
|---|---|---|---|
| 1 | Stok sulit dipantau karena dicatat manual. | Menyimpan data produk dan jumlah stok serta menyediakan query stok. | Tinggi |
| 2 | Riwayat transaksi sulit dicari. | Menyimpan transaksi, detail transaksi, dan tanggal transaksi. | Tinggi |

## 2.5 Data yang Digunakan

Tuliskan dokumen/data yang benar-benar dilihat atau diperoleh. Kolom atribut berisi contoh isi data, bukan hanya nama tabel. Data pribadi harus disamarkan.

| No. | Nama data/dokumen | Atribut/data yang tersedia | Sumber | Keterangan kerahasiaan |
|---|---|---|---|---|
| 1 | Daftar produk | kode produk, nama produk, harga, stok | Pemilik toko | Tidak ada data pribadi |
| 2 | Nota penjualan | nomor nota, tanggal, produk, jumlah, total | Kasir | Nama pelanggan disamarkan |

---

# BAB III PERANCANGAN BASIS DATA

## 3.1 Identifikasi Entitas

Entitas adalah objek yang datanya perlu disimpan dan biasanya menjadi calon tabel. Entitas harus berasal dari data/kebutuhan pada Bab II.

| No. | Entitas | Sumber data/kebutuhan | Alasan penggunaan |
|---|---|---|---|
| 1 | Produk | Daftar produk dari pemilik | Menyimpan barang yang dijual, harga, dan stok |
| 2 | Transaksi | Nota penjualan | Menyimpan setiap transaksi penjualan |
| 3 | Detail Transaksi | Isi nota penjualan | Menyimpan produk dan jumlah pada setiap transaksi |

## 3.2 Identifikasi Atribut dan Primary Key

Buat satu baris untuk setiap atribut. Isi **PK** untuk primary key, **FK** untuk foreign key, dan **—** untuk atribut biasa. Jika berfungsi sebagai keduanya, tuliskan **PK, FK**.

| Entitas | Atribut | Tipe/keterangan | Key |
|---|---|---|---|
| Produk | id_produk | Bilangan unik | PK |
| Produk | nama_produk | Nama barang | — |
| Produk | harga | Nilai mata uang | — |
| Produk | stok | Bilangan jumlah barang | — |
| Transaksi | id_transaksi | Bilangan unik | PK |
| Transaksi | tanggal_transaksi | Tanggal transaksi | — |
| Detail Transaksi | id_transaksi | Referensi ke Transaksi | PK, FK |
| Detail Transaksi | id_produk | Referensi ke Produk | PK, FK |
| Detail Transaksi | jumlah | Jumlah barang | — |

## 3.3 Identifikasi Relasi

Tuliskan hubungan yang benar-benar terjadi dalam proses bisnis. Dasar relasi harus berasal dari wawancara, observasi, atau dokumen.

| No. | Entitas yang berelasi | Nama relasi | Dasar relasi |
|---|---|---|---|
| 1 | Transaksi — Detail Transaksi | memiliki | Satu nota berisi satu atau lebih baris barang. |
| 2 | Produk — Detail Transaksi | tercatat pada | Satu produk dapat muncul pada banyak transaksi. |

## 3.4 Business Rules dan Kardinalitas

Tuliskan aturan dari sudut pandang kedua entitas. Kardinalitas **1:N** berarti satu data pada entitas pertama dapat berhubungan dengan banyak data pada entitas kedua.

| No. | Business rule | Kardinalitas | Optionality |
|---|---|---|---|
| 1 | Satu transaksi memiliki satu atau lebih detail; satu detail hanya dimiliki satu transaksi. | Transaksi 1:N Detail Transaksi | Transaksi dan detail wajib berelasi. |
| 2 | Satu produk dapat tercatat pada banyak detail; satu detail mengacu pada satu produk. | Produk 1:N Detail Transaksi | Produk boleh belum pernah terjual; detail wajib mengacu pada produk. |

## 3.5 ERD Konseptual/ERD Awal

Tempelkan ERD awal hasil identifikasi kebutuhan di bawah ini.

**[TEMPEL GAMBAR ERD KONSEPTUAL DI SINI]**

## 3.6 Evaluasi dan Revisi ERD

Jelaskan evaluasi terhadap entitas, atribut, key, relasi, kardinalitas, dan penyelesaian relasi M:N. Jika tidak ada perubahan, tuliskan alasannya.

| Bagian yang berubah | Kondisi awal | Perubahan | Alasan |
|---|---|---|---|
| Tabel penghubung | Produk dan Transaksi langsung M:N | Ditambahkan Detail Transaksi | Relasi M:N dipecah agar dapat diimplementasikan secara relasional. |

## 3.7 ERD Logis/Hasil Akhir

**[TEMPEL GAMBAR ERD LOGIS HASIL AKHIR DI SINI]**

## 3.8 Skema Relasional

Tuliskan semua tabel hasil akhir. Nama dalam huruf kapital adalah nama tabel, atribut bertanda **[PK]** adalah primary key, dan atribut bertanda **[FK]** adalah foreign key. Contoh berikut berarti `id_produk` menjadi kunci utama tabel `PRODUK`, sedangkan `id_transaksi` pada `DETAIL_TRANSAKSI` merujuk ke tabel `TRANSAKSI`.

Tuliskan skema dengan format berikut:

```text
NAMA_TABEL(
  primary_key [PK],
  atribut,
  foreign_key [FK] REFERENCES tabel_referensi(kunci)
)
```

---

# BAB IV IMPLEMENTASI BASIS DATA

## 4.1 Lingkungan Implementasi

Isi berdasarkan perangkat lunak yang benar-benar digunakan saat menjalankan SQL. Versi dapat dilihat melalui menu About atau perintah versi pada DBMS.

| Komponen | Keterangan |
|---|---|
| DBMS | MySQL |
| Versi | 8.0.x |
| Tools | MySQL Workbench |
| Nama database | db_toko_maju |

## 4.2 DDL — CREATE DATABASE

**Tujuan:** Membuat database untuk studi kasus.  
**Query:**

```sql
-- Tulis query CREATE DATABASE di sini
```

**Hasil eksekusi:** [Tempel screenshot/hasil].  
**Penjelasan:** [isi].

## 4.3 DDL — CREATE TABLE dan Constraint

Tuliskan query pembuatan seluruh tabel. Setiap tabel wajib memiliki PK; gunakan FK, `NOT NULL`, `UNIQUE`, `DEFAULT`, dan constraint lain sesuai kebutuhan.

```sql
-- Tulis seluruh query CREATE TABLE di sini
```

**Hasil eksekusi:** [Tempel screenshot struktur tabel].  
**Penjelasan:** [isi].

## 4.4 DDL — ALTER TABLE

**Kebutuhan/alasan perubahan:** [isi].

```sql
-- Tulis minimal satu query ALTER TABLE di sini
```

**Hasil eksekusi dan penjelasan:** [isi].

## 4.5 DML — INSERT

Jelaskan sumber data dan data dummy yang digunakan jika ada.

```sql
-- Tulis query INSERT untuk seluruh tabel di sini
```

**Hasil eksekusi:** [Tempel screenshot/hasil].

## 4.6 Struktur Database Setelah Implementasi

Tempelkan bukti seluruh tabel, kolom, PK, FK, dan constraint telah berhasil dibuat.

**[TEMPEL SCREENSHOT STRUKTUR DATABASE DI SINI]**

---

# BAB V DOKUMENTASI QUERY DAN ANALISIS

> Gunakan pola berikut untuk setiap query penting: **Kebutuhan/Tujuan → Query SQL → Hasil Eksekusi → Penjelasan**.

## 5.1 SELECT untuk Kebutuhan Informasi Client

### Query 1 — [Nama kebutuhan informasi]

**Kebutuhan:** [Pertanyaan yang ingin dijawab client].

```sql
-- Tulis query SELECT di sini
```

**Hasil eksekusi:** [Tempel screenshot/hasil].  
**Penjelasan:** [Jelaskan manfaat hasil query bagi client].

### Query 2 — [Nama kebutuhan informasi]

**Kebutuhan:** [isi].

```sql
-- Tulis query SELECT di sini
```

**Hasil eksekusi:** [isi].  
**Penjelasan:** [isi].

## 5.2 UPDATE

**Kondisi/alasan pembaruan:** [isi].

```sql
-- Tulis query UPDATE di sini
```

**Hasil eksekusi dan penjelasan:** [isi].

## 5.3 DELETE

**Alasan data dapat dihapus:** [isi]. Perhatikan ketergantungan FK dan hubungan dengan tabel lain.

```sql
-- Tulis query DELETE di sini
```

**Hasil eksekusi dan penjelasan:** [isi].

## 5.4 Query Antar Tabel (JOIN)

**Kebutuhan client:** [Contoh: mengetahui nama pelanggan dan transaksi yang pernah dilakukan].  
**Tabel yang dihubungkan:** [isi].

```sql
-- Tulis query JOIN minimal dua tabel berelasi di sini
```

**Hasil eksekusi:** [Tempel screenshot/hasil].  
**Penjelasan:** [isi].

## 5.5 Kesesuaian ERD dengan Implementasi

Kolom **Hasil pemeriksaan** diisi “Sesuai” atau “Tidak sesuai”. Pada **Keterangan**, sebutkan bukti spesifik seperti nama tabel, kolom, atau foreign key. Jika tidak sesuai, jelaskan perubahan yang dilakukan.

| Komponen | Hasil pemeriksaan | Keterangan |
|---|---|---|
| Entitas menjadi tabel | Sesuai | Produk, Transaksi, dan Detail Transaksi telah dibuat sebagai tabel. |
| Atribut menjadi kolom | Sesuai | Atribut pada ERD tersedia sebagai kolom pada tabel terkait. |
| Primary Key | Sesuai | Setiap tabel memiliki PK; Detail Transaksi memakai PK gabungan. |
| Foreign Key | Sesuai | FK Detail Transaksi mengarah ke Transaksi dan Produk. |
| Relasi dan kardinalitas | Sesuai | Relasi 1:N diterapkan melalui FK pada sisi N. |
| Relasi M:N/tabel penghubung | Sesuai | M:N Produk-Transaksi diselesaikan dengan Detail Transaksi. |
| Tipe data | Sesuai | Tipe data sesuai dengan nilai yang disimpan. |

Jelaskan hubungan **kebutuhan client → ERD → skema relasional → tabel → SQL → informasi yang dihasilkan**.

---

# BAB VI PENUTUP

## 6.1 Kesimpulan

Tuliskan kesimpulan mengenai hasil analisis kebutuhan, rancangan ERD, implementasi DDL/DML, query informasi, dan kesesuaiannya dengan kebutuhan client.

## 6.2 Saran

Tuliskan pengembangan yang dapat dilakukan, misalnya penambahan fitur, keamanan, backup, normalisasi lanjutan, antarmuka aplikasi, atau integrasi sistem.

---

# LAMPIRAN

## Lampiran A — Daftar Pertanyaan Wawancara

1. [Pertanyaan dan jawaban ringkas].
2. [Pertanyaan dan jawaban ringkas].

## Lampiran B — Dokumentasi Wawancara dan Observasi

**[Tempel foto/dokumentasi di sini. Samarkan data pribadi atau rahasia.]**

## Lampiran C — Contoh Dokumen/Data dari Client

**[Tempel formulir, nota, daftar data, atau dokumen relevan di sini.]**

## Lampiran D — ERD Ukuran Penuh

**[Tempel ERD konseptual dan ERD logis ukuran penuh di sini.]**

## Lampiran E — Screenshot Hasil Eksekusi

**[Tempel screenshot CREATE TABLE, ALTER TABLE, INSERT, SELECT, UPDATE, DELETE, dan JOIN.]**

## Lampiran F — Script SQL Lengkap

```sql
-- Tempel script SQL lengkap dari CREATE DATABASE sampai query akhir di sini
```
