

# 📌 Tugas 2
## 🎯 Tujuan Pembelajaran

1. Mahasiswa mampu mengidentifikasi kebutuhan data dari permasalahan nyata.
2. Mahasiswa mampu merancang **Entity Relationship Diagram (ERD)** berdasarkan kasus.
3. Mahasiswa mampu melakukan **optimasi ERD** (normalisasi & relasi).
4. Mahasiswa mampu mengimplementasikan ERD ke dalam **database MySQL**.

---

## 📝 Instruksi Tugas

### 1️⃣ Identifikasi Masalah

* Pilih salah satu kasus nyata dari sekitar Anda, misalnya:

  * Wawancara dengan pemilik usaha kecil (misal toko, kafe, percetakan).
  * Masalah administrasi di organisasi (UKM, komunitas, RT/RW, dll).
  * Permasalahan sehari-hari (pencatatan keuangan pribadi, jadwal belajar, manajemen kos-kosan, dll).

📌 Buatlah **deskripsi singkat permasalahan** (½–1 halaman).

---

### 2️⃣ Pembuatan ERD Awal

* Berdasarkan permasalahan tersebut, identifikasi:

  * **Entitas utama** (misalnya: Pelanggan, Produk, Transaksi).
  * **Atribut penting** (misalnya: nama, harga, tanggal, jumlah).
  * **Relasi antar entitas** (One-to-One, One-to-Many, Many-to-Many).

📌 Gambar ERD awal menggunakan aplikasi (misalnya: draw\.io, Lucidchart, atau manual).

---

### 3️⃣ Optimasi ERD

* Lakukan **normalisasi hingga 3NF** untuk menghindari redundansi data.
* Revisi ERD agar lebih efisien (misalnya: buat tabel penghubung untuk Many-to-Many).
* Berikan penjelasan **sebelum dan sesudah optimasi** (perubahan apa yang dilakukan, dan alasannya).

---

### 4️⃣ Implementasi Database (MySQL)

* Buat database sesuai hasil ERD yang sudah dioptimasi.
* Gunakan **DDL (CREATE TABLE, PRIMARY KEY, FOREIGN KEY)** untuk membuat struktur database.
* Tambahkan minimal **5 data dummy** ke setiap tabel dengan **DML (INSERT INTO)**.
* Lakukan minimal **3 query SELECT** dengan kondisi berbeda (misalnya `WHERE`, `JOIN`, `ORDER BY`, `GROUP BY`).

📌 Lampirkan script SQL dalam bentuk file `.sql`.

---