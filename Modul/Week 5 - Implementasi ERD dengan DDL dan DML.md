# Minggu 5 — Implementasi ERD Lanjutan dengan DDL dan DML

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan dan menerapkan penggunaan perintah SQL (DDL, DML, DCL) (C2, C3).

## 1. Posisi Pertemuan

Minggu 5 melanjutkan implementasi entitas dan relasi 1:N dari Minggu 4. Fokusnya adalah relasi N:M, entitas asosiatif Mengajar dan Mengikuti/KRS, relasi rekursif Prasyarat, relasi 1:1, serta penerapan DDL dan DML lengkap.

## 2. Review Skema Dasar

Tabel yang telah tersedia:

```text
Jurusan(kode_jurusan, nama, jenjang)
Dosen(nip, nama, email)
MataKuliah(kode_mk, nama, sks)
Mahasiswa(nim, nama, email, kode_jurusan)
```

Urutan implementasi harus mengikuti dependensi foreign key.

## 3. Implementasi Relasi Many-to-Many

Slide menjelaskan bahwa relasi N:M menjadi tabel tersendiri.

Contoh Dosen–MataKuliah:

```text
DOSEN 1 ── N MENGAJAR N ── 1 MATA_KULIAH
```

Mengajar memiliki atribut periode, sehingga bukan sekadar pasangan key.

```sql
CREATE TABLE Mengajar (
    kode_mengajar VARCHAR(12) PRIMARY KEY,
    semester TINYINT UNSIGNED NOT NULL,
    tahun YEAR NOT NULL,
    nip VARCHAR(20) NOT NULL,
    kode_mk VARCHAR(10) NOT NULL,
    CONSTRAINT fk_mengajar_dosen
      FOREIGN KEY (nip) REFERENCES Dosen(nip),
    CONSTRAINT fk_mengajar_mk
      FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
    CONSTRAINT uq_mengajar
      UNIQUE (semester, tahun, nip, kode_mk)
);
```

`kode_mengajar` adalah surrogate/business identifier. Unique constraint mencegah penawaran yang sama tercatat dua kali.

## 4. Mengikuti/KRS sebagai Relasi N:M

Mahasiswa mengikuti kelas Mengajar:

```text
MAHASISWA 1 ── N MENGIKUTI N ── 1 MENGAJAR
```

```sql
CREATE TABLE Mengikuti (
    kode_mengajar VARCHAR(12) NOT NULL,
    nim VARCHAR(15) NOT NULL,
    nilai CHAR(2),
    PRIMARY KEY (kode_mengajar, nim),
    CONSTRAINT fk_mengikuti_mengajar
      FOREIGN KEY (kode_mengajar)
      REFERENCES Mengajar(kode_mengajar),
    CONSTRAINT fk_mengikuti_mahasiswa
      FOREIGN KEY (nim)
      REFERENCES Mahasiswa(nim),
    CONSTRAINT chk_mengikuti_nilai
      CHECK (nilai IS NULL OR nilai IN ('A','AB','B','BC','C','D','E'))
);
```

`nilai` ditempatkan pada Mengikuti karena nilainya bergantung pada mahasiswa dalam kelas tertentu.

## 5. Relasi Ganda ke Entitas Sama

Slide menunjukkan Mahasiswa memiliki `nip_wali` dan `nip_pembimbing`. Keduanya merujuk Dosen, tetapi memainkan peran berbeda.

```sql
ALTER TABLE Mahasiswa
  ADD COLUMN nip_wali VARCHAR(20),
  ADD COLUMN nip_pembimbing VARCHAR(20),
  ADD CONSTRAINT fk_mahasiswa_wali
    FOREIGN KEY (nip_wali) REFERENCES Dosen(nip),
  ADD CONSTRAINT fk_mahasiswa_pembimbing
    FOREIGN KEY (nip_pembimbing) REFERENCES Dosen(nip);
```

Nama constraint harus berbeda. Kolom boleh NULL bila mahasiswa belum mempunyai wali/pembimbing sesuai aturan bisnis.

## 6. Relasi Rekursif Prasyarat

Mata kuliah dapat memiliki prasyarat mata kuliah lain:

```text
MATA_KULIAH N ── PRASYARAT ── N MATA_KULIAH
```

```sql
CREATE TABLE Prasyarat (
    kode_mk VARCHAR(10) NOT NULL,
    kode_mk_prasyarat VARCHAR(10) NOT NULL,
    PRIMARY KEY (kode_mk, kode_mk_prasyarat),
    CONSTRAINT fk_prasyarat_mk
      FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
    CONSTRAINT fk_prasyarat_syarat
      FOREIGN KEY (kode_mk_prasyarat) REFERENCES MataKuliah(kode_mk),
    CONSTRAINT chk_prasyarat_bukan_diri
      CHECK (kode_mk <> kode_mk_prasyarat)
);
```

Kedua foreign key menuju tabel sama tetapi memiliki peran berbeda. Pencegahan siklus tidak cukup dengan CHECK sederhana dan memerlukan aturan aplikasi/prosedur tambahan.

## 7. Implementasi Relasi One-to-One

Slide menggunakan Dosen–Jurusan:

- satu dosen paling banyak mengepalai satu jurusan;
- tidak semua dosen menjadi kepala jurusan (minimum 0);
- setiap jurusan harus mempunyai satu kepala jurusan (minimum 1).

Foreign key lebih tepat diletakkan pada Jurusan karena partisipasi Jurusan wajib.

```sql
ALTER TABLE Jurusan
  ADD COLUMN nip_kepala VARCHAR(20) NOT NULL,
  ADD CONSTRAINT uq_jurusan_kepala UNIQUE (nip_kepala),
  ADD CONSTRAINT fk_jurusan_kepala
    FOREIGN KEY (nip_kepala) REFERENCES Dosen(nip);
```

`UNIQUE` memastikan satu dosen tidak mengepalai lebih dari satu jurusan. `NOT NULL` memastikan setiap jurusan memiliki kepala.

### Masalah Urutan Data

Tabel Jurusan sudah dibutuhkan Mahasiswa, tetapi Jurusan membutuhkan Dosen sebagai kepala. Dalam praktik, salah satu strategi adalah membuat tabel dahulu tanpa constraint kepala, mengisi data dasar, lalu menambahkan kolom/constraint dengan `ALTER TABLE`, seperti contoh di atas.

## 8. DDL Lengkap dan Urutan Tabel

Urutan yang aman:

1. `Dosen`;
2. `MataKuliah`;
3. `Jurusan`;
4. `Mahasiswa`;
5. `Mengajar`;
6. `Mengikuti`;
7. `Prasyarat`.

Jika ada circular dependency, buat struktur dasar terlebih dahulu dan tambahkan constraint sesudahnya.

## 9. DML INSERT

```sql
INSERT INTO Dosen (nip, nama, email) VALUES
('123345', 'Eri', 'eri@example.test'),
('223344', 'Bima', 'bima@example.test'),
('222333', 'Ervan', 'ervan@example.test');

INSERT INTO MataKuliah (kode_mk, nama, sks) VALUES
('MK001', 'Basis Data', 2),
('MK002', 'Pemrograman Web', 3),
('MK003', 'PBO', 3);

INSERT INTO Mengajar
  (kode_mengajar, semester, tahun, nip, kode_mk) VALUES
('KM001', 3, 2022, '123345', 'MK002'),
('KM002', 2, 2022, '223344', 'MK001');

INSERT INTO Mengikuti (kode_mengajar, nim, nilai) VALUES
('KM001', '10202101', 'A'),
('KM002', '10202102', 'B');
```

Gunakan data sintetis dan domain email `.test` untuk contoh pembelajaran.

## 10. DML SELECT dan JOIN

```sql
SELECT m.nim, m.nama,
       mk.nama AS mata_kuliah,
       d.nama AS dosen,
       mg.semester, mg.tahun,
       k.nilai
FROM Mengikuti AS k
JOIN Mahasiswa AS m ON m.nim = k.nim
JOIN Mengajar AS mg ON mg.kode_mengajar = k.kode_mengajar
JOIN MataKuliah AS mk ON mk.kode_mk = mg.kode_mk
JOIN Dosen AS d ON d.nip = mg.nip
ORDER BY m.nim, mg.tahun, mg.semester;
```

JOIN membuktikan bahwa tabel hasil konversi ERD dapat digabung kembali menjadi informasi yang bermakna.

## 11. DML UPDATE

```sql
SELECT * FROM Mengikuti
WHERE kode_mengajar = 'KM001' AND nim = '10202101';

UPDATE Mengikuti
SET nilai = 'AB'
WHERE kode_mengajar = 'KM001' AND nim = '10202101';
```

Periksa target sebelum dan sesudah UPDATE. Kondisi menggunakan key agar baris sasaran jelas.

## 12. DML DELETE

```sql
SELECT * FROM Mengikuti
WHERE kode_mengajar = 'KM002' AND nim = '10202102';

DELETE FROM Mengikuti
WHERE kode_mengajar = 'KM002' AND nim = '10202102';
```

Hapus data anak sebelum induk jika aksi referensial tidak menggunakan cascade. Hindari cascade tanpa memahami dampaknya terhadap histori.

## 13. Pengujian Constraint

Lakukan uji negatif pada database latihan:

1. NIM duplikat → ditolak primary key.
2. Jurusan tidak tersedia → ditolak foreign key.
3. SKS di luar domain → ditolak CHECK.
4. KRS sama dua kali → ditolak composite primary key.
5. Nilai tidak sah → ditolak CHECK.
6. Mata kuliah menjadi prasyarat dirinya → ditolak CHECK.
7. Satu dosen menjadi kepala dua jurusan → ditolak UNIQUE.

Pesan error adalah bukti constraint bekerja, bukan alasan untuk menghapus constraint.

## 14. ALTER, DROP, dan TRUNCATE

```sql
ALTER TABLE MataKuliah ADD COLUMN aktif BOOLEAN NOT NULL DEFAULT TRUE;
```

`DROP TABLE` menghapus struktur beserta data. `TRUNCATE TABLE` mengosongkan data. Keduanya hanya digunakan pada lingkungan latihan setelah target diperiksa dan backup tersedia bila diperlukan.

## 15. DDL, DML, dan DCL

| Kelompok | Tujuan | Contoh |
|---|---|---|
| DDL | Mendefinisikan struktur | CREATE, ALTER, DROP |
| DML | Mengelola data | INSERT, SELECT, UPDATE, DELETE |
| DCL | Mengatur hak akses | GRANT, REVOKE |

DCL diperdalam bersama SQL lanjutan. Pada implementasi, jangan menggunakan akun root untuk aplikasi.

## 16. Dokumentasi Implementasi

Untuk setiap tabel, dokumentasikan:

- asal entitas/relasi pada ERD;
- primary dan alternative key;
- foreign key dan perannya;
- tipe data serta alasan;
- NULL/NOT NULL;
- constraint;
- urutan pembuatan;
- contoh data dan query verifikasi.

## 17. Kesalahan Umum

1. Menaruh foreign key di sisi yang salah.
2. Tidak membuat tabel asosiatif untuk N:M.
3. Menghilangkan atribut relasi seperti nilai atau semester.
4. Menggunakan nama constraint sama untuk dua peran FK.
5. Lupa UNIQUE pada implementasi 1:1.
6. Membuat prasyarat sebagai satu kolom teks berisi daftar kode.
7. Menjalankan INSERT tanpa urutan induk–anak.
8. Menganggap keberhasilan CREATE TABLE berarti model sudah benar.
9. Tidak menguji constraint dengan data salah.
10. Menggunakan data pribadi nyata untuk praktikum.

## 18. Latihan dan Kuis

1. Mengapa Mengajar menjadi tabel tersendiri?
2. Di mana atribut nilai ditempatkan dan mengapa?
3. Bagaimana dua foreign key pada Prasyarat dibedakan?
4. Mengapa relasi kepala jurusan membutuhkan UNIQUE?
5. Jelaskan urutan pembuatan tabel.
6. Bedakan DDL, DML, dan DCL.
7. Buat query yang menampilkan mahasiswa, dosen wali, dan jurusan.

## 19. Rangkuman

- Relasi N:M menjadi tabel asosiatif yang membawa key dan atribut hubungan.
- Mengajar mewakili penawaran mata kuliah oleh dosen pada periode tertentu.
- Mengikuti/KRS menghubungkan mahasiswa dengan kelas dan menyimpan nilai.
- Relasi rekursif menggunakan dua foreign key ke tabel yang sama.
- Relasi 1:1 memerlukan pemilihan sisi foreign key berdasarkan partisipasi serta UNIQUE.
- DDL membangun struktur dan DML mengisi, membaca, mengubah, serta menghapus data.
- Implementasi dianggap benar setelah constraint dan query informasi diuji.

## 20. Asesmen dan Praktikum

Asesmen mencakup implementasi seluruh relasi pada slide, DDL dapat dijalankan ulang, DML lengkap, pengujian constraint, dan kemampuan menjelaskan pemetaan ERD ke tabel.

[Praktikum Minggu 5 — Implementasi ERD dengan DDL dan DML](../script/Week%205/Praktikum%20Week%205%20-%20Implementasi%20ERD%20dengan%20DDL%20dan%20DML.md)

## Referensi

1. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
2. Slide Week 4 & 5 — *Implementasi ERD*.
3. RPS SI2514010 — Basis Data.
