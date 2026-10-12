# SOAL UJIAN TENGAH SEMESTER (UTS)

**Semester:** Gasal 2025/2026
**Program Studi:** Sistem Informasi
**Mata Kuliah:** Basis Data A

---

## Pemetaan Materi dan Sub-CPMK

| Soal | Materi Modul | Sub-CPMK yang Diukur                                                                                        |
| ---- | ------------ | ----------------------------------------------------------------------------------------------------------- |
| 1    | Modul 1–3   | Menganalisis kebutuhan dan merancang ERD (C4, C6)                                                           |
| 2    | Modul 2–3   | Menjelaskan pemodelan basis data serta menganalisis entitas kuat, entitas lemah, dan pemilihan key (C2, C4) |
| 3    | Modul 4–5   | Menerapkan hasil rancangan ERD ke dalam SQL DDL dan constraint (C3)                                         |
| 4    | Modul 6      | Menganalisis ketergantungan data dan merancang basis data yang konsisten hingga 3NF (C4, C6)                |
| 5    | Modul 7      | Menerapkan SQL untuk menggabungkan data antartabel (C3)                                                     |

---

## Soal 1 — Perancangan ERD Sistem Donasi (20 poin)

**Sub-CPMK:** Menganalisis kebutuhan dan merancang ERD (C4, C6)

Tanamin Bumi Nusantara mengelola sistem donasi daring untuk kegiatan penanaman pohon mangrove. Sistem perlu menyimpan informasi identitas dan kontak donatur. Setiap donatur dapat memberikan banyak donasi, dan setiap donasi perlu dicatat waktu penerimaan, nominal, serta cara pembayarannya. Satu donasi dapat dialokasikan ke beberapa proyek.

Setiap proyek memiliki informasi mengenai nama kegiatan, lokasi pelaksanaan, serta periode mulai dan selesai. Setiap proyek dikelola oleh satu koordinator yang merupakan pegawai. Data pegawai yang dibutuhkan meliputi identitas, jabatan, dan informasi kontak. Rancanglah struktur data yang paling sesuai berdasarkan kebutuhan tersebut.

### Pertanyaan

1. Buatlah Entity Relationship Diagram (ERD) konseptual berdasarkan skenario tersebut.
2. Tentukan entitas, atribut, dan atribut kunci (primary key) dari masing-masing entitas.
3. Tentukan jenis hubungan antarentitas, kardinalitas, dan partisipasi setiap entitas.
4. Lengkapi rancangan dengan atribut kunci, foreign key, dan atribut lain yang diperlukan berdasarkan analisis Anda.

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

**Sub-CPMK:** Menjelaskan pemodelan basis data serta menganalisis entitas kuat, entitas lemah, dan pemilihan key (C2, C4)

Toko daring mencatat pelanggan, pesanan, dan item pesanan. Pelanggan dapat memiliki banyak pesanan, sedangkan item pesanan tidak dapat berdiri sendiri tanpa pesanan induk. Setiap pelanggan memiliki email unik dan nomor pelanggan sebagai identitas alternatif.

### Pertanyaan

1. Identifikasi entitas kuat dan entitas lemah berdasarkan skenario tersebut, lalu jelaskan alasannya.
2. Tentukan primary key, foreign key, dan kunci alternatif (alternate key) dari setiap entitas.
3. Tentukan hubungan dan kardinalitas antara Pelanggan, Pesanan, dan Item_Pesanan.

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

**Sub-CPMK:** Menerapkan hasil rancangan ERD ke dalam SQL DDL dan constraint (C3)

EcoRestore mencatat donatur, donasi, pegawai, proyek, dan alokasi donasi ke proyek. Donatur dapat memiliki banyak donasi; donasi dapat dialokasikan ke banyak proyek; setiap proyek memiliki satu pegawai penanggung jawab.

### Pertanyaan

1. Implementasikan rancangan ERD pada Soal 1 menggunakan DDL MySQL.
2. Tentukan struktur tabel, primary key, foreign key, dan atribut yang diperlukan berdasarkan skenario.
3. Gunakan constraint yang sesuai, minimal `PRIMARY KEY`, `FOREIGN KEY`, dan `NOT NULL`.

---

## Soal 4 — Normalisasi hingga 3NF (25 poin)

**Sub-CPMK:** Menganalisis ketergantungan data dan merancang basis data yang konsisten hingga 3NF (C4, C6)

Tabel `Penjualan` memiliki kolom: `no_faktur`, `tgl_faktur`, `kd_pelanggan`, `nama_pelanggan`, `alamat`, `kode_barang`, `nama_barang`, `harga_satuan`, `jumlah`, dan `subtotal`.

### Pertanyaan

1. Uraikan secara singkat proses normalisasi tabel dari 1NF, 2NF, hingga 3NF.
2. Tunjukkan tabel hasil normalisasi hingga 3NF beserta primary key dan foreign key setiap tabel.

Data:

| no_faktur | tgl_faktur | kd_pelanggan | nama_pelanggan | alamat | kode_barang | nama_barang | harga_satuan | jumlah | subtotal |
| --------- | ---------- | ------------ | -------------- | ------ | ----------- | ----------- | -----------: | -----: | -------: |
| F001      | 2025-10-19 | C01          | Andi           | BPN    | B01         | Pulpen      |         5000 |     10 |    50000 |
| F001      | 2025-10-19 | C01          | Andi           | BPN    | B02         | Buku tulis  |         8000 |      5 |    40000 |
| F002      | 2025-10-20 | C02          | Budi           | SMD    | B01         | Pulpen      |         5000 |      2 |    10000 |

---

## Soal 5 — SQL JOIN (10 poin)

**Sub-CPMK:** Menerapkan SQL untuk menggabungkan data antartabel (C3)

### Tabel `Donatur`

| id_donatur | nama_donatur        | jenis_donatur | email                | kota       | no_telp      |
| ---------- | ------------------- | ------------- | -------------------- | ---------- | ------------ |
| D001       | Arif                | Pribadi       | arif@gmail.com       | Balikpapan | 081234567890 |
| D002       | PT Sejahtera        | Perusahaan    | cs@ptsejahtera.co.id | Samarinda  | 0541-112233  |
| D003       | Lala                | Pribadi       | lala@yahoo.com       | Tenggarong | 081298765432 |
| D004       | Yayasan Peduli Alam | Perusahaan    | info@pedulialam.org  | Balikpapan | 0542-334455  |

### Tabel `Donasi`

| id_donasi | id_donatur | tanggal_donasi | jumlah_donasi | metode_pembayaran | status     |
| --------- | ---------- | -------------- | ------------: | ----------------- | ---------- |
| DN001     | D001       | 2025-09-10     |        500000 | Transfer          | Berhasil   |
| DN002     | D001       | 2025-09-18     |        200000 | QRIS              | Berhasil   |
| DN003     | D002       | 2025-09-12     |       1000000 | Transfer          | Pending    |
| DN004     | D003       | 2025-09-20     |        300000 | Tunai             | Dibatalkan |

### Pertanyaan

1. Gunakan `INNER JOIN` untuk menampilkan nama donatur, kota, dan jumlah donasi khusus untuk transaksi yang berstatus `Berhasil`.
2. Gunakan `LEFT JOIN` dan fungsi agregat yang sesuai untuk menampilkan semua donatur beserta tanggal donasi terakhirnya. Donatur tanpa transaksi harus tetap muncul dengan nilai `NULL`.
