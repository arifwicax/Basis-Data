# Tugas 1 — Ringkasan Materi Basis Data

**Mata kuliah:** Basis Data (SI2514010)
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.
**Sifat tugas:** Individu

## Analisis Kebutuhan dan Perancangan Basis Data

### Tujuan Tugas

Mahasiswa mampu mengidentifikasi permasalahan nyata di lingkungan sekitar, menggali kebutuhan data dari calon pengguna (*client/mitra*), dan menerjemahkan kebutuhan tersebut ke dalam rancangan basis data melalui tahapan **pemodelan konseptual dan pemodelan logis**.

Pada tugas ini mahasiswa **belum melakukan implementasi basis data menggunakan DBMS/SQL**. Hasil akhir tugas adalah rancangan **Entity Relationship Diagram (ERD)** berdasarkan data dan kebutuhan nyata yang ditemukan di lapangan.

---

## Studi Kasus

Carilah **satu permasalahan nyata di lingkungan sekitar** yang aktivitasnya melibatkan pencatatan, pengelolaan, atau penyimpanan data.

Objek dapat berasal dari lingkungan kampus, tempat tinggal, UMKM, toko, organisasi, kelompok masyarakat, tempat usaha, atau mitra lainnya.

Contoh objek yang dapat dipilih antara lain:

* Toko atau usaha penjualan
* Warung/kedai
* Bengkel
* Laundry
* Penyewaan kendaraan
* Kelompok tani
* Perpustakaan
* Organisasi mahasiswa
* Pengelolaan laboratorium
* Tempat kursus
* Usaha jasa
* Klinik
* Penginapan
* Objek lain yang memiliki aktivitas pengelolaan data

---

# Instruksi Tugas

Lakukan observasi dan pengumpulan informasi secara langsung pada objek yang dipilih. Pengumpulan informasi dapat dilakukan melalui **wawancara, observasi, dan pengumpulan contoh dokumen/data yang digunakan oleh mitra**.

Anda diminta memahami bagaimana proses yang saat ini berjalan, data apa saja yang digunakan, serta kebutuhan mitra terhadap pengelolaan data tersebut.

Sebagai contoh, jika memilih sebuah toko, mahasiswa dapat memperoleh informasi mengenai proses penjualan dan mengumpulkan contoh data seperti daftar produk, kategori produk, pelanggan, transaksi, atau nota penjualan.

Data tersebut kemudian dianalisis untuk menentukan entitas, atribut, key, relasi, dan kardinalitas yang dibutuhkan dalam rancangan basis data.

---

# Tahapan Pengerjaan

## 1. Identifikasi Permasalahan dan Kebutuhan Client

Jelaskan objek yang dipilih dan permasalahan yang ditemukan.

Lakukan wawancara dengan pemilik, pengelola, pegawai, atau pihak yang memahami proses pada objek tersebut.

Jelaskan minimal:

* Profil singkat objek/mitra.
* Aktivitas atau proses bisnis yang diamati.
* Bagaimana data saat ini dicatat atau dikelola.
* Data apa saja yang digunakan.
* Permasalahan yang ditemukan dalam pengelolaan data.
* Informasi apa yang dibutuhkan oleh client.
* Kebutuhan basis data yang dapat membantu pengelolaan data tersebut.

---

## 2. Lampirkan Bukti Pengumpulan Data

Lampirkan bukti bahwa analisis dilakukan berdasarkan kondisi nyata.

Bukti dapat berupa:

* Dokumentasi kegiatan wawancara/observasi.
* Daftar pertanyaan wawancara.
* Ringkasan hasil wawancara.
* Foto objek/lokasi.
* Contoh dokumen yang digunakan mitra.
* Contoh formulir.
* Nota transaksi.
* Daftar produk/barang.
* Data pelanggan.
* Data stok.
* Data anggota.
* Data transaksi.
* Data lain yang relevan dengan studi kasus.

**Catatan:** Data yang bersifat pribadi atau rahasia harus disamarkan.

---

# Pemodelan Konseptual dan Logis

Berdasarkan hasil pengumpulan kebutuhan, lakukan perancangan basis data dengan tahapan berikut.

## 3. Identifikasi Entitas

Tentukan objek atau entitas apa saja yang datanya perlu disimpan di dalam basis data.

Setiap entitas harus memiliki alasan yang jelas berdasarkan kebutuhan client atau data yang ditemukan di lapangan.

**Contoh:**

Pada studi kasus toko ditemukan data mengenai barang yang dijual. Berdasarkan data tersebut dapat diidentifikasi entitas:

**Produk**

Jangan menentukan entitas hanya berdasarkan asumsi. Jelaskan **dari kebutuhan atau data mana entitas tersebut diperoleh**.

Buat tabel identifikasi seperti berikut:

| No. | Entitas   | Sumber Data/Kebutuhan           | Keterangan                   |
| --- | --------- | ------------------------------- | ---------------------------- |
| 1   | Produk    | Daftar produk dari pemilik toko | Menyimpan barang yang dijual |
| 2   | Pelanggan | Hasil wawancara                 | Menyimpan pelanggan          |
| ... | ...       | ...                             | ...                          |

---

## 4. Tentukan Atribut dan Atribut Kunci

Tentukan informasi yang perlu disimpan pada setiap entitas.

Tentukan juga atribut yang berfungsi sebagai **Primary Key (PK)**.

Contoh:

**Produk**

* id_produk (PK)
* nama_produk
* harga
* stok

**Pelanggan**

* id_pelanggan (PK)
* nama_pelanggan
* alamat
* no_telepon

Setiap atribut harus relevan dengan kebutuhan data yang ditemukan.

---

## 5. Identifikasi Relasi Antar Entitas

Tentukan hubungan yang terjadi antara satu entitas dengan entitas lainnya berdasarkan proses yang berlangsung pada objek penelitian.

Contoh:

**Pelanggan melakukan Pesanan**

Jelaskan alasan munculnya setiap relasi berdasarkan hasil wawancara, observasi, atau data yang diperoleh.

---

## 6. Tentukan Kardinalitas Relasi

Tentukan kardinalitas pada setiap hubungan antar entitas.

Gunakan kardinalitas:

**One to One (1:1)**
**One to Many (1:N)**
**Many to Many (M:N)**

Kardinalitas harus ditentukan berdasarkan **aturan bisnis (*business rules*) yang ditemukan dari client**, bukan sekadar asumsi mahasiswa.

Contoh:

> Satu pelanggan dapat melakukan banyak pesanan, sedangkan satu pesanan hanya dimiliki oleh satu pelanggan.

Maka hubungan:

**Pelanggan 1 : N Pesanan**

Tuliskan *business rules* yang mendasari setiap kardinalitas pada ERD.

---

## 7. Lengkapi dan Rancang ERD

Berdasarkan hasil analisis sebelumnya, buatlah **Entity Relationship Diagram (ERD)** secara lengkap.

ERD minimal harus memperlihatkan:

* Entitas
* Atribut
* Primary Key (PK)
* Foreign Key (FK), apabila diperlukan
* Relasi antar entitas
* Kardinalitas
* Optionality/participation jika diperlukan

Apabila ditemukan hubungan **Many to Many (M:N)**, lakukan penyelesaian hubungan tersebut menggunakan **entitas penghubung (*associative entity*)** sehingga rancangan dapat diterjemahkan ke dalam model basis data relasional.

---

# Hasil Akhir yang Dikumpulkan

Susun hasil pekerjaan dalam sebuah laporan dengan urutan:

1. **Judul Studi Kasus**
2. **Profil Objek/Mitra**
3. **Latar Belakang Permasalahan**
4. **Hasil Observasi dan Wawancara**
5. **Identifikasi Kebutuhan Data**
6. **Dokumentasi/Contoh Data yang Diperoleh**
7. **Identifikasi Entitas**
8. **Identifikasi Atribut dan Primary Key**
9. **Identifikasi Relasi Antar Entitas**
10. **Business Rules dan Kardinalitas**
11. **ERD Awal/Konseptual**
12. **ERD Hasil Akhir/Logis**
13. **Kesimpulan**
14. **Lampiran Dokumentasi Wawancara dan Data Pendukung**

---

# Ketentuan Penting

Rancangan ERD **harus berasal dari permasalahan dan kebutuhan nyata yang ditemukan di lapangan**.

Mahasiswa tidak diperkenankan menentukan seluruh kebutuhan sistem hanya berdasarkan asumsi tanpa melakukan pengumpulan data.

**Alur yang diharapkan:**

**Permasalahan Nyata → Observasi/Wawancara → Data yang Diperoleh → Kebutuhan Client → Identifikasi Entitas → Atribut & Key → Relasi → Kardinalitas → ERD**

Dengan demikian, mahasiswa tidak hanya mampu menggambar ERD, tetapi juga mampu menjelaskan **mengapa suatu entitas, atribut, relasi, dan kardinalitas diperlukan berdasarkan kebutuhan client**.

### Batas Tugas 1

Tugas ini hanya mencakup:

**Pemodelan Konseptual → Pemodelan Logis → ERD**

Tahap **pemodelan fisik dan implementasi menggunakan DBMS/SQL akan dilanjutkan pada tugas berikutnya.**
