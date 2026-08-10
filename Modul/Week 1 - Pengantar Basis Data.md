# Minggu 1 — Mengenal Basis Data

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan pengertian dan manfaat penerapan basis data, serta perbedaan antara sistem informasi tradisional dan modern (C2).

## 1. Gambaran Perkuliahan

Pada pertemuan pertama, mahasiswa mempelajari alasan basis data dibutuhkan sebelum masuk ke perancangan ERD dan SQL. Fokusnya bukan menghafal istilah, tetapi memahami masalah yang muncul ketika data hanya disimpan dalam file terpisah dan bagaimana DBMS membantu menyelesaikannya.

### Kontrak dan Komposisi Penilaian

Komposisi penilaian mengikuti slide dan RPS:

| Komponen | Bobot |
|---|---:|
| Ujian Tengah Semester (UTS) | 20% |
| Tugas | 20% |
| Kuis | 10% |
| Case Method — Review | 10% |
| Case Method — Praktikum | 20% |
| Case Method — Proyek | 20% |
| **Total** | **100%** |

Mahasiswa perlu membaca RPS untuk mengetahui urutan Sub-CPMK, aktivitas, penilaian, durasi, aturan kehadiran, dan etika akademik selama satu semester.

## 2. Data, Informasi, dan Basis Data

### 2.1 Apa itu data?

Data adalah fakta tentang objek atau kejadian yang dicatat dan disimpan. Data dapat berupa angka, teks, tanggal, gambar, suara, atau simbol.

Contoh data mentah:

- `P001`
- `Laptop Edu`
- `7.500.000`
- `8`
- `2025-08-25`

Nilai-nilai tersebut belum banyak membantu jika tidak diketahui konteksnya.

### 2.2 Apa itu informasi?

Informasi adalah data yang telah diberi konteks atau diolah sehingga mempunyai arti dan dapat membantu pengambilan keputusan.

Contoh:

> Produk P001 adalah Laptop Edu, harganya Rp7.500.000, dan stok yang tersedia sebanyak 8 unit pada 25 Agustus 2025.

Jika beberapa data penjualan diolah, kita dapat memperoleh informasi seperti “Laptop Edu merupakan produk dengan omzet tertinggi bulan ini”.

### 2.3 Apa itu basis data?

Kata **basis** dapat dipahami sebagai tempat berkumpul, gudang, atau markas. **Basis data** adalah kumpulan data yang saling berhubungan, disimpan secara terstruktur, dan dikelola agar mudah diakses, diubah, serta dipelihara secara efisien dan efektif.

Contoh pada sistem akademik:

- data mahasiswa;
- data dosen;
- data mata kuliah;
- data kelas;
- data KRS dan nilai.

Data tersebut tidak berdiri sendiri. Mahasiswa mengikuti kelas, dosen mengajar mata kuliah, dan kelas menghasilkan nilai. Hubungan antardata inilah yang menjadi dasar sebuah basis data.

### 2.4 Efisien dan efektif

Kedua istilah ini sering digunakan bersama, tetapi artinya berbeda:

| Istilah | Makna sederhana | Contoh dalam basis data |
|---|---|---|
| Efektif | Tujuan tercapai dengan benar | Sistem menemukan data mahasiswa yang diminta secara akurat |
| Efisien | Tujuan dicapai dengan penggunaan waktu dan sumber daya yang baik | Data ditemukan dalam waktu singkat tanpa membaca seluruh file satu per satu |

Sistem yang cepat tetapi memberikan data salah tidak efektif. Sistem yang benar tetapi membutuhkan waktu sangat lama belum efisien. Basis data yang baik perlu keduanya.

## 3. Konsep Sistem File

Sistem file adalah mekanisme untuk menyimpan, mengelola, dan mengakses data pada media penyimpanan sekunder. Sistem operasi mengatur file ke dalam folder atau direktori. Setiap file memiliki nama, ukuran, tipe, waktu pembuatan, dan waktu modifikasi.

Pengguna dapat melakukan operasi berikut:

- membuat file;
- membuka dan membaca file;
- mengubah isi file;
- menyalin atau memindahkan file;
- menghapus file.

Contoh sistem informasi tradisional berbasis file:

```text
Data Akademik/
├── mahasiswa.xlsx
├── mahasiswa_baru_revisi.xlsx
├── dosen.csv
├── nilai_semester_1.xlsx
└── nilai_semester_1_final_baru.xlsx
```

File bukan sesuatu yang buruk. File cocok untuk dokumen pribadi, pertukaran data sederhana, konfigurasi, atau arsip. Masalah muncul ketika banyak pengguna dan aplikasi harus mengelola data yang saling berhubungan dengan aturan yang kompleks.

## 4. Kelemahan Sistem File Tradisional

### 4.1 Struktur data tidak teratur

Setiap bagian dapat membuat format sendiri. Kolom “jenis kelamin” mungkin ditulis `L/P`, `Pria/Wanita`, atau `1/0`. Perbedaan format menyulitkan pencarian, penggabungan, dan analisis.

### 4.2 Integritas data rendah

Data yang sama mudah disalin ke banyak file. Perubahan alamat mahasiswa pada satu file belum tentu diikuti pada file lain. Akibatnya muncul:

- **redundansi:** data yang sama tersimpan berulang;
- **inkonsistensi:** salinan data mempunyai nilai berbeda;
- kehilangan atau kerusakan data karena tidak ada aturan terpusat.

### 4.3 Performa dapat memburuk

Untuk mencari satu transaksi, aplikasi mungkin harus membaca file besar dari awal sampai akhir. Sistem file biasa tidak menyediakan optimizer query, indeks relasional, atau pengelolaan buffer seperti DBMS.

### 4.4 Konflik akses bersamaan

Dua pengguna dapat membuka dan mengubah file yang sama hampir bersamaan. Perubahan pengguna pertama dapat tertimpa oleh pengguna kedua. Mekanisme transaksi dan penguncian biasanya harus dibuat sendiri oleh aplikasi.

### 4.5 Keamanan data rendah

Hak akses sering hanya diberikan pada tingkat file atau folder. Sulit membatasi pengguna agar hanya dapat melihat kolom tertentu atau hanya dapat membaca tanpa mengubah data. File yang tersalin juga lebih sulit dikendalikan.

### 4.6 Sulit digabungkan

Data dari sumber berbeda mungkin menggunakan nama kolom, format tanggal, kode, atau pemisah yang berbeda. Proses penggabungan memerlukan pembersihan berulang dan rawan kesalahan.

### Studi Kasus Singkat

Bagian akademik dan keuangan menyimpan nama mahasiswa pada file masing-masing. Ketika seorang mahasiswa mengganti nama:

1. bagian akademik memperbarui filenya;
2. bagian keuangan belum menerima perubahan;
3. laporan gabungan menampilkan dua nama untuk NIM yang sama.

Masalah utamanya bukan sekadar salah ketik, melainkan tidak adanya satu sumber data terkelola dan aturan konsistensi yang dipakai bersama.

## 5. DBMS: Perangkat Lunak Pengelola Basis Data

**Database Management System (DBMS)** adalah perangkat lunak yang memungkinkan pengguna atau aplikasi membuat, mengakses, mengelola, dan memelihara basis data.

Hubungan komponennya dapat digambarkan sebagai berikut:

```text
Pengguna → Aplikasi/SQL → DBMS → Basis Data → Media Penyimpanan
```

DBMS memungkinkan kegiatan seperti:

- mencari dan memfilter data;
- mengurutkan data;
- menambah, mengubah, dan menghapus data;
- menggabungkan data yang berhubungan;
- menghitung agregasi, seperti jumlah dan rata-rata;
- membatasi hak akses;
- menjaga konsistensi transaksi;
- melakukan backup dan recovery.

Contoh DBMS yang disebutkan dalam slide meliputi MySQL, Oracle Database, Microsoft SQL Server, PostgreSQL, MongoDB, Cassandra, IBM Db2, MariaDB, Redis, dan SQLite. Produk-produk tersebut tidak selalu memakai model data yang sama. MySQL dan PostgreSQL merupakan DBMS relasional, sedangkan MongoDB merupakan document database dan Redis umum digunakan sebagai key-value store.

### Manfaat DBMS

1. **Penyimpanan terorganisasi** — struktur data didefinisikan secara jelas.
2. **Integritas data** — constraint mencegah nilai yang tidak sah dan hubungan yang rusak.
3. **Keamanan** — pengguna dapat diberi hak sesuai tugasnya.
4. **Berbagi data** — banyak pengguna dan aplikasi dapat memakai sumber data yang sama.
5. **Manajemen terpusat** — perubahan struktur, backup, dan pemantauan lebih terkendali.
6. **Akses bersamaan** — transaksi membantu mencegah perubahan saling menimpa.
7. **Pemulihan** — backup dan log membantu mengembalikan data setelah kegagalan.

## 6. Perbandingan Sistem File dan Sistem Basis Data

| Aspek | Sistem file tradisional | Sistem basis data dengan DBMS |
|---|---|---|
| Struktur | Format dapat berbeda pada setiap file | Skema, tabel, kolom, tipe, dan relasi didefinisikan |
| Manajemen | Setiap file dikelola terpisah | Data dikelola sebagai satu kesatuan |
| Akses | Program membaca/menulis file secara langsung | Menggunakan SQL atau API DBMS |
| Redundansi | Mudah terjadi salinan berulang | Dapat dikurangi melalui desain dan normalisasi |
| Integritas | Banyak aturan dibuat manual di aplikasi | Didukung PK, FK, UNIQUE, CHECK, dan transaksi |
| Akses bersamaan | Rawan konflik dan perubahan tertimpa | Dikelola melalui transaksi, lock, dan isolation |
| Keamanan | Umumnya pada tingkat file/folder | Dapat diatur per user, database, tabel, atau operasi |
| Penggabungan | Sulit jika format berbeda | Relasi dan JOIN memudahkan penggabungan |
| Pencarian | Sering perlu membaca file secara langsung | Query dan indeks membantu pencarian |
| Skalabilitas | Pengelolaan makin sulit saat data membesar | Menyediakan optimasi dan strategi pertumbuhan |
| Backup | Sering berupa salinan manual | Memiliki fasilitas backup, log, dan recovery |

DBMS tidak otomatis membuat semua sistem sempurna. Rancangan yang buruk, query tidak tepat, hak akses berlebihan, atau backup yang tidak diuji tetap dapat menimbulkan masalah.

## 7. Tujuan Penggunaan Basis Data

Sesuai slide, basis data digunakan untuk:

1. menyimpan data secara terstruktur agar mudah diolah;
2. menjaga integritas agar data tetap akurat dan konsisten;
3. meningkatkan efisiensi serta kecepatan akses;
4. mendukung akses data oleh banyak pengguna;
5. mendukung pemodelan dan analisis untuk kebutuhan bisnis;
6. meningkatkan keamanan data;
7. mendukung pertumbuhan volume data atau skalabilitas.

Contoh manfaat bisnis: manajer dapat melihat produk terlaris, bagian gudang dapat mengetahui stok, dan kasir dapat mencatat transaksi dengan menggunakan data produk yang sama.

## 8. Istilah Dasar dalam Basis Data Relasional

| Istilah | Penjelasan | Contoh |
|---|---|---|
| Tabel | Kumpulan data tentang satu jenis objek/kejadian | `mahasiswa` |
| Kolom/atribut | Karakteristik yang dicatat | `nim`, `nama` |
| Baris/record | Satu kejadian atau objek yang tersimpan | Satu mahasiswa |
| Primary key | Nilai yang membedakan setiap baris | `nim` |
| Foreign key | Kolom penghubung ke tabel lain | `kode_jurusan` |
| Metadata | Data yang menjelaskan struktur data | tipe `VARCHAR(100)` |
| Skema | Rancangan struktur keseluruhan | tabel dan relasinya |

Contoh tabel mahasiswa:

| nim | nama | kode_jurusan |
|---|---|---|
| 1025001 | Ayu Lestari | ST |
| 1025002 | Bima Putra | SI |

`nim` menjadi primary key karena setiap mahasiswa harus memiliki NIM berbeda. `kode_jurusan` dapat menjadi foreign key yang menghubungkan mahasiswa dengan tabel jurusan.

## 9. Operasi Dasar Basis Data

Basis data memiliki bahasa khusus untuk mendefinisikan struktur dan mengelola isi data.

### 9.1 Data Definition Language (DDL)

DDL digunakan untuk membuat atau mengubah struktur:

| Perintah | Fungsi |
|---|---|
| `CREATE` | Membuat database atau tabel |
| `ALTER` | Mengubah struktur tabel |
| `DROP` | Menghapus objek basis data |
| `TRUNCATE` | Mengosongkan seluruh isi tabel |
| `RENAME` | Mengganti nama objek |

```sql
CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL
);
```

### 9.2 Data Manipulation Language (DML)

DML digunakan untuk membaca dan memanipulasi isi data:

| Perintah | Fungsi |
|---|---|
| `SELECT` | Membaca data |
| `INSERT` | Menambahkan data |
| `UPDATE` | Mengubah data |
| `DELETE` | Menghapus baris data |
| `MERGE` | Menggabungkan logika insert/update pada DBMS yang mendukungnya |

```sql
INSERT INTO mahasiswa (nim, nama)
VALUES ('1025001', 'Ayu Lestari');

SELECT nim, nama FROM mahasiswa;
```

### 9.3 Kendali transaksi

Slide juga memperkenalkan `COMMIT` dan `ROLLBACK`. Keduanya lebih tepat dikelompokkan sebagai Transaction Control Language (TCL):

- `COMMIT` mengesahkan perubahan transaksi;
- `ROLLBACK` membatalkan perubahan yang belum disahkan.

Pembahasan mendalam transaksi dilakukan pada minggu 11.

## 10. Persiapan ERD

**Entity Relationship Diagram (ERD)** adalah diagram yang menggambarkan struktur data dan hubungan antarentitas dalam sebuah sistem basis data. ERD membantu menentukan:

- **entitas:** objek atau konsep yang datanya disimpan, misalnya Mahasiswa;
- **atribut:** karakteristik entitas, misalnya NIM dan nama;
- **relasi:** hubungan antarentitas, misalnya Mahasiswa mengambil Mata Kuliah.

Contoh awal:

```text
MAHASISWA ─── mengambil ─── MATA_KULIAH
```

ERD belum dibahas secara mendalam pada minggu ini. Bagian ini menjadi jembatan menuju pemodelan basis data pada minggu berikutnya.

## 11. Contoh Terpadu: Sistem Perpustakaan

Bayangkan perpustakaan menyimpan data pada tiga file spreadsheet: anggota, buku, dan peminjaman. Nama anggota disalin ke setiap transaksi. Ketika nama berubah, transaksi lama dan baru dapat berbeda.

Dengan basis data:

1. data anggota disimpan sekali pada tabel `anggota`;
2. data buku disimpan pada tabel `buku`;
3. transaksi disimpan pada tabel `peminjaman`;
4. primary key dan foreign key menghubungkan tabel;
5. DBMS menjaga agar peminjaman hanya merujuk anggota dan buku yang tersedia;
6. SQL dapat menghasilkan daftar keterlambatan tanpa menggabungkan spreadsheet secara manual.

Contoh ini menunjukkan bahwa manfaat basis data berasal dari struktur, hubungan, aturan, dan pengelolaan—bukan hanya karena semua data berada dalam satu tempat.

## 12. Aktivitas Diskusi

Diskusikan dalam kelompok:

1. Sebutkan satu aplikasi yang digunakan setiap hari dan data apa yang mungkin disimpannya.
2. Apa yang terjadi jika dua kasir mengubah file stok yang sama secara bersamaan?
3. Mengapa menyimpan data mahasiswa pada banyak spreadsheet dapat menimbulkan inkonsistensi?
4. Apakah semua kebutuhan penyimpanan harus memakai DBMS? Berikan contoh ketika file biasa sudah cukup.
5. Jelaskan perbedaan antara basis data dan DBMS menggunakan analogi sendiri.

## 13. Latihan Pemahaman

1. Jelaskan perbedaan data dan informasi dengan contoh selain nilai mahasiswa.
2. Jelaskan basis data dan DBMS menggunakan bahasa sendiri.
3. Sebutkan enam kelemahan sistem file dari slide dan beri contoh untuk tiga di antaranya.
4. Mengapa akses bersamaan menjadi masalah pada file tradisional?
5. Apa perbedaan efektif dan efisien dalam pencarian data?
6. Kelompokkan `CREATE`, `SELECT`, `UPDATE`, `DROP`, `COMMIT`, dan `ROLLBACK` berdasarkan fungsinya.
7. Identifikasi entitas, atribut, dan relasi awal dari sistem peminjaman kendaraan.
8. Mengapa DBMS tidak otomatis menjamin sebuah sistem memiliki data berkualitas?

## 14. Kuis Formatif

1. Mekanisme yang mengatur file dalam folder atau direktori disebut apa?
2. Pengulangan data yang sama pada banyak tempat disebut apa?
3. Perangkat lunak untuk mengelola basis data disebut apa?
4. Perintah SQL untuk membaca data adalah apa?
5. Apa fungsi primary key?
6. Mana yang mempertahankan perubahan transaksi: `COMMIT` atau `ROLLBACK`?

Kuis digunakan untuk mengukur pemahaman awal, bukan hanya hafalan istilah.

## 15. Rangkuman

- Data adalah fakta; informasi adalah data yang telah diberi konteks.
- Sistem file menyimpan data sebagai file dan folder, tetapi menjadi sulit dikelola ketika data saling berhubungan, besar, dan digunakan bersama.
- Basis data menyimpan data terkait secara terstruktur.
- DBMS adalah perangkat lunak yang mengatur akses, manipulasi, integritas, keamanan, konkurensi, dan pemulihan basis data.
- Basis data membantu mencapai pengelolaan data yang efektif sekaligus efisien.
- DDL mendefinisikan struktur, DML mengelola isi, dan TCL mengendalikan transaksi.
- ERD menjadi alat awal untuk merancang entitas, atribut, dan relasi sebelum basis data diimplementasikan.

## 16. Asesmen dan Durasi

**Asesmen minggu 1:** pretest/kuis, hasil praktikum awal, dan refleksi perbandingan sistem file dengan sistem basis data.

**Durasi sesuai RPS:**

- Tatap muka: 1 × (3 × 50 menit);
- Praktikum: 1 × 170 menit;
- Penugasan terstruktur: 1 × (4 × 60 menit);
- Belajar mandiri: 1 × (4 × 60 menit).

Materi praktikum dipisahkan dari modul teori dan tersedia pada [Praktikum Minggu 1 — Pengenalan DBMS](../script/Week%201/Praktikum%20Week%201%20-%20Pengenalan%20DBMS.md).

## Referensi

1. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
2. Slide Week 1 — *Mengenal Basis Data*.
3. RPS SI2514010 — Basis Data.
