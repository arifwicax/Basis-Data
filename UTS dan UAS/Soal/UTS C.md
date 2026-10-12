# SOAL UJIAN TENGAH SEMESTER (UTS)

**Semester:** Gasal 2025/2026
**Program Studi:** Sistem Informasi
**Mata Kuliah:** Basis Data C

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

## Soal 1 — Perancangan ERD Sistem Reservasi Lapangan (20 poin)

**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan dan merancang basis data melalui ERD (C4, C6).

Pusat olahraga mengelola reservasi lapangan futsal dan badminton. Sistem perlu menyimpan identitas dan kontak pelanggan. Seorang pelanggan dapat membuat banyak reservasi. Setiap reservasi menggunakan satu lapangan pada waktu tertentu, sehingga waktu mulai, waktu selesai, dan status reservasi perlu dapat dicatat.

Lapangan memiliki informasi nama, jenis olahraga, tarif penggunaan per jam, dan ketersediaan. Reservasi dapat memiliki satu pembayaran; pembayaran perlu mencatat waktu pembayaran, nominal, metode, dan statusnya. Setiap reservasi dicatat oleh satu petugas, sedangkan data petugas mencakup identitas dan shift kerja. Tentukan sendiri entitas, atribut, serta kunci yang diperlukan berdasarkan kebutuhan tersebut.

### Pertanyaan

1. Buatlah ERD konseptual berdasarkan skenario tersebut.
2. Tentukan entitas, atribut, dan primary key setiap entitas.
3. Tentukan hubungan, kardinalitas, dan partisipasi setiap entitas.
4. Lengkapi rancangan dengan foreign key dan atribut lain yang diperlukan berdasarkan analisis.

**Pedoman penskoran:** ERD dan kelengkapan entitas (8 poin); atribut dan primary key (4 poin); hubungan, kardinalitas, dan partisipasi (6 poin); konsistensi foreign key serta atribut tambahan (2 poin).

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data serta menganalisis kebutuhan rancangan, entitas, dan key (C2, C4).

Perusahaan ekspedisi mencatat pelanggan, pengiriman, dan paket dalam pengiriman. Seorang pelanggan dapat membuat banyak pengiriman. Satu pengiriman dapat memuat beberapa paket, sedangkan paket tidak dapat dicatat tanpa pengiriman induk. Nomor resi dan nomor identitas pelanggan harus unik.

### Pertanyaan

1. Identifikasi entitas kuat dan entitas lemah serta jelaskan alasannya.
2. Tentukan primary key, foreign key, dan alternate key dari setiap entitas.
3. Tentukan hubungan dan kardinalitas antara Pelanggan, Pengiriman, dan Detail_Paket.

**Pedoman penskoran:** Identifikasi dan alasan entitas kuat/lemah (5 poin); primary key, foreign key, dan alternate key (6 poin); hubungan dan kardinalitas (4 poin).

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan hasil rancangan basis data menggunakan perintah SQL DDL dan constraint (C3).

Sistem penyewaan kendaraan mencatat penyewa, kendaraan, pegawai, dan transaksi sewa. Seorang penyewa dapat melakukan banyak transaksi. Satu kendaraan dapat disewa berkali-kali pada waktu berbeda, tetapi setiap transaksi hanya menggunakan satu kendaraan dan dilayani oleh satu pegawai.

### Pertanyaan

1. Implementasikan rancangan ERD tersebut menggunakan DDL MySQL.
2. Tentukan struktur tabel, primary key, foreign key, dan atribut yang diperlukan.
3. Gunakan constraint yang sesuai, minimal `PRIMARY KEY`, `FOREIGN KEY`, dan `NOT NULL`.

**Pedoman penskoran:** Struktur tabel sesuai hasil analisis (10 poin); primary key dan foreign key (8 poin); tipe data dan atribut (5 poin); `NOT NULL`, `UNIQUE`, serta constraint lain yang relevan (5 poin); sintaks dan urutan DDL dapat dijalankan (2 poin).

---

## Soal 4 — Normalisasi hingga 3NF (25 poin)

**Sub-CPMK:** Mahasiswa mampu menganalisis ketergantungan data dan merancang basis data yang konsisten melalui normalisasi (C4, C6).

Tabel `Konsultasi` memiliki kolom: `no_konsultasi`, `tgl_konsultasi`, `id_pasien`, `nama_pasien`, `alamat`, `id_dokter`, `nama_dokter`, `spesialisasi`, `keluhan`, `biaya_konsultasi`, dan `status_bayar`.

### Pertanyaan

1. Uraikan secara singkat proses normalisasi tabel dari 1NF, 2NF, hingga 3NF.
2. Tunjukkan tabel hasil normalisasi hingga 3NF beserta primary key dan foreign key setiap tabel.

Data:

| no_konsultasi | tgl_konsultasi | id_pasien | nama_pasien | alamat     | id_dokter | nama_dokter | spesialisasi | keluhan | biaya_konsultasi | status_bayar |
| ------------- | -------------- | --------- | ----------- | ---------- | --------- | ----------- | ------------ | ------- | ---------------: | ------------ |
| K001          | 2025-10-23     | PS01      | Nia         | Balikpapan | DR01      | dr. Raka    | Umum         | Demam   |           100000 | Lunas        |
| K002          | 2025-10-23     | PS02      | Fajar       | Samarinda  | DR02      | dr. Sinta   | Anak         | Batuk   |           125000 | Belum        |
| K003          | 2025-10-24     | PS01      | Nia         | Balikpapan | DR01      | dr. Raka    | Umum         | Kontrol |           100000 | Lunas        |

**Pedoman penskoran:** Penjelasan tahap 1NF (4 poin); penghilangan ketergantungan parsial pada 2NF (6 poin); penghilangan ketergantungan transitif pada 3NF (6 poin); hasil tabel 3NF (5 poin); primary key dan foreign key (4 poin).

---

## Soal 5 — SQL JOIN (10 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan SQL untuk menggabungkan data antartabel (C3).

### Tabel `Pelanggan`

| id_pelanggan | nama_pelanggan | kota       | email          |
| ------------ | -------------- | ---------- | -------------- |
| C001         | Nanda          | Balikpapan | nanda@mail.com |
| C002         | Reza           | Samarinda  | reza@mail.com  |
| C003         | Wulan          | Bontang    | wulan@mail.com |
| C004         | Tio            | Balikpapan | tio@mail.com   |

### Tabel `Pesanan`

| id_pesanan | id_pelanggan | tanggal_pesanan | total_pesanan | status     |
| ---------- | ------------ | --------------- | ------------: | ---------- |
| O001       | C001         | 2025-09-11      |        250000 | Selesai    |
| O002       | C001         | 2025-09-19      |        175000 | Selesai    |
| O003       | C002         | 2025-09-14      |        400000 | Diproses   |
| O004       | C003         | 2025-09-21      |        125000 | Dibatalkan |

### Pertanyaan

1. Gunakan `INNER JOIN` untuk menampilkan nama pelanggan, kota, dan total pesanan khusus untuk transaksi yang berstatus `Selesai`.
2. Gunakan `LEFT JOIN` dan fungsi agregat yang sesuai untuk menampilkan semua pelanggan beserta tanggal pesanan terakhirnya. Pelanggan tanpa pesanan harus tetap muncul dengan nilai `NULL`.

**Pedoman penskoran:** Query `INNER JOIN`, kondisi join, dan filter status (4 poin); query `LEFT JOIN`, fungsi agregat, dan `GROUP BY` (4 poin); ketepatan kolom output dan penanganan pelanggan tanpa transaksi (2 poin).
