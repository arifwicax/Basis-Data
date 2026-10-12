# SOAL DAN JAWABAN UJIAN TENGAH SEMESTER (UTS)

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

### Jawaban

- **Anggota** (`id_anggota` PK, `nama`, `program_studi`, `email`, `no_telp`)
- **Buku** (`id_buku` PK, `judul`, `penulis`, `penerbit`, `tahun_terbit`, `stok`)
- **Petugas** (`id_petugas` PK, `nama_petugas`, `shift`)
- **Peminjaman** (`id_peminjaman` PK, `tgl_pinjam`, `tgl_jatuh_tempo`, `status`, `id_anggota` FK, `id_petugas` FK)
- **Detail_Peminjaman** (`id_peminjaman` PK/FK, `id_buku` PK/FK, `jumlah`, `tgl_kembali`, `denda`)

Kardinalitas: Anggota–Peminjaman = 1:N; Petugas–Peminjaman = 1:N; Peminjaman–Buku = M:N dan direalisasikan melalui `Detail_Peminjaman`. Anggota dan Petugas berpartisipasi opsional di sisi entitas induk, sedangkan setiap Peminjaman wajib memiliki satu Anggota dan satu Petugas; setiap Detail_Peminjaman wajib terkait dengan satu Peminjaman dan satu Buku.

```text
Anggota (1) ─── (N) Peminjaman (1) ─── (N) Detail_Peminjaman (N) ─── (1) Buku
                         |
                         N
                         |
                      Petugas (1)
```

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data serta menganalisis kebutuhan rancangan, entitas, dan key (C2, C4).

Sebuah klinik mencatat pasien, kunjungan, dan resep obat. Seorang pasien dapat memiliki banyak kunjungan. Setiap kunjungan dapat memiliki beberapa detail resep. Detail resep tidak dapat berdiri sendiri tanpa kunjungan. Nomor rekam medis dan nomor identitas pasien harus unik.

### Pertanyaan

1. Identifikasi entitas kuat dan entitas lemah serta jelaskan alasannya.
2. Tentukan primary key, foreign key, dan alternate key dari setiap entitas.
3. Tentukan hubungan dan kardinalitas antara Pasien, Kunjungan, dan Detail_Resep.

**Pedoman penskoran:** Identifikasi dan alasan entitas kuat/lemah (5 poin); primary key, foreign key, dan alternate key (6 poin); hubungan dan kardinalitas (4 poin).

### Jawaban

- **Pasien** adalah entitas kuat: (`id_pasien` PK, `no_rekam_medis` AK, `no_identitas` AK, `nama`, `tgl_lahir`, `alamat`).
- **Kunjungan** adalah entitas kuat: (`id_kunjungan` PK, `tgl_kunjungan`, `keluhan`, `id_pasien` FK).
- **Detail_Resep** adalah entitas lemah karena keberadaannya bergantung pada Kunjungan. Kunci yang sesuai adalah (`id_kunjungan`, `no_item`) sebagai PK komposit; `id_kunjungan` juga FK. Atribut lain dapat berupa `nama_obat`, `dosis`, dan `jumlah`.

```text
Pasien (1) ─── (N) Kunjungan (1) ─── (N) Detail_Resep
```

`no_rekam_medis`, `no_identitas`, dan bila diperlukan `email` harus diberi constraint `UNIQUE` sebagai kunci alternatif.

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan hasil rancangan basis data menggunakan perintah SQL DDL dan constraint (C3).

Sistem kursus daring mencatat peserta, instruktur, kursus, pendaftaran, dan modul kursus. Seorang peserta dapat mendaftar banyak kursus, dan satu kursus dapat diikuti banyak peserta. Setiap kursus memiliki satu instruktur. Satu kursus memiliki banyak modul yang tidak boleh berdiri sendiri tanpa kursus.

### Pertanyaan

1. Implementasikan rancangan ERD tersebut menggunakan DDL MySQL.
2. Tentukan struktur tabel, primary key, foreign key, dan atribut yang diperlukan.
3. Gunakan constraint yang sesuai, minimal `PRIMARY KEY`, `FOREIGN KEY`, dan `NOT NULL`.

**Pedoman penskoran:** Struktur tabel sesuai hasil analisis (10 poin); primary key dan foreign key (8 poin); tipe data dan atribut (5 poin); `NOT NULL`, `UNIQUE`, serta constraint lain yang relevan (5 poin); sintaks dan urutan DDL dapat dijalankan (2 poin).

### Jawaban

```sql
CREATE TABLE instruktur (
    id_instruktur INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE peserta (
    id_peserta INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE kursus (
    id_kursus INT AUTO_INCREMENT PRIMARY KEY,
    nama_kursus VARCHAR(100) NOT NULL,
    deskripsi TEXT,
    biaya DECIMAL(12,2) NOT NULL,
    id_instruktur INT NOT NULL,
    CONSTRAINT fk_kursus_instruktur FOREIGN KEY (id_instruktur)
        REFERENCES instruktur(id_instruktur)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT ck_kursus_biaya CHECK (biaya >= 0)
);

CREATE TABLE pendaftaran (
    id_peserta INT NOT NULL,
    id_kursus INT NOT NULL,
    tgl_daftar DATE NOT NULL,
    status ENUM('Aktif', 'Selesai', 'Batal') NOT NULL DEFAULT 'Aktif',
    PRIMARY KEY (id_peserta, id_kursus),
    FOREIGN KEY (id_peserta) REFERENCES peserta(id_peserta)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_kursus) REFERENCES kursus(id_kursus)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE modul_kursus (
    id_kursus INT NOT NULL,
    no_modul INT NOT NULL,
    judul_modul VARCHAR(150) NOT NULL,
    durasi_menit INT NOT NULL,
    PRIMARY KEY (id_kursus, no_modul),
    FOREIGN KEY (id_kursus) REFERENCES kursus(id_kursus)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT ck_modul_durasi CHECK (durasi_menit > 0)
);
```

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

### Jawaban

Kunci kandidat tabel awal adalah (`no_transaksi`, `kode_produk`). Nilai setiap kolom harus atomik sehingga tabel awal memenuhi 1NF. Pada 2NF, atribut transaksi dipisahkan dari atribut produk untuk menghilangkan ketergantungan parsial. Pada 3NF, atribut pemasok dipisahkan dari tabel transaksi karena `kd_pemasok` menentukan `nama_pemasok` dan `alamat_pemasok`.

Tabel hasil normalisasi hingga 3NF:

1. `Pemasok(kd_pemasok PK, nama_pemasok, alamat_pemasok)`
2. `Produk(kode_produk PK, nama_produk, harga_beli)`
3. `Pembelian(no_transaksi PK, tgl_transaksi, kd_pemasok FK)`
4. `Detail_Pembelian(no_transaksi PK/FK, kode_produk PK/FK, jumlah, total_item)`

`total_item` dapat disimpan sebagai nilai turunan (`harga_beli * jumlah`) atau dihitung saat query. Jika disimpan, nilainya harus dijaga konsisten.

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

### Jawaban

#### 1. Peserta yang lulus

```sql
SELECT p.nama_peserta, p.program_studi,
       pd.nama_kursus, pd.nilai_akhir
FROM peserta p
INNER JOIN pendaftaran pd ON pd.id_peserta = p.id_peserta
WHERE pd.status = 'Lulus';
```

#### 2. Pendaftaran terakhir setiap peserta

```sql
SELECT p.id_peserta, p.nama_peserta,
       MAX(pd.tanggal_daftar) AS tanggal_pendaftaran_terakhir
FROM peserta p
LEFT JOIN pendaftaran pd ON pd.id_peserta = p.id_peserta
GROUP BY p.id_peserta, p.nama_peserta
ORDER BY p.id_peserta;
```

Hasilnya: Rina `2025-09-07`, Dimas `2025-09-06`, Sari `2025-09-08`, dan Yoga `NULL`.
