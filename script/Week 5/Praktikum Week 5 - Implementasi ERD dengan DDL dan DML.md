# Praktikum Minggu 5 — Implementasi ERD dengan DDL dan DML

**Sub-CPMK:** Mahasiswa mampu menjelaskan dan menerapkan penggunaan SQL DDL, DML, dan pengenalan DCL (C2, C3).  
**Durasi:** 170 menit.

## 1. Tujuan

Mahasiswa mampu mengimplementasikan relasi N:M, relasi ganda, relasi rekursif, dan 1:1; menjalankan DML; serta menguji constraint hasil konversi ERD.

## 2. Perangkat

- hasil praktikum Minggu 4;
- MySQL Server dan client;
- [skrip implementasi lengkap](week5_implementasi_lengkap.sql).

## 3. Pretest

1. Mengapa N:M memerlukan tabel asosiatif?
2. Di mana atribut nilai KRS ditempatkan?
3. Bagaimana dua FK menuju Dosen dibedakan?
4. Apa fungsi UNIQUE pada relasi 1:1?
5. Mengapa urutan INSERT penting?

## 4. Pemetaan Relasi Lanjutan

Lengkapi:

| ERD | Tabel hasil | PK | FK | Atribut relasi |
|---|---|---|---|---|
| Dosen–MataKuliah | Mengajar | ... | ... | ... |
| Mahasiswa–Mengajar | Mengikuti | ... | ... | ... |
| MataKuliah–MataKuliah | Prasyarat | ... | ... | ... |
| Dosen–Jurusan | ... | ... | ... | ... |

## 5. Menjalankan Skrip

Jalankan skrip lengkap dari database kosong. Jika gagal, catat statement, pesan error, penyebab, dan perbaikannya. Jangan sekadar menjalankan ulang tanpa analisis.

Verifikasi:

```sql
SHOW TABLES;
SHOW CREATE TABLE Mengajar;
SHOW CREATE TABLE Mengikuti;
SHOW CREATE TABLE Prasyarat;
```

## 6. Menguji Mengajar dan KRS

Tampilkan mahasiswa, mata kuliah, dosen, periode, dan nilai menggunakan JOIN. Jelaskan jalur relasinya dari Mahasiswa → Mengikuti → Mengajar → MataKuliah/Dosen.

Tambahkan satu kelas Mengajar dan dua peserta secara mandiri.

## 7. Menguji Dua Peran Dosen

Tampilkan mahasiswa beserta dosen wali dan pembimbing dengan alias tabel berbeda:

```sql
SELECT m.nim, m.nama,
       w.nama AS dosen_wali,
       p.nama AS pembimbing
FROM Mahasiswa m
LEFT JOIN Dosen w ON w.nip = m.nip_wali
LEFT JOIN Dosen p ON p.nip = m.nip_pembimbing;
```

Jelaskan mengapa dua JOIN diperlukan.

## 8. Menguji Prasyarat

Tambahkan satu relasi prasyarat yang valid. Coba menambahkan mata kuliah sebagai prasyarat dirinya sendiri dan catat hasil CHECK.

Diskusikan mengapa pencegahan siklus A → B → A tidak dapat diselesaikan hanya dengan CHECK baris tunggal.

## 9. Menguji Relasi 1:1

Periksa bahwa:

- setiap Jurusan memiliki kepala;
- satu Dosen tidak dapat menjadi kepala dua Jurusan;
- Dosen yang bukan kepala tetap dapat disimpan.

Catat hubungan antara `NOT NULL`, `UNIQUE`, dan `FOREIGN KEY` dalam menerapkan minimum/maksimum relasi.

## 10. DML Lengkap

Lakukan dan dokumentasikan:

1. INSERT satu data setiap tabel;
2. SELECT sederhana dan JOIN;
3. UPDATE nilai KRS dengan kondisi key;
4. DELETE satu data anak;
5. percobaan DELETE induk yang masih direferensikan.

Gunakan pola SELECT sebelum dan sesudah UPDATE/DELETE.

## 11. Uji Negatif

| Uji | Constraint yang diharapkan | Hasil aktual | Lulus? |
|---|---|---|:---:|
| NIM duplikat | PK | ... | |
| FK jurusan salah | FK | ... | |
| SKS 10 | CHECK | ... | |
| KRS duplikat | Composite PK | ... | |
| Nilai Z | CHECK | ... | |
| Prasyarat diri sendiri | CHECK | ... | |
| Kepala jurusan ganda | UNIQUE | ... | |

## 12. Pengenalan DCL

Sebagai administrator pada server latihan, diskusikan (tidak wajib dijalankan tanpa izin):

```sql
-- CREATE USER 'akademik_app'@'localhost' IDENTIFIED BY 'password_lokal';
-- GRANT SELECT, INSERT, UPDATE ON sistem_akademik.*
--   TO 'akademik_app'@'localhost';
-- SHOW GRANTS FOR 'akademik_app'@'localhost';
```

Jangan commit password dan jangan memakai akun root untuk aplikasi.

## 13. Luaran

1. tabel pemetaan relasi;
2. skrip berhasil dari database kosong;
3. bukti struktur tujuh tabel;
4. data contoh;
5. query JOIN;
6. DML INSERT/UPDATE/DELETE;
7. tujuh uji negatif;
8. analisis constraint;
9. kesimpulan.

## 14. Rubrik

| Komponen | Bobot |
|---|---:|
| Pemetaan N:M/rekursif/1:1 | 25% |
| DDL dan constraint | 25% |
| DML dan JOIN | 20% |
| Pengujian negatif | 20% |
| Dokumentasi | 10% |

## 15. Checklist

- [ ] Nama file bukan `README.md`.
- [ ] Skrip dapat dijalankan dari database kosong.
- [ ] Mengajar dan Mengikuti benar.
- [ ] Dua peran Dosen terimplementasi.
- [ ] Prasyarat rekursif bekerja.
- [ ] Relasi 1:1 memakai UNIQUE.
- [ ] DML lengkap dan aman.
- [ ] Semua uji negatif terdokumentasi.
- [ ] Tidak ada password/data pribadi.

Kembali ke [Modul Minggu 5](../../Modul/Week%205%20-%20Implementasi%20ERD%20dengan%20DDL%20dan%20DML.md).
