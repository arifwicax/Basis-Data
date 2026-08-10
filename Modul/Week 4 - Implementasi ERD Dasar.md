# Minggu 4 — Implementasi ERD Dasar

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan basis data dan merancang basis data (C4, C6).

## 1. Posisi Pertemuan

Minggu 4 merupakan bagian pertama implementasi ERD. Fokusnya adalah menerjemahkan entitas, atribut, serta relasi dasar menjadi skema relasional dan DDL MySQL. Minggu 5 melanjutkan relasi N:M, relasi rekursif, relasi 1:1, DML, serta pengujian integritas.

## 2. Pengertian Implementasi ERD

ERD menggambarkan objek dan hubungan data secara konseptual. Implementasi ERD adalah proses mengubah rancangan tersebut menjadi struktur fisik pada DBMS.

Alurnya:

```text
Kebutuhan → ERD → Skema Relasional → DDL → Tabel → DML → Verifikasi
```

Tahapan dari slide:

1. identifikasi entitas;
2. identifikasi dan deskripsikan relasi;
3. tambahkan atribut yang diperlukan;
4. buat ERD dengan notasi yang sesuai;
5. implementasikan ERD ke basis data.

Tahap kelima tidak dilakukan secara mekanis. Setiap key, tipe data, NULL, dan constraint harus tetap mengikuti aturan bisnis.

## 3. Aturan Dasar Konversi

Slide memberikan pedoman berikut:

1. setiap entity set menjadi tabel;
2. relasi 1:N umumnya menghasilkan dua tabel dengan foreign key pada sisi N;
3. relasi 1:1 umumnya tetap berupa dua tabel dengan foreign key pada salah satu sisi;
4. relasi N:M menghasilkan dua tabel utama dan satu tabel asosiatif.

Pedoman ini perlu dilengkapi:

- atribut key menjadi primary key;
- atribut sederhana menjadi kolom;
- atribut composite dipecah bila komponennya dibutuhkan;
- atribut multivalue menjadi tabel tersendiri;
- atribut derived biasanya dihitung;
- atribut relasi ditempatkan pada tabel yang mewakili relasi.

## 4. Studi Kasus Sistem Akademik

Entitas pada slide:

- Mahasiswa;
- Jurusan;
- Dosen;
- MataKuliah;
- Mengajar;
- Mengikuti/KRS;
- Prasyarat.

Contoh aturan bisnis:

1. Setiap mahasiswa berada pada satu jurusan.
2. Satu jurusan memiliki banyak mahasiswa.
3. Dosen dapat mengajar banyak mata kuliah pada periode berbeda.
4. Mata kuliah dapat diajar beberapa dosen.
5. Mahasiswa dapat mengikuti banyak kelas mengajar.
6. KRS menyimpan nilai mahasiswa pada kelas tertentu.
7. Mata kuliah dapat mempunyai prasyarat mata kuliah lain.
8. Mahasiswa dapat memiliki dosen wali dan pembimbing.

## 5. Setiap Entitas Menjadi Tabel

Entitas mandiri pada slide menjadi tabel berikut:

```text
Mahasiswa(nim, nama, email)
Jurusan(kode_jurusan, nama, jenjang)
Dosen(nip, nama, email)
MataKuliah(kode_mk, nama, sks)
```

### Primary Key

- `nim` mengidentifikasi Mahasiswa;
- `kode_jurusan` mengidentifikasi Jurusan;
- `nip` mengidentifikasi Dosen;
- `kode_mk` mengidentifikasi MataKuliah.

Primary key harus unik dan tidak boleh NULL.

## 6. Pengenalan DDL

**Data Definition Language (DDL)** mendefinisikan struktur basis data.

| Perintah | Fungsi |
|---|---|
| `CREATE` | Membuat database/tabel |
| `ALTER` | Mengubah struktur |
| `DROP` | Menghapus objek |
| `TRUNCATE` | Mengosongkan tabel |
| `RENAME` | Mengganti nama objek |

### Membuat Database

```sql
CREATE DATABASE sistem_akademik
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE sistem_akademik;
```

### Membuat Tabel Entitas

```sql
CREATE TABLE Jurusan (
    kode_jurusan VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    jenjang VARCHAR(10) NOT NULL
);

CREATE TABLE Dosen (
    nip VARCHAR(20) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE
);

CREATE TABLE MataKuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    sks TINYINT UNSIGNED NOT NULL,
    CONSTRAINT chk_mk_sks CHECK (sks BETWEEN 1 AND 6)
);
```

## 7. Pemilihan Tipe Data

| Data | Tipe yang disarankan | Alasan |
|---|---|---|
| NIM/NIP/kode | `VARCHAR` | Dapat memiliki nol depan atau huruf |
| Nama/email | `VARCHAR` | Teks dengan panjang bervariasi |
| SKS | `TINYINT UNSIGNED` | Bilangan kecil nonnegatif |
| Tahun | `YEAR` atau `SMALLINT` | Menyimpan tahun akademik |
| Nilai huruf | `CHAR(2)`/domain terbatas | Nilai pendek |

Pilih tipe berdasarkan domain, bukan berdasarkan tampilan contoh saja.

## 8. Constraint Dasar

| Constraint | Fungsi |
|---|---|
| `PRIMARY KEY` | Identitas unik |
| `NOT NULL` | Nilai wajib |
| `UNIQUE` | Candidate key tidak boleh duplikat |
| `CHECK` | Membatasi domain |
| `DEFAULT` | Nilai awal |
| `FOREIGN KEY` | Menjaga hubungan antar tabel |

Constraint membuat aturan ERD dijaga oleh DBMS, bukan hanya oleh aplikasi.

## 9. Implementasi Relasi One-to-Many

Aturan slide:

> Primary key dari sisi one ditempatkan sebagai foreign key pada sisi many. Atribut relasi juga ditempatkan pada sisi many jika setiap baris sisi many hanya memiliki satu pasangan.

Relasi Jurusan–Mahasiswa:

```text
JURUSAN 1 ───────── N MAHASISWA
```

`kode_jurusan` masuk ke Mahasiswa:

```sql
CREATE TABLE Mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE,
    kode_jurusan VARCHAR(10) NOT NULL,
    CONSTRAINT fk_mahasiswa_jurusan
      FOREIGN KEY (kode_jurusan)
      REFERENCES Jurusan(kode_jurusan)
);
```

### Mengapa Bukan Sebaliknya?

Jangan menyimpan daftar NIM dalam satu kolom Jurusan. Slide menegaskan bahwa **multiple value dilarang** dalam satu atribut pada rancangan relasional:

```text
J001 | JMTI | 10202101, 10202102
```

Ini adalah multivalue, sulit dicari, tidak atomik, dan tidak dapat diberi foreign key per nilai.

## 10. Pengenalan DML

**Data Manipulation Language (DML)** mengelola isi tabel.

| Perintah | Fungsi |
|---|---|
| `INSERT` | Menambah data |
| `SELECT` | Membaca data |
| `UPDATE` | Mengubah data |
| `DELETE` | Menghapus baris |

### Mengisi Tabel Induk

```sql
INSERT INTO Jurusan (kode_jurusan, nama, jenjang) VALUES
('J001', 'JMTI', 'S1'),
('J002', 'JSTPK', 'S1'),
('J003', 'JTIP', 'S1');
```

### Mengisi Tabel Anak

```sql
INSERT INTO Mahasiswa (nim, nama, email, kode_jurusan) VALUES
('10202101', 'Doni', 'doni@example.test', 'J002'),
('10202102', 'Dika', 'dika@example.test', 'J001'),
('10202103', 'Fitri', 'fitri@example.test', 'J003'),
('10202104', 'Erna', 'erna@example.test', 'J002');
```

Tabel induk diisi terlebih dahulu agar nilai foreign key sudah tersedia.

## 11. Membaca dan Memverifikasi Data

```sql
SELECT * FROM Jurusan;
SELECT * FROM Mahasiswa;

SELECT m.nim, m.nama, j.nama AS jurusan
FROM Mahasiswa AS m
JOIN Jurusan AS j
  ON j.kode_jurusan = m.kode_jurusan;
```

`SELECT` digunakan untuk membuktikan bahwa struktur dan relasi bekerja sesuai ERD.

## 12. UPDATE dan DELETE Aman

Sebelum mengubah atau menghapus, periksa target dengan `SELECT`.

```sql
SELECT * FROM Mahasiswa WHERE nim = '10202104';
UPDATE Mahasiswa
SET email = 'erna.baru@example.test'
WHERE nim = '10202104';
```

Foreign key dapat mencegah penghapusan Jurusan yang masih dipakai Mahasiswa.

```sql
DELETE FROM Jurusan WHERE kode_jurusan = 'J002';
```

Jika ditolak, DBMS sedang menjaga integritas referensial.

## 13. Urutan Implementasi

1. Buat database.
2. Buat tabel tanpa ketergantungan: Jurusan, Dosen, MataKuliah.
3. Buat tabel Mahasiswa yang bergantung pada Jurusan.
4. Isi tabel induk.
5. Isi tabel anak.
6. Periksa struktur dengan `DESCRIBE` dan `SHOW CREATE TABLE`.
7. Periksa data dengan `SELECT`.
8. Uji constraint secara sengaja pada database latihan.

## 14. Kesalahan Umum

1. Membuat tabel anak sebelum induk.
2. Memilih tipe numerik untuk NIM/NIP.
3. Tidak memberi primary key.
4. Menyimpan daftar foreign key dalam satu kolom.
5. Menulis nama kolom berbeda antara PK dan FK tanpa dokumentasi.
6. Mengisi tabel anak sebelum data induk ada.
7. Menggunakan `UPDATE`/`DELETE` tanpa `WHERE`.
8. Menghapus constraint agar data salah dapat masuk.

## 15. Latihan dan Kuis

1. Mengapa setiap entity set menjadi tabel?
2. Di sisi mana foreign key relasi 1:N ditempatkan?
3. Mengapa daftar NIM tidak boleh disimpan dalam satu kolom Jurusan?
4. Bedakan DDL dan DML.
5. Mengapa urutan pembuatan dan pengisian tabel penting?
6. Tuliskan DDL Dosen dan dua DML INSERT.
7. Apa fungsi `SHOW CREATE TABLE`?

## 16. Rangkuman

- Implementasi ERD mengubah model konseptual menjadi skema fisik.
- Setiap entitas menjadi tabel dan key menjadi primary key.
- Relasi 1:N menempatkan foreign key pada sisi N.
- Multivalue tidak disimpan sebagai daftar dalam satu kolom.
- DDL mendefinisikan struktur, sedangkan DML mengelola data.
- Constraint menerapkan aturan model di DBMS.
- Implementasi harus diverifikasi dengan struktur, data, dan query relasi.

## 17. Asesmen dan Praktikum

Asesmen mencakup ketepatan pemetaan entitas, relasi 1:N, DDL, DML awal, dan pengujian foreign key.

[Praktikum Minggu 4 — Implementasi ERD Dasar](../script/Week%204/Praktikum%20Week%204%20-%20Implementasi%20ERD%20Dasar.md)

## Referensi

1. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
2. Slide Week 4 & 5 — *Implementasi ERD*.
3. RPS SI2514010 — Basis Data.
