# Praktikum Minggu 4 — Implementasi ERD Dasar

**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan basis data dan merancang basis data (C4, C6).  
**Durasi:** 170 menit.

## 1. Tujuan

Mahasiswa mampu memetakan entitas dan relasi 1:N menjadi tabel, memilih tipe data, membuat DDL, mengisi data awal dengan DML, dan membuktikan integritas foreign key.

## 2. Perangkat

- MySQL Server dan MySQL Workbench/terminal;
- ERD sistem akademik dari slide;
- [skrip implementasi dasar](week4_implementasi_dasar.sql).

## 3. Pretest

1. Apa perbedaan ERD dan skema relasional?
2. Apa fungsi primary key dan foreign key?
3. Di sisi mana FK relasi 1:N ditempatkan?
4. Apa perbedaan DDL dan DML?
5. Mengapa daftar NIM tidak boleh berada pada satu kolom Jurusan?

## 4. Pemetaan ERD

Lengkapi tabel sebelum menulis SQL:

| Entitas | Primary key | Atribut | Tabel hasil |
|---|---|---|---|
| Jurusan | ... | ... | ... |
| Dosen | ... | ... | ... |
| MataKuliah | ... | ... | ... |
| Mahasiswa | ... | ... | ... |

Tuliskan relasi Jurusan–Mahasiswa dalam dua arah dan tentukan partisipasi minimumnya.

## 5. Menjalankan DDL

1. Buka MySQL client.
2. Jalankan `week4_implementasi_dasar.sql` bagian DDL secara bertahap.
3. Setelah setiap tabel dibuat, jalankan:

```sql
DESCRIBE nama_tabel;
SHOW CREATE TABLE nama_tabel;
```

Catat PK, FK, NOT NULL, UNIQUE, dan CHECK.

## 6. Menjalankan DML

Jalankan INSERT tabel induk sebelum Mahasiswa. Periksa hasil:

```sql
SELECT * FROM Jurusan;
SELECT * FROM Dosen;
SELECT * FROM MataKuliah;
SELECT * FROM Mahasiswa;
```

## 7. Uji Relasi 1:N

Tampilkan mahasiswa beserta jurusannya:

```sql
SELECT m.nim, m.nama, j.kode_jurusan, j.nama AS jurusan
FROM Mahasiswa m
JOIN Jurusan j ON j.kode_jurusan = m.kode_jurusan
ORDER BY m.nim;
```

Jelaskan mengapa satu kode jurusan dapat muncul pada banyak mahasiswa.

## 8. Uji Constraint

Jalankan satu per satu dan catat error:

```sql
-- PK duplikat
INSERT INTO Mahasiswa (nim, nama, kode_jurusan)
VALUES ('10202101', 'Duplikat', 'J001');

-- FK tidak tersedia
INSERT INTO Mahasiswa (nim, nama, kode_jurusan)
VALUES ('10202999', 'Jurusan Salah', 'J999');

-- SKS di luar domain
INSERT INTO MataKuliah (kode_mk, nama, sks)
VALUES ('MK999', 'Data Salah', 10);
```

Jangan menghapus constraint agar query salah berhasil.

## 9. UPDATE dan DELETE Aman

Gunakan pola SELECT → perubahan → SELECT:

```sql
SELECT * FROM Mahasiswa WHERE nim = '10202104';
UPDATE Mahasiswa SET email = 'erna.baru@example.test'
WHERE nim = '10202104';
SELECT * FROM Mahasiswa WHERE nim = '10202104';
```

Coba menghapus Jurusan J002 yang masih direferensikan. Jelaskan hasilnya.

## 10. Analisis Multivalue

Bandingkan:

```text
Jurusan(kode, nama, daftar_nim)
```

dengan:

```text
Jurusan(kode, nama)
Mahasiswa(nim, nama, kode_jurusan)
```

Jelaskan perbedaan atomicity, pencarian, constraint, dan fleksibilitas.

## 11. Luaran

1. tabel pemetaan ERD;
2. hasil `SHOW CREATE TABLE`;
3. bukti data induk dan anak;
4. hasil JOIN;
5. tabel uji constraint;
6. analisis multivalue;
7. kesimpulan.

## 12. Rubrik

| Komponen | Bobot |
|---|---:|
| Pemetaan entitas dan key | 20% |
| DDL dan tipe data | 25% |
| Relasi 1:N | 20% |
| DML dan verifikasi | 15% |
| Uji constraint | 15% |
| Laporan | 5% |

## 13. Checklist

- [ ] Tidak menggunakan nama file `README.md`.
- [ ] Database dibuat dari skrip.
- [ ] Empat tabel dasar tersedia.
- [ ] PK dan FK terverifikasi.
- [ ] DML dapat dijalankan.
- [ ] JOIN menghasilkan informasi benar.
- [ ] Tiga uji negatif terdokumentasi.
- [ ] Password tidak dimasukkan laporan.

Kembali ke [Modul Minggu 4](../../Modul/Week%204%20-%20Implementasi%20ERD%20Dasar.md).
