# Minggu 2 — Pemodelan Basis Data

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menjelaskan konsep pemodelan basis data, termasuk jenis-jenis pemodelan basis data (C2).

## 1. Mengapa Basis Data Perlu Dimodelkan?

Sebelum membangun rumah, arsitek membuat gambar rancangan. Hal yang sama berlaku pada basis data. Sebelum membuat tabel dan menulis SQL, kita perlu memahami data apa yang disimpan, bagaimana hubungan antardata, dan aturan apa yang harus dipenuhi.

**Pemodelan basis data** adalah proses merancang, mengorganisasi, dan merepresentasikan data agar dapat:

- disimpan secara teratur;
- diakses sesuai kebutuhan;
- dikelola dengan mudah;
- menggambarkan keadaan dunia nyata secara cukup akurat;
- mendukung proses bisnis atau kebutuhan aplikasi.

Pemodelan melibatkan tiga unsur utama:

1. **entitas atau objek** yang datanya perlu disimpan;
2. **atribut** yang menjelaskan karakteristik objek;
3. **relasi** yang menjelaskan hubungan antarobjek.

Tujuan akhirnya adalah menghasilkan struktur yang sesuai kebutuhan, tidak membingungkan, dapat dikembangkan, dan mengurangi redundansi serta inkonsistensi data.

### Contoh Masalah Tanpa Model

Sebuah sekolah menyimpan data berikut dalam satu lembar kerja:

| NIS | Nama Siswa | Mata Pelajaran | Guru | Nilai |
|---|---|---|---|---:|
| S001 | Ayu | Basis Data | Budi | 90 |
| S001 | Ayu | Statistika | Citra | 85 |
| S002 | Deni | Basis Data | Budi | 80 |

Nama siswa dan guru ditulis berulang. Ketika nama guru berubah, banyak baris harus diperbarui. Pemodelan membantu kita melihat bahwa Siswa, Guru, dan Mata Pelajaran adalah objek berbeda yang perlu disusun dan dihubungkan dengan benar.

## 2. Model sebagai Penyederhanaan Dunia Nyata

Model tidak mencatat seluruh keadaan dunia nyata. Model hanya memilih bagian yang relevan dengan kebutuhan sistem.

Contoh pada sistem akademik:

- warna kesukaan mahasiswa mungkin tidak perlu disimpan;
- NIM, nama, program studi, dan riwayat KRS perlu disimpan;
- data tinggi badan mungkin penting untuk sistem kesehatan, tetapi tidak untuk KRS.

Dengan demikian, kualitas model tidak diukur dari banyaknya atribut, tetapi dari ketepatannya menjawab kebutuhan pengguna dan aturan bisnis.

## 3. Tingkatan Pemodelan Basis Data

Slide membagi pemodelan menjadi model konseptual, logis, dan fisik. Ketiganya bukan rancangan yang saling menggantikan, melainkan tahapan yang semakin rinci.

### 3.1 Model Konseptual

Model konseptual menjelaskan data apa yang diperlukan dan bagaimana hubungan umumnya. Model ini:

- berfokus pada sudut pandang bisnis/pengguna;
- tidak bergantung pada DBMS atau platform;
- belum membahas tipe data teknis dan indeks;
- biasanya digambarkan menggunakan ERD tingkat tinggi.

Contoh:

```text
MAHASISWA ── mengambil ── MATA_KULIAH
DOSEN ── mengajar ── MATA_KULIAH
```

Pertanyaan yang dijawab:

- Objek apa yang perlu disimpan?
- Bagaimana objek tersebut saling berhubungan?
- Aturan bisnis apa yang berlaku?

### 3.2 Model Logis

Model logis memperinci model konseptual menjadi struktur yang dapat diterjemahkan ke model basis data tertentu. Pada model relasional, tahap ini mencakup:

- entitas dan atribut yang lengkap;
- primary key dan candidate key;
- foreign key;
- kardinalitas dan partisipasi;
- pemetaan relasi menjadi tabel;
- constraint logis;
- normalisasi.

Contoh skema logis:

```text
MAHASISWA(nim, nama, kode_prodi)
MATA_KULIAH(kode_mk, nama_mk, sks)
KRS(nim, kode_mk, semester, nilai)
```

Model logis belum terikat penuh pada detail penyimpanan suatu produk DBMS.

### 3.3 Model Fisik

Model fisik menjelaskan bagaimana model logis diterapkan pada DBMS tertentu. Tahap ini mencakup:

- nama tabel dan kolom yang digunakan;
- tipe data serta panjangnya;
- primary key, foreign key, dan constraint;
- indeks;
- strategi penyimpanan dan detail performa;
- sintaks DDL sesuai DBMS.

Contoh implementasi MySQL:

```sql
CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    kode_prodi VARCHAR(10) NOT NULL
);
```

### Perbandingan Tiga Tingkat Model

| Aspek | Konseptual | Logis | Fisik |
|---|---|---|---|
| Fokus | Kebutuhan bisnis | Struktur data | Implementasi DBMS |
| Pembaca utama | Pengguna dan analis | Perancang data | Developer dan DBA |
| Detail | Entitas dan relasi utama | Atribut, key, kardinalitas | Tipe data, constraint, indeks |
| Terikat teknologi | Tidak | Sebagian/model tertentu | Ya |
| Contoh luaran | ERD konseptual | Skema relasional | SQL `CREATE TABLE` |

## 4. Contoh Tahapan Pemodelan Sistem Akademik

Slide menggunakan sistem pendaftaran mahasiswa sebagai contoh.

### Tahap 1 — Analisis Kebutuhan

Data yang perlu disimpan antara lain:

- mahasiswa;
- mata kuliah;
- dosen;
- kelas atau kegiatan mengajar;
- pengambilan mata kuliah dan nilai.

Contoh aturan bisnis:

- seorang mahasiswa dapat mengambil banyak mata kuliah;
- satu mata kuliah dapat diambil banyak mahasiswa;
- seorang dosen dapat mengajar beberapa mata kuliah;
- nilai dimiliki oleh mahasiswa pada mata kuliah tertentu.

### Tahap 2 — Desain Konseptual

Entitas awal adalah Mahasiswa, Mata Kuliah, dan Dosen. Relasinya antara lain `mengambil` dan `mengajar`.

### Tahap 3 — Desain Logis

Relasi banyak-ke-banyak Mahasiswa–Mata Kuliah diselesaikan melalui entitas/tabel penghubung KRS.

```text
MAHASISWA (nim, nama, jurusan)
MATA_KULIAH (kode_mk, nama_mk, sks)
KRS (nim, kode_mk, semester, nilai)
```

### Tahap 4 — Desain Fisik

Setiap struktur diterjemahkan menjadi tabel MySQL lengkap dengan tipe data, primary key, dan foreign key. Implementasinya dipelajari pada pertemuan berikutnya.

## 5. Entity Relationship Diagram (ERD)

**Entity Relationship Diagram** adalah model visual yang digunakan untuk menjelaskan struktur dan hubungan data dalam basis data.

ERD membantu tim untuk:

- menyamakan pemahaman sebelum coding;
- menemukan objek dan aturan yang belum jelas;
- memeriksa hubungan serta kardinalitas;
- menjadi dasar pembuatan tabel;
- mendokumentasikan rancangan sistem.

Dalam notasi Chen yang diperkenalkan pada slide:

| Komponen | Simbol umum | Makna |
|---|---|---|
| Entitas | Persegi panjang | Objek yang datanya disimpan |
| Atribut | Elips | Karakteristik entitas |
| Relasi | Belah ketupat | Hubungan antarentitas |
| Garis | Garis penghubung | Menghubungkan komponen ERD |
| Atribut key | Elips dengan nama digarisbawahi | Atribut pengidentifikasi |
| Multivalue | Elips ganda | Atribut dengan lebih dari satu nilai |
| Derivatif | Elips bergaris putus-putus | Atribut hasil perhitungan |

Notasi dapat berbeda pada aplikasi pemodelan, misalnya Chen atau Crow's Foot. Yang paling penting adalah konsistensi notasi dan kejelasan aturan yang digambarkan.

## 6. Entitas

Entitas adalah objek, orang, tempat, peristiwa, atau konsep yang dapat dibedakan dan perlu disimpan datanya.

Contoh entitas:

- `Mahasiswa`;
- `Dosen`;
- `MataKuliah`;
- `Gudang`;
- `Barang`;
- `Supplier`;
- `Pasien`;
- `RekamMedis`.

### Entitas dan Instance

`Mahasiswa` adalah jenis/himpunan entitas, sedangkan “Ayu dengan NIM 1025001” adalah satu instance entitas Mahasiswa.

| Jenis entitas | Contoh instance |
|---|---|
| Mahasiswa | Ayu, NIM 1025001 |
| Barang | Laptop Edu, kode P001 |
| Dokter | dr. Budi, kode D015 |

### Cara Menemukan Entitas

Perhatikan kata benda pada deskripsi kebutuhan, lalu uji:

1. Apakah objek tersebut penting bagi sistem?
2. Apakah sistem perlu menyimpan beberapa atributnya?
3. Apakah setiap instance dapat dibedakan?
4. Apakah objek memiliki hubungan dengan objek lain?

Tidak semua kata benda otomatis menjadi entitas. “Alamat” dapat menjadi atribut jika hanya satu teks, tetapi dapat menjadi entitas jika sistem perlu menyimpan banyak alamat beserta jenis dan riwayatnya.

## 7. Atribut

Atribut adalah elemen data yang menjelaskan karakteristik entitas atau relasi.

Contoh atribut Mahasiswa:

```text
Mahasiswa: nim, nama, tanggal_lahir, alamat, email
```

### 7.1 Atribut Key

Atribut key mengidentifikasi setiap instance secara unik. Contoh: `nim` untuk Mahasiswa dan `kode_mk` untuk Mata Kuliah.

Key yang baik harus:

- unik;
- tidak kosong;
- stabil atau jarang berubah;
- sesederhana mungkin.

### 7.2 Atribut Simple

Atribut simple dianggap tidak perlu dipecah lagi dalam konteks sistem.

Contoh: `jenis_kelamin`, `sks`, atau `kode_pos`.

Sebuah nilai yang tampak kompleks dapat tetap simple bila sistem tidak perlu mengolah komponennya. Keputusan bergantung kebutuhan.

### 7.3 Atribut Multivalue

Atribut multivalue mempunyai lebih dari satu nilai untuk satu instance entitas.

Contoh:

- satu mahasiswa memiliki beberapa nomor telepon;
- satu buku memiliki beberapa pengarang;
- satu pengguna memiliki beberapa keahlian.

Pada implementasi relasional, nilai-nilai tersebut tidak ditumpuk dalam satu kolom. Biasanya dibuat entitas/tabel terpisah.

### 7.4 Atribut Composite

Atribut composite terdiri dari beberapa bagian yang masih memiliki arti.

Contoh:

```text
nama_lengkap → nama_depan, nama_tengah, nama_belakang
alamat → jalan, kota, provinsi, kode_pos
```

Atribut dipecah jika komponennya perlu dicari, divalidasi, atau ditampilkan secara terpisah.

### 7.5 Atribut Derivatif

Atribut derivatif diperoleh dari atribut lain.

Contoh:

- umur dihitung dari tanggal lahir dan tanggal saat ini;
- subtotal dihitung dari jumlah × harga;
- lama peminjaman dihitung dari tanggal kembali − tanggal pinjam.

Menyimpan atribut derivatif dapat menghasilkan inkonsistensi jika nilai dasar berubah tetapi hasilnya tidak diperbarui. Karena itu, atribut derivatif biasanya dihitung saat diperlukan, kecuali ada alasan performa dan mekanisme konsistensi yang jelas.

### Ringkasan Jenis Atribut

| Jenis | Ciri | Contoh |
|---|---|---|
| Key | Mengidentifikasi instance | NIM |
| Simple | Bernilai tunggal dan dianggap tidak dipecah | SKS |
| Multivalue | Dapat memiliki beberapa nilai | Nomor telepon |
| Composite | Terdiri dari bagian bermakna | Alamat |
| Derivatif | Dihitung dari atribut lain | Umur |

## 8. Relasi

Relasi adalah hubungan antara dua atau lebih entitas. Nama relasi sebaiknya menggunakan kata kerja agar mudah dibaca.

Contoh:

```text
Mahasiswa mengambil MataKuliah
Dosen mengajar MataKuliah
Supplier mengirim Barang
Pasien memiliki RekamMedis
```

Relasi harus dibaca dalam dua arah. Contoh:

- seorang Dosen dapat mengajar banyak Mata Kuliah;
- satu Mata Kuliah dapat diajar oleh seorang atau beberapa Dosen, tergantung aturan sistem.

Tanpa aturan bisnis, gambar relasi dapat menghasilkan interpretasi berbeda.

## 9. Derajat Relasi

Derajat relasi menunjukkan jumlah **jenis entitas** yang berpartisipasi dalam satu relasi. Derajat tidak sama dengan kardinalitas.

### 9.1 Unary Degree

Relasi unary atau rekursif menghubungkan instance dalam jenis entitas yang sama.

```text
MATA_KULIAH ── memiliki_prasyarat ── MATA_KULIAH
PEGAWAI ── membawahi ── PEGAWAI
```

### 9.2 Binary Degree

Relasi binary melibatkan dua jenis entitas dan merupakan bentuk yang paling umum.

```text
MAHASISWA ── mengunjungi ── PERPUSTAKAAN
```

### 9.3 Ternary Degree

Relasi ternary melibatkan tiga jenis entitas sekaligus.

```text
MAHASISWA ── belajar ── MATA_KULIAH ── di ── RUANGAN
```

Relasi ternary tidak selalu dapat diganti oleh tiga relasi binary tanpa mengubah makna. Gunakan hanya jika fakta bisnis memang bergantung pada kombinasi ketiga entitas.

| Konsep | Pertanyaan yang dijawab |
|---|---|
| Derajat | Berapa jenis entitas yang terlibat dalam relasi? |
| Kardinalitas | Berapa banyak instance yang dapat berhubungan? |

## 10. Kardinalitas Relasi

Kardinalitas menggambarkan jumlah maksimum instance suatu entitas yang dapat berhubungan dengan instance entitas lain.

### 10.1 One-to-One (1:1)

Satu instance A berhubungan paling banyak dengan satu instance B, dan sebaliknya.

Contoh slide:

> Satu mahasiswa mengambil satu judul skripsi, dan satu judul skripsi diambil oleh satu mahasiswa.

Model ini perlu diperiksa terhadap aturan nyata. Jika mahasiswa dapat mengganti judul dan histori perlu disimpan, modelnya mungkin lebih kompleks.

### 10.2 One-to-Many (1:N)

Satu instance A dapat berhubungan dengan banyak instance B, tetapi setiap B hanya berhubungan dengan satu A.

Contoh:

> Satu divisi memiliki banyak karyawan, sedangkan satu karyawan terdaftar pada satu divisi.

```text
DIVISI 1 ───────── N KARYAWAN
```

### 10.3 Many-to-Many (N:M)

Banyak instance A dapat berhubungan dengan banyak instance B.

Contoh:

> Satu mahasiswa mengambil banyak mata kuliah dan satu mata kuliah diambil banyak mahasiswa.

Pada model relasional, relasi N:M diselesaikan dengan entitas asosiatif:

```text
MAHASISWA 1 ── N KRS N ── 1 MATA_KULIAH
```

Entitas `KRS` dapat memiliki:

- `nim` sebagai foreign key ke Mahasiswa;
- `kode_mk` sebagai foreign key ke Mata Kuliah;
- `semester`;
- `tahun`;
- `nilai`.

Primary key dapat berupa kombinasi beberapa foreign key dan periode, atau menggunakan id tambahan dengan unique constraint yang sesuai aturan bisnis.

## 11. Partisipasi Minimum

Kardinalitas maksimum saja belum menjelaskan apakah hubungan wajib atau opsional. Partisipasi minimum biasanya dinyatakan dengan 0 atau 1.

Contoh:

- satu mahasiswa **dapat** belum mempunyai KRS: `0..N`;
- setiap KRS **harus** dimiliki tepat satu mahasiswa: `1..1`;
- seorang dosen **dapat** belum menjadi pembimbing: `0..N`.

Kata **dapat** biasanya menunjukkan minimum 0, sedangkan **harus** menunjukkan minimum 1.

## 12. Primary Key dan Foreign Key

### Primary Key

Primary key adalah atribut atau kombinasi atribut yang dipilih untuk mengidentifikasi setiap baris secara unik.

Contoh:

- `Mahasiswa.nim`;
- `Dosen.nip`;
- `MataKuliah.kode_mk`.

### Foreign Key

Foreign key adalah atribut yang merujuk key pada entitas/tabel lain dan menjadi penghubung data.

Contoh:

```text
MAHASISWA(nim, nama, kode_prodi)
PROGRAM_STUDI(kode_prodi, nama_prodi)
```

`Mahasiswa.kode_prodi` menjadi foreign key yang merujuk `Program_Studi.kode_prodi`.

| Primary key | Foreign key |
|---|---|
| Mengidentifikasi baris pada tabelnya | Menghubungkan ke tabel lain |
| Harus unik | Dapat berulang pada relasi 1:N |
| Tidak boleh NULL | Dapat NULL jika hubungan opsional |
| Satu primary key per tabel | Dapat memiliki beberapa foreign key |

## 13. Tahapan Pembuatan ERD

Sesuai slide, pembuatan ERD dilakukan melalui tahapan berikut.

### Tahap 1 — Identifikasi Entitas

Baca deskripsi masalah, tandai objek penting, lalu tentukan objek yang perlu disimpan datanya.

### Tahap 2 — Tentukan Atribut Key

Tentukan atribut yang dapat membedakan setiap instance entitas secara unik.

### Tahap 3 — Identifikasi Relasi

Tentukan hubungan antarentitas dan beri nama relasi menggunakan kata kerja. Foreign key belum harus ditulis pada ERD konseptual, tetapi arah pemetaannya perlu mulai dipahami.

### Tahap 4 — Tentukan Derajat dan Kardinalitas

Tentukan jumlah jenis entitas yang terlibat, maksimum hubungan, serta apakah partisipasinya wajib atau opsional.

### Tahap 5 — Lengkapi Atribut Non-key

Tambahkan atribut yang benar-benar diperlukan dan tempatkan pada entitas atau relasi yang tepat.

### Tahap 6 — Validasi dengan Aturan Bisnis

Tambahan penjelasan agar proses lebih kuat:

- baca setiap relasi dalam dua arah;
- uji dengan data contoh;
- tanyakan apakah model mendukung tambah, ubah, hapus, dan laporan;
- konfirmasi istilah kepada pengguna;
- catat asumsi yang belum dipastikan.

## 14. Semantic Data Model

Slide juga memperkenalkan **semantic data model**. Model ini hampir sama dengan Entity Relationship Model karena menggambarkan objek, atribut, dan hubungan. Perbedaannya, makna hubungan lebih banyak dijelaskan menggunakan kata atau frasa semantik, bukan hanya simbol.

Contoh pernyataan semantik:

```text
Mahasiswa mengambil Mata Kuliah.
Dosen mengajar Mata Kuliah.
Mata Kuliah memiliki prasyarat Mata Kuliah lain.
```

Kalimat tersebut membantu pembaca memahami makna model. Dalam praktik, ERD yang baik selalu disertai business rule tertulis karena simbol saja belum selalu menjelaskan aturan secara lengkap.

## 15. Contoh Terpadu: Toko XYZ

Deskripsi pada slide:

> Toko XYZ mempunyai lebih dari satu gudang untuk menyimpan berbagai jenis barang. Barang dikirim oleh beberapa supplier. Barang yang dijual memiliki kategori, antara lain pangan dan sandang.

### Identifikasi Awal

Entitas yang mungkin ditemukan:

- `Toko`;
- `Gudang`;
- `Barang`;
- `Supplier`;
- `Kategori`.

### Contoh Aturan Bisnis

1. Satu toko memiliki banyak gudang.
2. Setiap gudang dimiliki oleh satu toko.
3. Satu gudang menyimpan banyak barang.
4. Satu jenis barang dapat disimpan di beberapa gudang.
5. Satu supplier dapat mengirim banyak barang.
6. Satu barang dapat dikirim oleh beberapa supplier.
7. Setiap barang termasuk dalam satu kategori.
8. Satu kategori mempunyai banyak barang.

Relasi Gudang–Barang dan Supplier–Barang adalah N:M sehingga kelak membutuhkan entitas asosiatif. Atribut seperti jumlah stok lebih tepat ditempatkan pada hubungan Gudang–Barang karena jumlah barang dapat berbeda di setiap gudang.

## 16. Kesalahan Umum dalam Pemodelan

1. **Semua kata benda dijadikan entitas** — pilih hanya objek yang perlu dikelola.
2. **Nama entitas terlalu umum** — gunakan nama yang jelas dan konsisten.
3. **Tidak menentukan key** — setiap entitas harus dapat dibedakan.
4. **Atribut ditempatkan pada entitas yang salah** — nilai harus bergantung pada pemiliknya.
5. **Relasi tidak memiliki kata kerja** — diagram menjadi sulit dibaca.
6. **Hanya menentukan N:M tanpa entitas asosiatif** — implementasi relasional belum terselesaikan.
7. **Derajat disamakan dengan kardinalitas** — keduanya menjawab pertanyaan berbeda.
8. **Menyimpan atribut derivatif tanpa alasan** — berpotensi tidak konsisten.
9. **Tidak mencatat partisipasi minimum** — tidak diketahui apakah hubungan wajib.
10. **Langsung membuat tabel tanpa memahami kebutuhan** — struktur mungkin benar secara sintaks tetapi salah secara bisnis.

## 17. Aktivitas Diskusi

1. Mengapa sebuah model tidak perlu menyimpan seluruh fakta dunia nyata?
2. Jelaskan perbedaan model konseptual, logis, dan fisik menggunakan analogi pembangunan rumah.
3. Apakah nomor telepon selalu merupakan atribut multivalue? Jelaskan berdasarkan kebutuhan.
4. Mengapa umur lebih baik dihitung dari tanggal lahir?
5. Apa perbedaan derajat relasi dan kardinalitas?
6. Kapan hubungan N:M memerlukan atribut tambahan?
7. Apakah hubungan Siswa–Mata Pelajaran cukup dimodelkan langsung sebagai N:M? Data apa yang mungkin dimiliki hubungan tersebut?

## 18. Latihan Pemahaman

### Latihan 1 — Sekolah

Sebuah sekolah ingin mengelola data siswa, guru, dan mata pelajaran.

1. Identifikasi entitas dan atribut key.
2. Jelaskan relasi antara Siswa, Guru, dan Mata Pelajaran.
3. Tentukan kardinalitas serta partisipasi minimum.
4. Tentukan apakah diperlukan entitas asosiatif.

### Latihan 2 — Rumah Sakit

Sebuah rumah sakit ingin mengelola pasien, dokter, dan rekam medis.

1. Identifikasi entitas utama.
2. Tentukan atribut untuk setiap entitas.
3. Bedakan atribut simple, composite, multivalue, dan derivatif.
4. Gambarkan relasi dan kardinalitas yang sesuai.
5. Tuliskan sedikitnya lima aturan bisnis.

### Latihan 3 — Toko XYZ

Berdasarkan kasus pada bagian 15:

1. buat ERD konseptual;
2. tambahkan atribut utama;
3. selesaikan relasi N:M;
4. jelaskan letak atribut jumlah stok dan jumlah barang dikirim;
5. jelaskan asumsi yang digunakan.

## 19. Kuis Formatif

### Pilihan Ganda

1. Entitas dalam ERD adalah:
   - a. hubungan antara dua tabel;
   - b. objek atau konsep yang memiliki data;
   - c. tipe data pada atribut;
   - d. batasan pada kolom.

2. Simbol entitas dalam notasi Chen adalah:
   - a. lingkaran;
   - b. persegi panjang;
   - c. elips;
   - d. garis.

3. Relasi adalah:
   - a. karakteristik entitas;
   - b. hubungan antara dua atau lebih entitas;
   - c. tipe data atribut;
   - d. nama primary key.

4. Kardinalitas dalam ERD menjelaskan:
   - a. jumlah atribut entitas;
   - b. tipe data atribut;
   - c. banyaknya instance yang dapat berhubungan;
   - d. nama entitas.

5. Contoh one-to-many adalah:
   - a. satu mahasiswa memiliki satu NIM;
   - b. satu divisi memiliki banyak karyawan;
   - c. satu kelas memiliki satu kode kelas;
   - d. satu karyawan mempunyai satu nama.

6. Fungsi atribut adalah:
   - a. menghubungkan semua entitas;
   - b. menjelaskan karakteristik entitas atau relasi;
   - c. menunjukkan jumlah entitas;
   - d. menyimpan database secara fisik.

7. Simbol atribut pada notasi Chen adalah:
   - a. persegi panjang;
   - b. elips;
   - c. belah ketupat;
   - d. garis ganda.

8. Primary key adalah:
   - a. atribut unik yang mengidentifikasi setiap instance;
   - b. seluruh atribut yang boleh NULL;
   - c. atribut yang selalu berasal dari tabel lain;
   - d. atribut yang nilainya dihitung.

9. Tujuan utama ERD adalah:
   - a. mendesain tampilan aplikasi;
   - b. merancang struktur dan hubungan data secara logis;
   - c. membuat laporan keuangan;
   - d. menggantikan DBMS.

### Uraian

10. Jelaskan perbedaan entitas dan atribut beserta contoh.
11. Berikan contoh relasi 1:1, 1:N, dan N:M.
12. Jelaskan perbedaan primary key dan foreign key.
13. Jelaskan perbedaan model konseptual, logis, dan fisik.
14. Jelaskan perbedaan unary, binary, dan ternary degree.

## 20. Tugas 1 — Perancangan ERD

Tugas pada slide terdiri dari tiga alternatif kasus:

### Kasus A — Toko XYZ

Rancang ERD untuk toko dengan beberapa gudang, barang, supplier, serta kategori pangan dan sandang.

### Kasus B — Sekolah

Rancang ERD sederhana untuk mengelola siswa, guru, dan mata pelajaran. Jelaskan seluruh relasinya.

### Kasus C — Rumah Sakit

Identifikasi entitas, atribut, relasi, dan kardinalitas untuk pasien, dokter, dan rekam medis.

### Luaran Tugas

1. deskripsi masalah;
2. daftar asumsi;
3. sedikitnya delapan aturan bisnis;
4. daftar entitas dan atribut;
5. key setiap entitas;
6. ERD dengan relasi serta kardinalitas;
7. penjelasan diagram menggunakan kalimat;
8. evaluasi singkat terhadap redundansi dan kebutuhan pengguna.

## 21. Rangkuman

- Pemodelan basis data menyederhanakan dunia nyata menjadi struktur data yang relevan.
- Model konseptual berfokus pada kebutuhan, model logis memperinci struktur, dan model fisik menerapkannya pada DBMS.
- ERD menggambarkan entitas, atribut, dan relasi.
- Atribut dapat berupa key, simple, multivalue, composite, atau derivatif.
- Derajat menunjukkan jumlah jenis entitas yang berpartisipasi; kardinalitas menunjukkan banyaknya instance yang dapat berhubungan.
- Kardinalitas utama adalah 1:1, 1:N, dan N:M.
- Relasi N:M pada model relasional diselesaikan dengan entitas asosiatif.
- Primary key mengidentifikasi baris, sedangkan foreign key menghubungkan data.
- ERD harus divalidasi menggunakan aturan bisnis dan contoh data.
- Semantic data model membantu menjelaskan makna hubungan menggunakan kata-kata.

## 22. Asesmen dan Durasi

**Asesmen minggu 2:** Tugas 1, kuis, diskusi, dan penilaian kemampuan menjelaskan model data serta komponen ERD.

**Durasi sesuai RPS:**

- tatap muka: 1 × (3 × 50 menit);
- praktikum: 1 × 170 menit;
- penugasan terstruktur: 1 × (4 × 60 menit);
- belajar mandiri: 1 × (4 × 60 menit).

Materi praktikum ditempatkan terpisah pada folder `script/Week 2/` agar modul ini tetap berfokus pada materi perkuliahan.

## Referensi

1. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
2. Slide Week 2 — *Pemodelan Basis Data*.
3. RPS SI2514010 — Basis Data.
