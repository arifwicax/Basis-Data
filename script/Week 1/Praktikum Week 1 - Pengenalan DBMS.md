# Praktikum Minggu 1 — Instalasi dan Eksplorasi DBMS

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan pengertian dan manfaat penerapan basis data, serta perbedaan antara sistem informasi tradisional dan modern (C2).

## 1. Tujuan Praktikum

Setelah menyelesaikan praktikum, mahasiswa mampu:

1. mengenali perbedaan server, client, DBMS, dan basis data;
2. memeriksa instalasi serta koneksi MySQL;
3. membuat dan memilih database latihan;
4. membuat tabel sederhana;
5. memasukkan serta membaca data;
6. membedakan isi data dengan metadata/struktur tabel;
7. menjelaskan perbedaan pengelolaan data menggunakan DBMS dan file biasa.

## 2. Alokasi Waktu

Durasi praktikum sesuai RPS adalah **1 × 170 menit**.

| Tahap | Perkiraan waktu |
|---|---:|
| Persiapan dan pemeriksaan perangkat | 25 menit |
| Koneksi dan eksplorasi server | 30 menit |
| Pembuatan database dan tabel | 45 menit |
| Manipulasi serta pemeriksaan data | 40 menit |
| Analisis dan penyusunan laporan | 30 menit |

## 3. Perangkat yang Dibutuhkan

- laptop atau komputer laboratorium;
- MySQL Community Server;
- MySQL Workbench atau terminal MySQL;
- editor teks untuk menulis laporan;
- akun server laboratorium jika instalasi lokal tidak digunakan.

> Jangan menuliskan atau mengunggah password ke repository maupun laporan.

## 4. Persiapan MySQL

### 4.1 Memeriksa instalasi

Buka Terminal, Command Prompt, atau PowerShell, kemudian jalankan:

```bash
mysql --version
```

Hasil akan menampilkan versi client MySQL. Jika perintah tidak ditemukan, periksa instalasi atau konfigurasi `PATH`.

### 4.2 Memastikan server aktif

- Windows: periksa layanan MySQL melalui Services atau aplikasi XAMPP/MAMP yang digunakan.
- macOS: periksa MySQL melalui System Settings, Homebrew Services, atau aplikasi server lokal.
- Linux: periksa layanan melalui pengelola service distribusi.
- Laboratorium: gunakan alamat server, port, username, dan database yang diberikan dosen/asisten.

### 4.3 Masuk melalui terminal

```bash
mysql -u root -p
```

Masukkan password ketika diminta. Karakter password biasanya tidak ditampilkan di layar; hal ini normal.

Jika memakai server jaringan:

```bash
mysql -h alamat_server -P 3306 -u nama_pengguna -p
```

Jangan menggunakan akun `root` pada server bersama kecuali diinstruksikan secara khusus.

## 5. Eksplorasi Server dan DBMS

Jalankan setiap query satu per satu:

```sql
SELECT VERSION();
SELECT CURRENT_USER();
SHOW DATABASES;
```

Catat dan jelaskan:

1. versi DBMS yang digunakan;
2. akun yang sedang terhubung;
3. database yang dapat diakses;
4. perbedaan hasil `mysql --version` dan `SELECT VERSION()`.

`mysql --version` memeriksa program client, sedangkan `SELECT VERSION()` meminta informasi versi dari server yang sedang terhubung.

## 6. Membuat Database Latihan

```sql
CREATE DATABASE praktikum_basis_data
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE praktikum_basis_data;
SELECT DATABASE();
SHOW TABLES;
```

Penjelasan:

- `CREATE DATABASE` membuat tempat penyimpanan logis baru;
- `CHARACTER SET utf8mb4` mendukung karakter Unicode;
- `USE` memilih database aktif;
- `SELECT DATABASE()` memeriksa database aktif;
- `SHOW TABLES` menampilkan tabel pada database aktif.

Jika database sudah tersedia dari pengerjaan sebelumnya, gunakan:

```sql
CREATE DATABASE IF NOT EXISTS praktikum_basis_data
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
```

## 7. Membuat Tabel Catatan

```sql
USE praktikum_basis_data;

CREATE TABLE catatan (
    id INT AUTO_INCREMENT PRIMARY KEY,
    isi VARCHAR(200) NOT NULL,
    dibuat_pada TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

Arti setiap bagian:

| Bagian | Fungsi |
|---|---|
| `id` | Identitas setiap catatan |
| `INT` | Tipe bilangan bulat |
| `AUTO_INCREMENT` | Nilai id bertambah otomatis |
| `PRIMARY KEY` | Menjamin setiap baris memiliki identitas unik |
| `isi` | Teks catatan |
| `VARCHAR(200)` | Teks maksimal 200 karakter |
| `NOT NULL` | Isi wajib diberikan |
| `dibuat_pada` | Waktu catatan dibuat |
| `DEFAULT CURRENT_TIMESTAMP` | Waktu diisi otomatis oleh DBMS |

Periksa tabel:

```sql
SHOW TABLES;
DESCRIBE catatan;
SHOW CREATE TABLE catatan;
```

## 8. Memasukkan dan Membaca Data

Tambahkan tiga baris:

```sql
INSERT INTO catatan (isi) VALUES
('Belajar konsep sistem file'),
('Mengenal basis data'),
('Mengenal DBMS');
```

Tampilkan seluruh data:

```sql
SELECT * FROM catatan;
```

Tampilkan kolom tertentu dan urutkan dari catatan terbaru:

```sql
SELECT id, isi, dibuat_pada
FROM catatan
ORDER BY id DESC;
```

Cari satu catatan:

```sql
SELECT id, isi
FROM catatan
WHERE isi LIKE '%basis data%';
```

## 9. Data dan Metadata

Bandingkan hasil berikut:

```sql
SELECT * FROM catatan;
DESCRIBE catatan;
```

- `SELECT` menampilkan **data**, yaitu fakta yang tersimpan dalam baris.
- `DESCRIBE` menampilkan **metadata**, yaitu informasi mengenai nama kolom, tipe, NULL, key, default, dan atribut tambahan.

Tuliskan perbedaan keduanya menggunakan bahasa sendiri.

## 10. Eksperimen Constraint

Coba memasukkan catatan tanpa nilai `isi`:

```sql
INSERT INTO catatan (isi) VALUES (NULL);
```

Query tersebut seharusnya ditolak karena `isi` memiliki constraint `NOT NULL`. Catat pesan error dan jelaskan bagaimana DBMS menjaga integritas data.

Setelah itu pastikan data yang benar masih tersedia:

```sql
SELECT * FROM catatan;
```

## 11. Mengidentifikasi Komponen Sistem

Gambarkan alur berikut dan isi dengan perangkat yang digunakan saat praktikum:

```text
Mahasiswa
   ↓
Terminal atau MySQL Workbench
   ↓
MySQL Server/DBMS
   ↓
Database praktikum_basis_data
   ↓
Tabel catatan
```

Jelaskan peran masing-masing komponen. MySQL Workbench adalah client, bukan basis data. MySQL Server adalah DBMS, sedangkan `praktikum_basis_data` adalah database yang dikelola DBMS.

## 12. Perbandingan DBMS dan File CSV

Buat tabel perbandingan singkat berdasarkan hasil praktikum:

| Aspek | File CSV | MySQL |
|---|---|---|
| Struktur data | ... | ... |
| Identitas baris | ... | ... |
| Aturan nilai wajib | ... | ... |
| Pencarian | ... | ... |
| Akses banyak pengguna | ... | ... |
| Keamanan | ... | ... |

Gunakan pengamatan dan materi kuliah, bukan hanya menyalin definisi.

## 13. Tugas Praktikum

1. Tambahkan dua catatan baru dengan isi berbeda.
2. Tampilkan hanya catatan dengan `id` lebih besar dari 2.
3. Urutkan hasil dari id terbesar.
4. Tampilkan struktur tabel menggunakan `DESCRIBE`.
5. Jelaskan perbedaan data, metadata, database, dan DBMS berdasarkan objek yang dibuat.
6. Jelaskan manfaat `PRIMARY KEY`, `NOT NULL`, dan nilai default.
7. Gambarkan arsitektur pengguna–client–DBMS–database–tabel.
8. Bandingkan penyimpanan hasil yang sama dalam CSV dan MySQL.

## 14. Format Laporan

Laporan praktikum memuat:

1. identitas mahasiswa;
2. tujuan praktikum;
3. lingkungan yang digunakan: sistem operasi, client, serta versi MySQL;
4. langkah dan query;
5. hasil berupa tangkapan layar atau salinan output;
6. analisis data dan metadata;
7. tabel perbandingan CSV dan MySQL;
8. kendala serta penyelesaiannya;
9. kesimpulan dengan bahasa sendiri.

Jangan hanya menyertakan tangkapan layar. Setiap hasil harus dijelaskan.

## 15. Checklist Pemeriksaan

- [ ] MySQL client dan server dapat diakses.
- [ ] Versi client dan server telah dicatat.
- [ ] Database `praktikum_basis_data` tersedia.
- [ ] Tabel `catatan` berhasil dibuat.
- [ ] Sedikitnya lima catatan tersimpan.
- [ ] Hasil `SELECT` dan `DESCRIBE` dapat dijelaskan.
- [ ] Uji `NOT NULL` telah dilakukan.
- [ ] Diagram komponen sistem tersedia.
- [ ] Perbandingan CSV dan MySQL telah dibuat.
- [ ] Laporan tidak mengandung password.

## 16. Pembersihan Lingkungan

Jangan menghapus database sebelum hasil diperiksa dosen/asisten. Jika telah mendapat persetujuan dan database tersebut benar-benar milik sendiri, gunakan:

```sql
DROP DATABASE praktikum_basis_data;
```

Perintah tersebut menghapus database beserta seluruh tabel dan data di dalamnya. Verifikasi target terlebih dahulu karena operasi tidak dapat dibatalkan dengan mudah.

## 17. Kriteria Keberhasilan

Praktikum dinyatakan berhasil apabila mahasiswa dapat menunjukkan koneksi, database, tabel, data, metadata, pengujian constraint, dan menjelaskan perbedaan sistem file dengan sistem basis data berdasarkan hasil praktik.

Kembali ke [Modul Minggu 1 — Mengenal Basis Data](../../Modul/Week%201%20-%20Pengantar%20Basis%20Data.md).
