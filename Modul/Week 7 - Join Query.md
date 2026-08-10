# Minggu 7 — JOIN Query

**Dosen:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan dan menerapkan SQL untuk menggabungkan data antartabel (C2, C3).

## 1. Konsep JOIN

Normalisasi memisahkan data agar tidak berulang. JOIN menggabungkannya kembali berdasarkan kolom yang memiliki makna sama. Slide memakai `mahasiswa.jurusan = universitas.jurusan`.

Dataset sengaja tidak seluruhnya berpasangan: Manajemen dan Kedokteran Gigi hanya ada pada mahasiswa; Farmasi, Fisika, dan Hukum hanya ada pada universitas. Kondisi ini memperlihatkan perbedaan JOIN.

## 2. Implicit dan Explicit JOIN

```sql
SELECT m.nama, m.jurusan, u.nama_dekan
FROM mahasiswa m, universitas u
WHERE m.jurusan = u.jurusan;
```

Sintaks slide tersebut setara INNER JOIN, tetapi bentuk eksplisit lebih jelas:

```sql
SELECT m.nama, m.jurusan, u.nama_dekan
FROM mahasiswa m
INNER JOIN universitas u ON u.jurusan = m.jurusan;
```

## 3. INNER JOIN

Hanya menampilkan pasangan yang tersedia pada kedua tabel. Mahasiswa Manajemen/Kedokteran Gigi dan jurusan Farmasi/Fisika/Hukum tidak tampil.

## 4. LEFT JOIN

Mempertahankan semua baris tabel kiri:

```sql
SELECT m.nama, m.jurusan, u.nama_dekan
FROM mahasiswa m
LEFT JOIN universitas u ON u.jurusan = m.jurusan;
```

Semua mahasiswa tampil. `nama_dekan` menjadi NULL jika pasangan tidak ditemukan. NULL bukan teks kosong atau nol.

## 5. RIGHT JOIN

Mempertahankan semua baris tabel kanan:

```sql
SELECT m.nama, u.jurusan, u.nama_dekan
FROM mahasiswa m
RIGHT JOIN universitas u ON u.jurusan = m.jurusan;
```

Farmasi, Fisika, dan Hukum tetap tampil. RIGHT JOIN dapat ditulis sebagai LEFT JOIN dengan menukar posisi tabel.

## 6. Perbandingan

| Jenis | Dipertahankan | Kegunaan |
|---|---|---|
| INNER | Hanya pasangan | Data lengkap pada kedua tabel |
| LEFT | Semua tabel kiri | Audit data utama tanpa pasangan |
| RIGHT | Semua tabel kanan | Audit seluruh data tabel kanan |

## 7. Mencari Data Tanpa Pasangan

```sql
SELECT m.nama, m.jurusan
FROM mahasiswa m LEFT JOIN universitas u ON u.jurusan=m.jurusan
WHERE u.jurusan IS NULL;
```

Balik posisi tabel untuk mencari jurusan tanpa mahasiswa. Pola ini disebut anti-join.

## 8. ON dan WHERE

`ON` menentukan pasangan; `WHERE` menyaring hasil. Pada LEFT JOIN, filter tabel kanan di WHERE dapat membuang baris NULL dan mengubah perilaku menjadi seperti INNER JOIN.

## 9. Agregasi

```sql
SELECT u.jurusan, COUNT(m.id_mahasiswa) AS jumlah,
       ROUND(AVG(m.nilai_uan),2) AS rata_nilai
FROM universitas u
LEFT JOIN mahasiswa m ON m.jurusan=u.jurusan
GROUP BY u.jurusan;
```

Gunakan `COUNT(m.id_mahasiswa)`, bukan `COUNT(*)`, agar jurusan tanpa mahasiswa bernilai nol.

## 10. JOIN Banyak Tabel

Tambahkan JOIN satu per satu dan pastikan setiap kondisi benar. Tanpa kondisi, CROSS JOIN menghasilkan Cartesian product: jumlah baris tabel A × tabel B.

## 11. Praktik Baik

- gunakan key stabil, bukan nama, bila tersedia;
- samakan domain dan tipe kolom JOIN;
- pilih kolom yang diperlukan;
- jangan memakai DISTINCT untuk menutupi JOIN salah;
- gunakan `IS NULL`, bukan `= NULL`;
- periksa query dengan `EXPLAIN` dan indeks pada kolom JOIN.

## 12. Latihan

1. Prediksi hasil INNER, LEFT, dan RIGHT JOIN.
2. Temukan mahasiswa tanpa jurusan pasangan.
3. Temukan jurusan tanpa mahasiswa.
4. Bandingkan filter akreditasi pada ON dan WHERE.
5. Hitung jumlah dan rata-rata nilai per jurusan.
6. Tulis ulang RIGHT JOIN sebagai LEFT JOIN.

## 13. Rangkuman

INNER menampilkan pasangan; LEFT mempertahankan kiri; RIGHT mempertahankan kanan. NULL menunjukkan pasangan tidak ditemukan. ON membentuk pasangan, WHERE menyaring hasil, dan anti-join menemukan data tanpa pasangan.

## 14. Praktikum

[Praktikum Minggu 7 — JOIN Query](../script/Week%207/Praktikum%20Week%207%20-%20Join%20Query.md)

## Referensi

1. Slide Week 7 — *Join Query*.
2. Smirnova & Tezuysal (2022), *MySQL Cookbook*.
