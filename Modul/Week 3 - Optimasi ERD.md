# Minggu 3 — Optimasi Entity Relationship Diagram

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan basis data dan merancang basis data (C4, C6).

## 1. Pengertian Optimasi ERD

ERD awal belum tentu menjadi rancangan terbaik. Setelah entitas, atribut, dan relasi ditemukan, diagram perlu diperiksa kembali agar tidak boros, kaku, atau sulit dikembangkan.

**Optimasi ERD** adalah proses memperbaiki model data agar:

- lebih efisien dalam menyimpan data;
- mengurangi redundansi dan risiko anomali;
- mempunyai key yang stabil;
- fleksibel menghadapi perubahan kebutuhan;
- mudah diterjemahkan menjadi tabel;
- tetap sesuai dengan aturan bisnis.

Optimasi bukan sekadar mengurangi jumlah entitas atau memperindah gambar. Diagram yang lebih kecil belum tentu lebih benar. Keputusan harus didasarkan pada makna data dan kebutuhan sistem.

## 2. Tujuan Optimasi Menurut Slide

Slide mengelompokkan tujuan optimasi menjadi dua arah utama.

### 2.1 Efisien

Efisiensi berarti menyimpan data tanpa pengulangan yang tidak perlu dan memudahkan pengelolaan. Teknik yang diperkenalkan:

- mengidentifikasi entitas lemah;
- memilih key yang tepat;
- memindahkan data referensi berulang ke entitas tersendiri.

Penyimpanan yang lebih kecil dapat membantu performa, tetapi performa bukan hanya ditentukan jumlah tabel. Query, indeks, volume, dan pola akses juga berpengaruh.

### 2.2 Fleksibel

Fleksibel berarti model dapat digunakan dalam jangka panjang tanpa sering mengubah struktur ketika data bertambah. Tekniknya:

- menambahkan atribut yang memang diperlukan;
- memilih domain atribut yang lebih tepat;
- melakukan generalisasi;
- mengubah struktur kolom berulang menjadi struktur berbasis baris.

## 3. Mengukur Kualitas ERD

Gunakan pertanyaan berikut:

1. Apakah fakta yang sama disimpan berulang?
2. Apakah setiap entitas mempunyai key yang stabil?
3. Apakah atribut berada pada entitas atau relasi yang tepat?
4. Apakah satu kolom dapat berisi lebih dari satu nilai?
5. Apakah jumlah item dibatasi oleh kolom seperti `item1`, `item2`, `item3`?
6. Apakah perubahan kebutuhan memaksa penambahan kolom berulang?
7. Apakah model mendukung tambah, ubah, hapus, dan laporan tanpa anomali?
8. Apakah setiap relasi dapat dijelaskan menggunakan aturan bisnis?

## 4. Efisiensi Data: Contoh Asal Sekolah

Slide memperlihatkan rancangan awal Mahasiswa:

```text
Mahasiswa(nim, nama, asal_sekolah, alamat_sekolah, jenis_kelamin, agama)
```

Jika 100 mahasiswa berasal dari SMA 1 Balikpapan, nama dan alamat sekolah ditulis 100 kali.

### Masalah

- redundansi nama serta alamat sekolah;
- perubahan alamat harus dilakukan pada banyak baris;
- salah ketik dapat menghasilkan beberapa versi nama sekolah;
- ruang penyimpanan terbuang;
- laporan per sekolah menjadi kurang terpercaya.

### Model yang Dioptimalkan

```text
Sekolah(id_sekolah, nama_sekolah, alamat)
Mahasiswa(nim, nama, jenis_kelamin, agama, id_sekolah)
```

Relasinya:

```text
SEKOLAH 1 ───────── N MAHASISWA
```

Nama dan alamat sekolah disimpan sekali. Mahasiswa cukup menyimpan `id_sekolah` sebagai referensi.

### Catatan Penting

Pada slide, Sekolah disebut sebagai contoh entitas lemah. Secara konsep, bila Sekolah mempunyai `id_sekolah` mandiri dan dapat ada tanpa Mahasiswa, Sekolah lebih tepat disebut **entitas kuat**. Entitas lemah dijelaskan lebih tepat pada bagian berikut agar mahasiswa tidak salah memahami istilah.

## 5. Entitas Kuat dan Entitas Lemah

### 5.1 Entitas Kuat

Entitas kuat memiliki key sendiri dan dapat diidentifikasi tanpa bergantung pada entitas lain.

Contoh:

- Mahasiswa dengan `nim`;
- Sekolah dengan `id_sekolah`;
- Pesanan dengan `id_pesanan`.

### 5.2 Entitas Lemah

Entitas lemah tidak dapat diidentifikasi secara lengkap hanya dengan atributnya sendiri. Identitasnya bergantung pada key entitas pemilik dan sebuah partial key.

Contoh DetailPesanan:

```text
Pesanan(id_pesanan, tanggal)
DetailPesanan(id_pesanan, nomor_baris, id_produk, jumlah)
```

`nomor_baris = 1` tidak unik secara global. Ia baru unik jika digabung dengan `id_pesanan`. Key DetailPesanan adalah `(id_pesanan, nomor_baris)`.

Ciri entitas lemah:

- bergantung pada entitas pemilik;
- partisipasinya pada identifying relationship bersifat wajib;
- identitas sering merupakan gabungan key pemilik dan partial key;
- biasanya ikut hilang ketika pemiliknya dihapus, sesuai aturan bisnis.

Jangan menyebut semua entitas yang memiliki foreign key sebagai entitas lemah.

## 6. Pemilihan Primary Key dan Alternative Key

Sebuah entitas dapat memiliki beberapa candidate key. Satu dipilih menjadi primary key; candidate key lain menjadi **alternative key**.

### Contoh Hobi dari Slide

Nilai teks `Membaca`, `Menulis`, dan `Main Musik` memang dapat membedakan jenis hobi, tetapi memakai teks panjang sebagai primary key dapat kurang stabil.

Model yang lebih fleksibel:

```text
Hobi(id_hobi, nama_hobi, keterangan)
```

- `id_hobi` menjadi primary key;
- `nama_hobi` menjadi alternative key dengan aturan unik.

### Natural Key dan Surrogate Key

| Jenis | Contoh | Kelebihan | Risiko |
|---|---|---|---|
| Natural key | NIM, kode mata kuliah | Bermakna bagi bisnis | Dapat berubah atau panjang |
| Surrogate key | `id_hobi` | Pendek dan stabil | Tidak membawa makna bisnis |

Surrogate key tidak menghapus kebutuhan unique constraint pada candidate key bisnis. Jika `nama_hobi` tidak boleh duplikat, aturan itu tetap harus dicatat.

## 7. Penambahan Atribut pada Relasi

Slide menggunakan KRS dengan atribut awal:

```text
KRS(nim, kode_mk, nilai)
```

Model tersebut belum dapat membedakan mahasiswa yang mengambil ulang mata kuliah pada periode berbeda. Tambahkan konteks:

```text
KRS(tahun, semester, nim, kode_mk, nilai)
```

Atribut `nilai` bukan milik Mahasiswa saja dan bukan milik MataKuliah saja. Nilai bergantung pada hubungan mahasiswa mengambil mata kuliah pada suatu periode.

### Pertanyaan Penempatan Atribut

Untuk menentukan pemilik atribut, tanyakan:

- Apakah nilai ini menjelaskan satu entitas?
- Apakah nilai ini baru bermakna pada hubungan dua entitas?
- Apakah nilai berubah untuk setiap periode atau kejadian?

Contoh atribut relasi:

- `jumlah` dan `harga_jual` pada DetailPesanan;
- `nilai` pada KRS;
- `tanggal_mulai` pada PenugasanPegawai;
- `harga_beli` pada hubungan Supplier–Barang.

## 8. Pemilihan Domain Atribut yang Lebih Luas

Domain adalah himpunan nilai yang diperbolehkan untuk suatu atribut. Optimasi tidak berarti selalu membuat domain seluas mungkin, tetapi memilih domain yang cukup menampung kebutuhan saat ini dan perkembangan yang wajar.

Contoh:

- `tahun` sebaiknya tidak dibatasi hanya pada dua digit;
- `nama` perlu panjang yang realistis;
- status sebaiknya memiliki daftar nilai yang jelas;
- nomor telepon disimpan sebagai teks, bukan bilangan;
- nilai uang menggunakan tipe presisi tetap seperti `DECIMAL`.

Domain terlalu sempit menyebabkan perubahan struktur lebih cepat. Domain terlalu bebas mengurangi kualitas validasi. Cari keseimbangan berdasarkan aturan bisnis.

## 9. Generalisasi dan Spesialisasi

Slide menggambarkan model perpustakaan yang awalnya memisahkan Mahasiswa dan Dosen sebagai peminjam. Jika keduanya memiliki banyak atribut dan perilaku yang sama, model menjadi kaku dan berulang.

### Generalisasi

Generalisasi menggabungkan karakteristik umum beberapa entitas menjadi supertype.

```text
                 ANGGOTA
                /       \
       MAHASISWA         DOSEN
```

`Anggota` dapat menyimpan:

- `id_anggota`;
- `nama`;
- `jenis_anggota`;
- informasi kontak.

Mahasiswa dan Dosen menyimpan atribut khusus masing-masing.

### Aturan Berdasarkan Jenis Anggota

Contoh slide menempatkan aturan seperti:

- lama peminjaman;
- denda;
- maksimal jumlah pinjaman.

Aturan tersebut dapat dimodelkan melalui entitas JenisAnggota:

```text
JenisAnggota(kode_jenis, nama_jenis, lama_pinjam, denda, maksimal_pinjam)
Anggota(id_anggota, nama, kode_jenis)
```

Menambah jenis anggota baru tidak memerlukan penambahan tabel baru.

### Spesialisasi

Spesialisasi adalah proses kebalikan: supertype dibagi menjadi subtype karena masing-masing mempunyai atribut atau aturan khusus.

Gunakan generalisasi jika manfaatnya nyata. Jangan menyatukan entitas yang hanya kebetulan memiliki satu atau dua atribut sama tetapi makna bisnisnya berbeda.

## 10. Struktur Kolom Menjadi Struktur Baris

Slide memberikan rancangan sirkulasi:

```text
Sirkulasi(id_sirkulasi, tanggal_pinjam, id_anggota,
          id_buku1, id_buku2, id_buku3)
```

### Masalah Kolom Berulang

- maksimal hanya tiga buku;
- jika ingin lima buku, struktur tabel harus diubah;
- banyak kolom dapat kosong;
- query jumlah buku menjadi rumit;
- aturan dan foreign key harus diulang;
- nama kolom menyimpan urutan, bukan makna data.

### Perbaikan

```text
Sirkulasi(id_sirkulasi, tanggal_pinjam, id_anggota)
DetailSirkulasi(id_sirkulasi, id_buku, tanggal_kembali)
```

Data buku disimpan sebagai baris:

| id_sirkulasi | id_buku | tanggal_kembali |
|---:|---|---|
| 1 | B1 | NULL |
| 1 | B2 | NULL |
| 1 | B3 | NULL |
| 1 | B4 | NULL |

Jumlah buku dapat bertambah tanpa mengubah struktur tabel. Pola ini disebut **repeating group** yang diubah menjadi detail rows dan menjadi dasar menuju First Normal Form.

## 11. Relasi N:M dan Tabel Asosiatif

Slide kuis menekankan bahwa relasi many-to-many perlu dibuatkan tabel baru. Alasannya:

- DBMS relasional tidak menyimpan hubungan N:M langsung dalam satu foreign key;
- tabel asosiatif menyimpan pasangan key;
- atribut hubungan memiliki tempat yang tepat;
- aturan unik dan referensial dapat diterapkan.

Contoh:

```text
MAHASISWA 1 ── N KRS N ── 1 MATA_KULIAH
```

KRS dapat menyimpan semester, tahun, kelas, dan nilai.

## 12. Atribut Composite dan Derived

### Composite

Atribut composite terdiri dari bagian yang bermakna, misalnya:

```text
nama_lengkap → nama_depan, nama_tengah, nama_belakang
alamat → jalan, kota, provinsi, kode_pos
```

### Derived

Atribut derived dihitung dari data lain:

- umur dari tanggal lahir;
- subtotal dari jumlah × harga;
- lama pinjam dari tanggal kembali − tanggal pinjam.

Menghapus **semua** atribut turunan bukan aturan mutlak. Atribut dapat dihitung saat query atau disimpan untuk performa jika terdapat mekanisme yang menjaga konsistensi.

## 13. Anomali yang Ingin Dicegah

Optimasi ERD membantu mengurangi:

- **update anomaly:** fakta yang sama harus diperbarui di banyak tempat;
- **insert anomaly:** data tidak dapat dimasukkan tanpa data lain yang belum tersedia;
- **delete anomaly:** menghapus satu kejadian ikut menghilangkan fakta penting lain.

Contoh: jika informasi Sekolah hanya tersimpan pada baris Mahasiswa, menghapus mahasiswa terakhir dari sekolah tersebut dapat menghilangkan seluruh informasi Sekolah.

## 14. Prosedur Optimasi ERD

1. Baca ulang kebutuhan dan aturan bisnis.
2. Tandai atribut berulang serta fakta yang disimpan di banyak tempat.
3. Periksa setiap entitas dan key.
4. Bedakan entitas kuat dan lemah.
5. Identifikasi candidate key serta alternative key.
6. Periksa atribut yang sebenarnya milik relasi.
7. Periksa domain nilai dan kemungkinan pertumbuhan.
8. Cari repeating columns atau multivalue.
9. Pertimbangkan generalisasi/spesialisasi.
10. Selesaikan relasi N:M dengan entitas asosiatif.
11. Uji insert, update, delete, dan laporan.
12. Bandingkan model sebelum dan sesudah serta catat alasannya.

## 15. Kesalahan Umum

1. Menganggap optimasi selalu berarti mengurangi tabel.
2. Memisahkan setiap atribut menjadi entitas tanpa kebutuhan.
3. Menyebut semua tabel anak sebagai entitas lemah.
4. Menggunakan surrogate key tetapi melupakan unique business key.
5. Menaruh atribut relasi pada salah satu entitas secara sembarang.
6. Menggunakan kolom bernomor seperti `buku1`, `buku2`, dan `buku3`.
7. Melakukan generalisasi hanya karena nama atribut sama.
8. Membuat domain terlalu sempit atau terlalu bebas.
9. Mengoptimalkan performa tanpa data pengukuran.
10. Mengubah ERD tetapi tidak memperbarui aturan bisnis dan kamus data.

## 16. Aktivitas Diskusi

1. Apakah pemisahan Sekolah dari Mahasiswa selalu diperlukan?
2. Mengapa Sekolah dengan `id_sekolah` bukan contoh entitas lemah yang tepat?
3. Kapan natural key lebih baik daripada surrogate key?
4. Mengapa nilai ditempatkan pada KRS?
5. Apa keuntungan generalisasi Mahasiswa dan Dosen menjadi Anggota?
6. Bagaimana menyimpan peminjaman lebih dari tiga buku tanpa menambah kolom?
7. Apakah menyimpan atribut derived selalu salah?

## 17. Latihan Pemahaman

### Latihan A — Asal Sekolah

Bandingkan model sebelum dan sesudah pemisahan Sekolah. Jelaskan redundansi, key, relasi, dan kemungkinan nilai NULL.

### Latihan B — KRS

Perbaiki `KRS(nim, kode_mk, nilai)` agar mendukung pengambilan ulang mata kuliah dan beberapa kelas pada periode yang sama.

### Latihan C — Perpustakaan

Ubah struktur `id_buku1`–`id_buku3` menjadi header dan detail. Tentukan primary key, foreign key, dan atribut tanggal kembali.

### Latihan D — Generalisasi

Rancang supertype `Anggota` untuk Mahasiswa dan Dosen. Tentukan atribut umum, atribut khusus, dan aturan jenis anggota.

## 18. Kuis Formatif

1. Tujuan utama optimasi ERD adalah:
   - a. memperindah diagram;
   - b. menghapus sebanyak mungkin entitas;
   - c. meningkatkan kualitas desain agar efisien, fleksibel, dan mengurangi anomali;
   - d. mengganti semua relasi menjadi tabel.

2. Yang bukan teknik optimasi yang benar adalah:
   - a. memeriksa normalisasi;
   - b. meninjau entitas terlalu kecil;
   - c. memeriksa atribut turunan;
   - d. membiarkan relasi N:M tanpa tabel asosiatif.

3. Atribut yang dihitung dari atribut lain disebut:
   - a. key;
   - b. composite;
   - c. multivalue;
   - d. derived.

4. Relasi N:M dibuatkan tabel asosiatif untuk:
   - a. memperindah diagram;
   - b. menambah jumlah entitas;
   - c. menyimpan pasangan key dan atribut hubungan;
   - d. menghapus seluruh foreign key.

5. Contoh atribut composite adalah:
   - a. gaji;
   - b. nama lengkap yang terdiri dari nama depan dan belakang;
   - c. status aktif;
   - d. usia.

## 19. Rangkuman

- Optimasi ERD memperbaiki efisiensi dan fleksibilitas model tanpa mengubah makna bisnis.
- Data referensi berulang dapat dipisahkan menjadi entitas tersendiri.
- Entitas lemah bergantung pada key pemilik untuk identitasnya.
- Alternative key tetap perlu dijaga meskipun surrogate key dipilih sebagai primary key.
- Atribut relasi ditempatkan pada entitas asosiatif.
- Domain atribut perlu cukup luas tetapi tetap tervalidasi.
- Generalisasi mengumpulkan atribut dan aturan umum pada supertype.
- Repeating columns harus diubah menjadi baris detail.
- Relasi N:M memerlukan tabel asosiatif pada model relasional.
- Hasil optimasi harus diuji melalui skenario insert, update, delete, dan laporan.

## 20. Asesmen dan Durasi

**Asesmen:** Tugas 2, praktikum, pretest, kuis, dan kemampuan menjelaskan perbaikan model sebelum–sesudah.

Minggu 3–4 sesuai RPS memiliki alokasi bersama:

- tatap muka: 2 × (3 × 50 menit);
- praktikum: 2 × 170 menit;
- penugasan terstruktur: 2 × (4 × 60 menit);
- belajar mandiri: 2 × (4 × 60 menit).

Materi praktikum tersedia terpisah pada [Praktikum Minggu 3 — Optimasi ERD](../script/Week%203/Praktikum%20Week%203%20-%20Optimasi%20ERD.md).

## Referensi

1. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
2. Slide Week 3 — *Optimasi ERD*.
3. RPS SI2514010 — Basis Data.
