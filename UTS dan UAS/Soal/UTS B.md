# SOAL UJIAN TENGAH SEMESTER (UTS)

**Semester:** Gasal 2025/2026
**Program Studi:** Sistem Informasi
**Mata Kuliah:** Basis Data B

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

## Soal 1 — Perancangan ERD Sistem Perpustakaan (20 poin)

**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan dan merancang basis data melalui ERD (C4, C6).

Perpustakaan kampus mengelola data anggota, buku, petugas, dan peminjaman. Sistem perlu menyimpan identitas serta informasi akademik dan kontak anggota. Seorang anggota dapat melakukan banyak peminjaman. Satu transaksi peminjaman dapat memuat beberapa buku, dan satu buku dapat dipinjam berkali-kali pada transaksi yang berbeda.

Data buku perlu memuat informasi bibliografis seperti judul, penulis, penerbit, dan tahun terbit, serta informasi jumlah ketersediaannya. Setiap transaksi menyimpan waktu peminjaman, batas pengembalian, dan status transaksi, serta dilayani oleh satu petugas. Data petugas setidaknya mencakup identitas dan jadwal atau shift kerja. Tentukan sendiri struktur entitas dan atribut yang diperlukan berdasarkan kebutuhan tersebut.

### Pertanyaan

1. Buatlah ERD konseptual berdasarkan skenario tersebut.
2. Tentukan entitas, atribut, dan primary key setiap entitas.
3. Tentukan hubungan, kardinalitas, dan partisipasi setiap entitas.
4. Lengkapi rancangan dengan foreign key serta atribut lain yang diperlukan, termasuk entitas/asosiasi untuk hubungan banyak-ke-banyak.

**Pedoman penskoran:** ERD dan kelengkapan entitas (8 poin); atribut dan primary key (4 poin); hubungan, kardinalitas, dan partisipasi (6 poin); konsistensi foreign key serta atribut tambahan (2 poin).

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data serta menganalisis kebutuhan rancangan, entitas, dan key (C2, C4).

Sebuah klinik mencatat pasien, kunjungan, dan resep obat. Seorang pasien dapat memiliki banyak kunjungan. Setiap kunjungan dapat memiliki beberapa detail resep. Detail resep tidak dapat berdiri sendiri tanpa kunjungan. Nomor rekam medis dan nomor identitas pasien harus unik.

### Pertanyaan

1. Identifikasi entitas kuat dan entitas lemah serta jelaskan alasannya.
2. Tentukan primary key, foreign key, dan alternate key dari setiap entitas.
3. Tentukan hubungan dan kardinalitas antara Pasien, Kunjungan, dan Detail_Resep.

**Pedoman penskoran:** Identifikasi dan alasan entitas kuat/lemah (5 poin); primary key, foreign key, dan alternate key (6 poin); hubungan dan kardinalitas (4 poin).

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan hasil rancangan basis data menggunakan perintah SQL DDL dan constraint (C3).

Sistem kursus daring mencatat peserta, instruktur, kursus, pendaftaran, dan modul kursus. Seorang peserta dapat mendaftar banyak kursus, dan satu kursus dapat diikuti banyak peserta. Setiap kursus memiliki satu instruktur. Satu kursus memiliki banyak modul yang tidak boleh berdiri sendiri tanpa kursus.

### Pertanyaan

1. Implementasikan rancangan ERD tersebut menggunakan DDL MySQL.
2. Tentukan struktur tabel, primary key, foreign key, dan atribut yang diperlukan.
3. Gunakan constraint yang sesuai, minimal `PRIMARY KEY`, `FOREIGN KEY`, dan `NOT NULL`.

**Pedoman penskoran:** Struktur tabel sesuai hasil analisis (10 poin); primary key dan foreign key (8 poin); tipe data dan atribut (5 poin); `NOT NULL`, `UNIQUE`, serta constraint lain yang relevan (5 poin); sintaks dan urutan DDL dapat dijalankan (2 poin).

---

## Soal 4 — Normalisasi hingga 3NF (25 poin)

**Sub-CPMK:** Mahasiswa mampu menganalisis ketergantungan data dan merancang basis data yang konsisten melalui normalisasi (C4, C6).

Tabel `Pembelian` memiliki kolom: `no_transaksi`, `tgl_transaksi`, `kd_pemasok`, `nama_pemasok`, `alamat_pemasok`, `kode_produk`, `nama_produk`, `harga_beli`, `jumlah`, dan `total_item`.

### Pertanyaan

1. Uraikan secara singkat proses normalisasi tabel dari 1NF, 2NF, hingga 3NF.
2. Tunjukkan tabel hasil normalisasi hingga 3NF beserta primary key dan foreign key setiap tabel.

Data:

| no_transaksi | tgl_transaksi | kd_pemasok | nama_pemasok   | alamat_pemasok | kode_produk | nama_produk | harga_beli | jumlah | total_item |
| ------------ | ------------- | ---------- | -------------- | -------------- | ----------- | ----------- | ---------: | -----: | ---------: |
| PB001        | 2025-10-21    | S01        | Sumber Makmur  | Balikpapan     | P01         | Keyboard    |     150000 |      3 |     450000 |
| PB001        | 2025-10-21    | S01        | Sumber Makmur  | Balikpapan     | P02         | Mouse       |      75000 |      4 |     300000 |
| PB002        | 2025-10-22    | S02        | Teknologi Jaya | Samarinda      | P01         | Keyboard    |     150000 |      2 |     300000 |

**Pedoman penskoran:** Penjelasan tahap 1NF (4 poin); penghilangan ketergantungan parsial pada 2NF (6 poin); penghilangan ketergantungan transitif pada 3NF (6 poin); hasil tabel 3NF (5 poin); primary key dan foreign key (4 poin).

---

## Soal 5 — SQL JOIN (10 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan SQL untuk menggabungkan data antartabel (C3).

### Tabel `Peserta`

| id_peserta | nama_peserta | program_studi    | email          | kota       |
| ---------- | ------------ | ---------------- | -------------- | ---------- |
| P001       | Rina         | Sistem Informasi | rina@mail.com  | Balikpapan |
| P002       | Dimas        | Informatika      | dimas@mail.com | Samarinda  |
| P003       | Sari         | Sistem Informasi | sari@mail.com  | Tenggarong |
| P004       | Yoga         | Bisnis Digital   | yoga@mail.com  | Balikpapan |

### Tabel `Pendaftaran`

| id_pendaftaran | id_peserta | nama_kursus     | tanggal_daftar | nilai_akhir | status    |
| -------------- | ---------- | --------------- | -------------- | ----------: | --------- |
| REG001         | P001       | Basis Data      | 2025-09-05     |          85 | Lulus     |
| REG002         | P001       | Pemrograman Web | 2025-09-07     |          78 | Lulus     |
| REG003         | P002       | Basis Data      | 2025-09-06     |          72 | Lulus     |
| REG004         | P003       | Basis Data      | 2025-09-08     |          60 | Mengulang |

### Pertanyaan

1. Gunakan `INNER JOIN` untuk menampilkan nama peserta, program studi, nama kursus, dan nilai akhir khusus untuk pendaftaran dengan status `Lulus`.
2. Gunakan `LEFT JOIN` dan fungsi agregat yang sesuai untuk menampilkan semua peserta beserta tanggal pendaftaran terakhirnya. Peserta tanpa pendaftaran harus tetap muncul dengan nilai `NULL`.

**Pedoman penskoran:** Query `INNER JOIN`, kondisi join, dan filter status (4 poin); query `LEFT JOIN`, fungsi agregat, dan `GROUP BY` (4 poin); ketepatan kolom output dan penanganan peserta tanpa pendaftaran (2 poin).
