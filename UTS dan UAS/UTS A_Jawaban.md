# SOAL DAN JAWABAN UJIAN TENGAH SEMESTER (UTS)

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

**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan dan merancang basis data melalui ERD (C4, C6).

Tanamin Bumi Nusantara mengelola sistem donasi daring untuk kegiatan penanaman pohon mangrove. Sistem perlu menyimpan informasi identitas dan kontak donatur. Setiap donatur dapat memberikan banyak donasi, dan setiap donasi perlu dicatat waktu penerimaan, nominal, serta cara pembayarannya. Satu donasi dapat dialokasikan ke beberapa proyek.

Setiap proyek memiliki informasi mengenai nama kegiatan, lokasi pelaksanaan, serta periode mulai dan selesai. Setiap proyek dikelola oleh satu koordinator yang merupakan pegawai. Data pegawai yang dibutuhkan meliputi identitas, jabatan, dan informasi kontak. Rancanglah struktur data yang paling sesuai berdasarkan kebutuhan tersebut.

### Pertanyaan

1. Buatlah Entity Relationship Diagram (ERD) konseptual berdasarkan skenario tersebut.
2. Tentukan entitas, atribut, dan atribut kunci (primary key) dari masing-masing entitas.
3. Tentukan jenis hubungan antarentitas, kardinalitas, dan partisipasi setiap entitas.
4. Lengkapi rancangan dengan atribut kunci, foreign key, dan atribut lain yang diperlukan berdasarkan analisis Anda.

**Pedoman penskoran:** ERD dan kelengkapan entitas (8 poin); atribut dan primary key (4 poin); hubungan, kardinalitas, dan partisipasi (6 poin); konsistensi foreign key serta atribut tambahan (2 poin).

### Jawaban

- **Donatur** (`id_donatur` PK, `nama`, `email`, `no_telp`)
- **Donasi** (`id_donasi` PK, `tgl_donasi`, `jumlah_donasi`, `metode_pembayaran`, `id_donatur` FK)
- **Proyek** (`id_proyek` PK, `nama_proyek`, `lokasi`, `tgl_mulai`, `tgl_selesai`, `id_pegawai` FK)
- **Pegawai** (`id_pegawai` PK, `nama_pegawai`, `jabatan`, `kontak`)
- **Donasi_Proyek** (`id_donasi` PK/FK, `id_proyek` PK/FK, `jumlah_alokasi`)

Kardinalitas: Donatur–Donasi = 1:N; Donasi–Proyek = M:N dan direalisasikan melalui `Donasi_Proyek`; Pegawai–Proyek = 1:N.

```text
Donatur (1) ─── (N) Donasi (1) ─── (N) Donasi_Proyek (N) ─── (1) Proyek (N) ─── (1) Pegawai
```

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data serta menganalisis kebutuhan rancangan, entitas, dan key (C2, C4).

Toko daring mencatat pelanggan, pesanan, dan item pesanan. Pelanggan dapat memiliki banyak pesanan, sedangkan item pesanan tidak dapat berdiri sendiri tanpa pesanan induk. Setiap pelanggan memiliki email unik dan nomor pelanggan sebagai identitas alternatif.

### Pertanyaan

1. Identifikasi entitas kuat dan entitas lemah berdasarkan skenario tersebut, lalu jelaskan alasannya.
2. Tentukan primary key, foreign key, dan kunci alternatif (alternate key) dari setiap entitas.
3. Tentukan hubungan dan kardinalitas antara Pelanggan, Pesanan, dan Item_Pesanan.

**Pedoman penskoran:** Identifikasi dan alasan entitas kuat/lemah (5 poin); primary key, foreign key, dan alternate key (6 poin); hubungan dan kardinalitas (4 poin).

### Jawaban

- **Pelanggan** adalah entitas kuat: (`id_pelanggan` PK, `no_pelanggan` AK, `email` AK, `nama`).
- **Pesanan** adalah entitas kuat: (`id_pesanan` PK, `tgl_pesanan`, `total_harga`, `id_pelanggan` FK).
- **Item_Pesanan** adalah entitas lemah karena bergantung pada Pesanan. Kuncinya adalah (`id_pesanan`, `no_urut_item`) sebagai PK komposit; `id_pesanan` juga menjadi FK.

```text
Pelanggan (1) ─── (N) Pesanan (1) ─── (N) Item_Pesanan
```

`no_pelanggan` dan `email` merupakan kunci alternatif dan sebaiknya diberi batasan `UNIQUE`.

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan hasil rancangan basis data menggunakan perintah SQL DDL dan constraint (C3).

EcoRestore mencatat donatur, donasi, pegawai, proyek, dan alokasi donasi ke proyek. Donatur dapat memiliki banyak donasi; donasi dapat dialokasikan ke banyak proyek; setiap proyek memiliki satu pegawai penanggung jawab.

### Pertanyaan

1. Implementasikan rancangan ERD pada Soal 1 menggunakan DDL MySQL.
2. Tentukan struktur tabel, primary key, foreign key, dan atribut yang diperlukan berdasarkan skenario.
3. Gunakan constraint yang sesuai, minimal `PRIMARY KEY`, `FOREIGN KEY`, dan `NOT NULL`.

**Pedoman penskoran:** Struktur tabel sesuai hasil analisis (10 poin); primary key dan foreign key (8 poin); tipe data dan atribut (5 poin); `NOT NULL`, `UNIQUE`, serta constraint lain yang relevan (5 poin); sintaks dan urutan DDL dapat dijalankan (2 poin).

### Jawaban

```sql
CREATE TABLE donatur (
    id_donatur INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    no_telp VARCHAR(20)
);

CREATE TABLE pegawai (
    id_pegawai INT AUTO_INCREMENT PRIMARY KEY,
    nama_pegawai VARCHAR(100) NOT NULL,
    jabatan VARCHAR(50)
);

CREATE TABLE donasi (
    id_donasi INT AUTO_INCREMENT PRIMARY KEY,
    tgl_donasi DATE NOT NULL,
    jumlah DECIMAL(15,2) NOT NULL,
    id_donatur INT NOT NULL,
    FOREIGN KEY (id_donatur) REFERENCES donatur(id_donatur)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE proyek (
    id_proyek INT AUTO_INCREMENT PRIMARY KEY,
    nama_proyek VARCHAR(100) NOT NULL,
    lokasi VARCHAR(100) NOT NULL,
    id_pegawai INT NOT NULL,
    FOREIGN KEY (id_pegawai) REFERENCES pegawai(id_pegawai)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE donasi_proyek (
    id_donasi INT NOT NULL,
    id_proyek INT NOT NULL,
    jumlah_alokasi DECIMAL(15,2) NOT NULL,
    PRIMARY KEY (id_donasi, id_proyek),
    FOREIGN KEY (id_donasi) REFERENCES donasi(id_donasi)
        ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (id_proyek) REFERENCES proyek(id_proyek)
        ON UPDATE CASCADE ON DELETE CASCADE
);
```

---

## Soal 4 — Normalisasi hingga 3NF (25 poin)

**Sub-CPMK:** Mahasiswa mampu menganalisis ketergantungan data dan merancang basis data yang konsisten melalui normalisasi (C4, C6).

Tabel `Penjualan` memiliki kolom: `no_faktur`, `tgl_faktur`, `kd_pelanggan`, `nama_pelanggan`, `alamat`, `kode_barang`, `nama_barang`, `harga_satuan`, `jumlah`, dan `subtotal`.

### Pertanyaan

1. Uraikan secara singkat proses normalisasi tabel dari 1NF, 2NF, hingga 3NF.
2. Tunjukkan tabel hasil normalisasi hingga 3NF beserta primary key dan foreign key setiap tabel.

**Pedoman penskoran:** Penjelasan tahap 1NF (4 poin); penghilangan ketergantungan parsial pada 2NF (6 poin); penghilangan ketergantungan transitif pada 3NF (6 poin); hasil tabel 3NF (5 poin); primary key dan foreign key (4 poin).

Data:

| no_faktur | tgl_faktur | kd_pelanggan | nama_pelanggan | alamat | kode_barang | nama_barang | harga_satuan | jumlah | subtotal |
| --------- | ---------- | ------------ | -------------- | ------ | ----------- | ----------- | -----------: | -----: | -------: |
| F001      | 2025-10-19 | C01          | Andi           | BPN    | B01         | Pulpen      |         5000 |     10 |    50000 |
| F001      | 2025-10-19 | C01          | Andi           | BPN    | B02         | Buku tulis  |         8000 |      5 |    40000 |
| F002      | 2025-10-20 | C02          | Budi           | SMD    | B01         | Pulpen      |         5000 |      2 |    10000 |

### Jawaban

Tabel hasil normalisasi hingga 3NF:

1. `Pelanggan(kd_pelanggan PK, nama_pelanggan, alamat)`
2. `Barang(kode_barang PK, nama_barang, harga_satuan)`
3. `Faktur(no_faktur PK, tgl_faktur, kd_pelanggan FK)`
4. `Detail_Faktur(no_faktur PK/FK, kode_barang PK/FK, jumlah, subtotal)`

Tabel awal memenuhi 1NF karena nilainya atomik. Pemisahan pada 2NF menghilangkan ketergantungan parsial, sedangkan struktur di atas menghilangkan ketergantungan transitif sehingga memenuhi 3NF.

---

## Soal 5 — SQL JOIN (10 poin)

**Sub-CPMK:** Mahasiswa mampu menerapkan SQL untuk menggabungkan data antartabel (C3).

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

**Pedoman penskoran:** Query `INNER JOIN`, kondisi join, dan filter status (4 poin); query `LEFT JOIN`, fungsi agregat, dan `GROUP BY` (4 poin); ketepatan kolom output dan penanganan donatur tanpa transaksi (2 poin).

### Jawaban

#### 1. Donasi berhasil

```sql
SELECT d.nama_donatur, d.kota, dn.jumlah_donasi
FROM donatur d
INNER JOIN donasi dn ON dn.id_donatur = d.id_donatur
WHERE dn.status = 'Berhasil';
```

#### 2. Donasi terakhir setiap donatur

```sql
SELECT d.id_donatur, d.nama_donatur,
       MAX(dn.tanggal_donasi) AS tanggal_donasi_terakhir
FROM donatur d
LEFT JOIN donasi dn ON dn.id_donatur = d.id_donatur
GROUP BY d.id_donatur, d.nama_donatur
ORDER BY d.id_donatur;
```

Hasilnya: Arif `2025-09-18`, PT Sejahtera `2025-09-12`, Lala `2025-09-20`, dan Yayasan Peduli Alam `NULL`.
