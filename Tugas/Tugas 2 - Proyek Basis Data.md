# Tugas 2 — Proyek Perancangan dan Implementasi Basis Data

**Mata kuliah:** Basis Data (SI2514010)
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.
**Bentuk tugas:** Proyek terintegrasi
**Metode penilaian:** Pemeriksaan proyek, demonstrasi, dan interview individual

## Implementasi Basis Data Menggunakan SQL

### Tujuan Tugas

Mahasiswa mampu mengimplementasikan hasil perancangan basis data pada **Tugas 1** ke dalam Database Management System (DBMS) menggunakan SQL.

Pada tugas ini, ERD yang telah dibuat sebelumnya digunakan sebagai dasar untuk membuat struktur basis data menggunakan **Data Definition Language (DDL)** dan melakukan pengelolaan data menggunakan **Data Manipulation Language (DML)**.

---

## Studi Kasus

Gunakan **studi kasus dan ERD hasil Tugas 1** yang telah dibuat berdasarkan hasil observasi dan wawancara dengan client/mitra.

Lakukan evaluasi kembali terhadap ERD sebelum diimplementasikan. Apabila ditemukan kesalahan pada entitas, atribut, Primary Key, Foreign Key, relasi, atau kardinalitas, mahasiswa diperbolehkan melakukan perbaikan dengan memberikan penjelasan mengenai perubahan yang dilakukan.

---

# Instruksi Tugas

## 1. Implementasi Basis Data

Implementasikan ERD hasil Tugas 1 ke dalam DBMS yang telah ditentukan.

Setiap entitas pada ERD harus diterjemahkan menjadi tabel yang sesuai dengan memperhatikan:

* Nama tabel
* Nama kolom/atribut
* Tipe data
* Panjang data jika diperlukan
* Primary Key (PK)
* Foreign Key (FK)
* `NOT NULL`
* `UNIQUE`
* `DEFAULT`
* Constraint lain yang diperlukan

Struktur tabel yang dibuat harus konsisten dengan ERD dan kebutuhan client yang telah dianalisis pada Tugas 1.

---

# 2. Data Definition Language (DDL)

Dokumentasikan seluruh perintah **DDL** yang digunakan untuk membangun struktur basis data.

Minimal mencakup:

### a. CREATE DATABASE

Buat database sesuai dengan studi kasus yang dipilih.

### b. CREATE TABLE

Buat seluruh tabel berdasarkan entitas yang terdapat pada ERD.

Setiap tabel harus memiliki **Primary Key** dan menggunakan **Foreign Key** apabila memiliki hubungan dengan tabel lainnya.

### c. ALTER TABLE

Lakukan minimal satu perubahan struktur tabel menggunakan `ALTER TABLE`.

Perubahan dapat berupa penambahan kolom, perubahan constraint, atau perubahan lain yang relevan.

Mahasiswa harus menjelaskan **alasan perubahan tersebut**.

### d. Dokumentasi Struktur Database

Dokumentasikan hasil implementasi struktur database dan tunjukkan bahwa seluruh tabel, Primary Key, Foreign Key, serta relasi telah berhasil dibuat.

---

# 3. Data Manipulation Language (DML)

Setelah struktur database selesai dibuat, lakukan pengelolaan data menggunakan **DML**.

## a. INSERT

Masukkan data ke dalam seluruh tabel.

Data yang dimasukkan sebaiknya menggunakan atau menyesuaikan **data yang diperoleh dari client/mitra pada Tugas 1**.

Apabila data nyata tidak mencukupi, mahasiswa diperbolehkan menggunakan data tambahan/dummy yang masih sesuai dengan karakteristik studi kasus.

Setiap tabel harus memiliki data yang cukup untuk menunjukkan hubungan antar tabel.

## b. SELECT

Buat beberapa query untuk menampilkan informasi dari database.

Query tidak hanya menampilkan seluruh isi tabel, tetapi harus dapat menjawab kebutuhan informasi client.

Contoh:

> Client ingin mengetahui daftar produk yang memiliki stok kurang dari 10.

> Client ingin mengetahui seluruh transaksi yang dilakukan pada periode tertentu.

> Client ingin mengetahui produk yang termasuk dalam kategori tertentu.

Setiap query harus disertai dengan **kebutuhan informasi yang ingin dijawab**.

## c. UPDATE

Lakukan perubahan terhadap data yang telah tersimpan menggunakan perintah `UPDATE`.

Jelaskan kondisi yang menyebabkan data tersebut perlu diperbarui.

Contoh:

> Harga suatu produk mengalami perubahan sehingga data harga pada database harus diperbarui.

## d. DELETE

Lakukan penghapusan data menggunakan perintah `DELETE`.

Jelaskan alasan data tersebut dapat atau perlu dihapus serta perhatikan hubungan data dengan tabel lainnya.

---

# 4. Query Antar Tabel

Buat query yang melibatkan **minimal dua tabel yang saling berelasi** menggunakan `JOIN`.

Query harus dibuat berdasarkan kebutuhan informasi pada studi kasus, bukan hanya untuk menunjukkan penggunaan sintaks SQL.

Contoh kebutuhan:

> Client ingin melihat nama pelanggan beserta transaksi yang pernah dilakukan.

Mahasiswa harus menentukan tabel mana yang perlu dihubungkan untuk menghasilkan informasi tersebut.

---

# 5. Dokumentasi DDL dan DML

Setiap proses implementasi harus didokumentasikan dengan format:

**Kebutuhan/Tujuan → Query SQL → Hasil Eksekusi → Penjelasan**

Contoh:

**Kebutuhan:**
Menampilkan produk yang memiliki stok kurang dari 10.

**Query SQL:**

```sql
SELECT nama_produk, stok
FROM produk
WHERE stok < 10;
```

**Hasil:**
Lampirkan screenshot atau hasil eksekusi query.

**Penjelasan:**
Query digunakan untuk membantu client mengetahui produk yang stoknya perlu segera ditambah.

Gunakan format dokumentasi tersebut untuk query-query penting yang dibuat.

---

# 6. Kesesuaian ERD dengan Implementasi

Bandingkan kembali **ERD pada Tugas 1 dengan database yang telah diimplementasikan**.

Pastikan:

* Setiap entitas telah menjadi tabel.
* Setiap atribut telah menjadi kolom yang sesuai.
* Primary Key telah diterapkan.
* Foreign Key telah diterapkan.
* Relasi antar tabel sesuai dengan ERD.
* Kardinalitas dapat direpresentasikan melalui struktur tabel.
* Relasi M:N telah diselesaikan menggunakan tabel penghubung.
* Tipe data sesuai dengan data yang akan disimpan.

Jika terdapat perubahan dari ERD Tugas 1, jelaskan perubahan dan alasannya.

---

# Hasil Akhir yang Dikumpulkan

Susun laporan Tugas 2 dengan urutan:

1. **Judul Studi Kasus**
2. **ERD Hasil Tugas 1**
3. **ERD Hasil Revisi** *(jika terdapat perubahan)*
4. **Skema/Struktur Tabel**
5. **Implementasi DDL**

   * CREATE DATABASE
   * CREATE TABLE
   * Primary Key dan Foreign Key
   * Constraint
   * ALTER TABLE
6. **Implementasi DML**

   * INSERT
   * SELECT
   * UPDATE
   * DELETE
7. **Implementasi Query Antar Tabel (JOIN)**
8. **Dokumentasi Hasil Eksekusi Query**
9. **Analisis Kesesuaian ERD dengan Database**
10. **Kesimpulan**
11. **Lampiran Script SQL Lengkap**

---

# Ketentuan Tugas

1. Tugas 2 **wajib menggunakan studi kasus dari Tugas 1**.
2. Database yang dibuat harus berdasarkan ERD hasil analisis kebutuhan client.
3. Seluruh tabel harus memiliki Primary Key.
4. Foreign Key harus digunakan pada tabel yang memiliki hubungan.
5. Data yang digunakan diutamakan berasal dari hasil pengumpulan data pada Tugas 1.
6. Setiap penggunaan DDL dan DML harus didokumentasikan.
7. Query `SELECT` dan `JOIN` harus memiliki tujuan yang berkaitan dengan kebutuhan informasi client.
8. Mahasiswa harus mampu menjelaskan hubungan antara **kebutuhan client → ERD → tabel → SQL → informasi yang dihasilkan**.

### Alur Tugas

**Hasil Tugas 1 → ERD → Skema Relasional → Implementasi Tabel → DDL → Pengisian Data → DML → Query Kebutuhan Client → Dokumentasi**
