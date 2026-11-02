# SOAL DAN JAWABAN UJIAN TENGAH SEMESTER (UTS)

**Semester:** Gasal 2025/2026  
**Program Studi:** Sistem Informasi  
**Mata Kuliah:** Basis Data D

---

## Pemetaan Materi dan Sub-CPMK

| Soal | Materi Modul | Sub-CPMK yang Diukur |
| --- | --- | --- |
| 1 | Modul 1–3 | Menganalisis kebutuhan dan merancang ERD (C4, C6) |
| 2 | Modul 2–3 | Menjelaskan entitas kuat/lemah dan menganalisis key (C2, C4) |
| 3 | Modul 4–5 | Menerapkan SQL DDL dan constraint (C3) |
| 4 | Modul 6 | Menganalisis ketergantungan dan normalisasi hingga 3NF (C4, C6) |
| 5 | Modul 7 | Menerapkan SQL JOIN (C3) |

---

## Soal 1 — Perancangan ERD Sistem Rawat Jalan (20 poin)

Klinik Sehat Bersama mengelola pasien, dokter, jadwal praktik, dan kunjungan. Seorang dokter dapat memiliki banyak jadwal praktik, sedangkan satu jadwal hanya dimiliki satu dokter. Pasien dapat melakukan banyak kunjungan; setiap kunjungan ditangani satu dokter pada satu jadwal. Sistem menyimpan keluhan, diagnosis, dan resep. Satu kunjungan dapat menghasilkan beberapa item resep, sedangkan satu obat dapat muncul pada banyak item resep. Data obat meliputi nama, satuan, dan stok.

### Pertanyaan

1. Buat ERD konseptual.
2. Tentukan entitas, atribut, dan primary key.
3. Tentukan hubungan, kardinalitas, dan partisipasi.
4. Lengkapi foreign key dan entitas asosiasi yang diperlukan.

**Pedoman penskoran:** ERD dan entitas (8); atribut dan PK (4); hubungan dan kardinalitas (6); FK serta atribut tambahan (2).

### Jawaban

- Pasien (id_pasien PK, nama_pasien, tgl_lahir, alamat, no_telp).
- Dokter (id_dokter PK, nama_dokter, spesialisasi, no_str AK).
- Jadwal_Praktik (id_jadwal PK, hari, jam_mulai, jam_selesai, id_dokter FK).
- Kunjungan (id_kunjungan PK, tgl_kunjungan, keluhan, diagnosis, id_pasien FK, id_dokter FK, id_jadwal FK).
- Obat (id_obat PK, nama_obat, satuan, stok).
- Detail_Resep (id_kunjungan PK/FK, id_obat PK/FK, dosis, jumlah).

Kardinalitas: Dokter–Jadwal_Praktik 1:N; Pasien–Kunjungan 1:N; Dokter–Kunjungan 1:N; Jadwal_Praktik–Kunjungan 1:N; Kunjungan–Obat M:N melalui Detail_Resep. Setiap Kunjungan wajib memiliki pasien, dokter, dan jadwal.

~~~text
Dokter (1) ─── (N) Jadwal_Praktik (1) ─── (N) Kunjungan (N) ─── (1) Pasien
                                      |
                                      N
                                      |
                              Detail_Resep (N) ─── (1) Obat
~~~

---

## Soal 2 — Entitas Kuat, Entitas Lemah, dan Kunci Alternatif (15 poin)

Sistem laboratorium mencatat pasien, pemeriksaan, dan parameter hasil pemeriksaan. Pasien dapat melakukan banyak pemeriksaan. Satu pemeriksaan memiliki beberapa parameter hasil, dan parameter hasil tidak dapat berdiri sendiri tanpa pemeriksaan induk. Nomor rekam medis pasien dan kode pemeriksaan harus unik.

### Pertanyaan

1. Identifikasi entitas kuat dan lemah beserta alasannya.
2. Tentukan PK, FK, dan alternate key.
3. Tentukan hubungan dan kardinalitas Pasien, Pemeriksaan, dan Detail_Hasil.

**Pedoman penskoran:** Identifikasi (5); PK, FK, AK (6); hubungan dan kardinalitas (4).

### Jawaban

- Pasien adalah entitas kuat: (id_pasien PK, no_rekam_medis AK, no_identitas AK, nama_pasien, tgl_lahir).
- Pemeriksaan adalah entitas kuat: (id_pemeriksaan PK, kode_pemeriksaan AK, tgl_pemeriksaan, jenis_pemeriksaan, id_pasien FK).
- Detail_Hasil adalah entitas lemah karena bergantung pada Pemeriksaan. PK kompositnya (id_pemeriksaan, no_parameter); id_pemeriksaan juga FK. Atribut lain: nama_parameter, nilai_hasil, satuan.

~~~text
Pasien (1) ─── (N) Pemeriksaan (1) ─── (N) Detail_Hasil
~~~

no_rekam_medis, no_identitas, dan kode_pemeriksaan diberi constraint UNIQUE.

---

## Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

Gudang koperasi mencatat kategori barang, barang, pemasok, dan penerimaan barang. Satu kategori memiliki banyak barang. Satu pemasok dapat melakukan banyak penerimaan, dan satu penerimaan hanya berasal dari satu pemasok. Satu penerimaan dapat berisi banyak barang, dan satu barang dapat muncul pada banyak penerimaan.

### Pertanyaan

1. Tentukan tabel, atribut, PK, dan FK.
2. Implementasikan dengan DDL MySQL.
3. Gunakan PRIMARY KEY, FOREIGN KEY, NOT NULL, UNIQUE, dan constraint relevan.

**Pedoman penskoran:** Struktur (10); PK/FK (8); tipe data (5); constraint (5); sintaks (2).

### Jawaban

~~~sql
CREATE TABLE kategori (
    id_kategori INT AUTO_INCREMENT PRIMARY KEY,
    nama_kategori VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE pemasok (
    id_pemasok INT AUTO_INCREMENT PRIMARY KEY,
    nama_pemasok VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    no_telp VARCHAR(20)
);

CREATE TABLE barang (
    id_barang INT AUTO_INCREMENT PRIMARY KEY,
    kode_barang VARCHAR(20) NOT NULL UNIQUE,
    nama_barang VARCHAR(100) NOT NULL,
    satuan VARCHAR(20) NOT NULL,
    stok INT NOT NULL DEFAULT 0,
    id_kategori INT NOT NULL,
    FOREIGN KEY (id_kategori) REFERENCES kategori(id_kategori),
    CONSTRAINT ck_stok CHECK (stok >= 0)
);

CREATE TABLE penerimaan (
    id_penerimaan INT AUTO_INCREMENT PRIMARY KEY,
    no_dokumen VARCHAR(30) NOT NULL UNIQUE,
    tgl_penerimaan DATE NOT NULL,
    id_pemasok INT NOT NULL,
    FOREIGN KEY (id_pemasok) REFERENCES pemasok(id_pemasok)
);

CREATE TABLE detail_penerimaan (
    id_penerimaan INT NOT NULL,
    id_barang INT NOT NULL,
    jumlah INT NOT NULL,
    harga_beli DECIMAL(12,2) NOT NULL,
    PRIMARY KEY (id_penerimaan, id_barang),
    FOREIGN KEY (id_penerimaan) REFERENCES penerimaan(id_penerimaan),
    FOREIGN KEY (id_barang) REFERENCES barang(id_barang),
    CONSTRAINT ck_jumlah CHECK (jumlah > 0),
    CONSTRAINT ck_harga_beli CHECK (harga_beli >= 0)
);
~~~

---

## Soal 4 — Normalisasi hingga 3NF (25 poin)

Tabel JadwalKuliah memiliki kolom: kode_jadwal, hari, jam_mulai, ruang, kode_mk, nama_mk, sks, kode_dosen, nama_dosen, kode_prodi, dan nama_prodi.

| kode_jadwal | hari | jam_mulai | ruang | kode_mk | nama_mk | sks | kode_dosen | nama_dosen | kode_prodi | nama_prodi |
| --- | --- | --- | --- | --- | --- | ---: | --- | --- | --- | --- |
| JW001 | Senin | 08:00 | R201 | BD101 | Basis Data | 3 | DS01 | Rina | SI | Sistem Informasi |
| JW002 | Senin | 10:00 | R201 | PW201 | Pemrograman Web | 3 | DS02 | Budi | SI | Sistem Informasi |
| JW003 | Selasa | 08:00 | R202 | AK101 | Akuntansi Dasar | 2 | DS03 | Sari | AK | Akuntansi |

### Pertanyaan

1. Uraikan normalisasi 1NF, 2NF, dan 3NF.
2. Tunjukkan tabel hasil 3NF beserta PK dan FK.

**Pedoman penskoran:** 1NF (4); 2NF (6); 3NF (6); tabel hasil (5); PK/FK (4).

### Jawaban

Nilai tabel atomik sehingga memenuhi 1NF. Karena kode_jadwal adalah kunci tunggal, tidak ada ketergantungan parsial pada 2NF. Pada 3NF, atribut mata kuliah, dosen, dan program studi dipisahkan karena masing-masing kode menentukan atribut deskriptifnya.

1. Program_Studi(kode_prodi PK, nama_prodi)
2. Mata_Kuliah(kode_mk PK, nama_mk, sks)
3. Dosen(kode_dosen PK, nama_dosen)
4. Jadwal(kode_jadwal PK, hari, jam_mulai, ruang, kode_mk FK, kode_dosen FK, kode_prodi FK)

---

## Soal 5 — SQL JOIN (10 poin)

### Tabel Anggota

| id_anggota | nama_anggota | jenis_anggota | kota |
| --- | --- | --- | --- |
| A001 | Dimas | Mahasiswa | Balikpapan |
| A002 | Wati | Dosen | Samarinda |
| A003 | Ilham | Mahasiswa | Bontang |
| A004 | Rosi | Umum | Balikpapan |

### Tabel Pembayaran

| id_pembayaran | id_anggota | tanggal_bayar | jumlah | status |
| --- | --- | --- | ---: | --- |
| BY001 | A001 | 2025-09-05 | 50000 | Lunas |
| BY002 | A001 | 2025-10-05 | 50000 | Lunas |
| BY003 | A002 | 2025-09-07 | 75000 | Pending |
| BY004 | A003 | 2025-09-08 | 40000 | Lunas |

### Pertanyaan

1. Gunakan INNER JOIN untuk menampilkan nama anggota, jenis anggota, dan jumlah pembayaran berstatus Lunas.
2. Gunakan LEFT JOIN dan fungsi agregat untuk menampilkan semua anggota beserta total pembayaran lunas. Anggota tanpa pembayaran lunas tetap muncul dengan nilai 0.

**Pedoman penskoran:** INNER JOIN (4); LEFT JOIN dan agregasi (4); output dan penanganan tanpa transaksi (2).

### Jawaban

~~~sql
SELECT a.nama_anggota, a.jenis_anggota, p.jumlah
FROM anggota a
INNER JOIN pembayaran p ON p.id_anggota = a.id_anggota
WHERE p.status = 'Lunas';
~~~

~~~sql
SELECT a.id_anggota, a.nama_anggota,
       COALESCE(SUM(CASE WHEN p.status = 'Lunas' THEN p.jumlah ELSE 0 END), 0)
           AS total_pembayaran_lunas
FROM anggota a
LEFT JOIN pembayaran p ON p.id_anggota = a.id_anggota
GROUP BY a.id_anggota, a.nama_anggota
ORDER BY a.id_anggota;
~~~

Hasil total: Dimas 100000, Wati 0, Ilham 40000, dan Rosi 0.

