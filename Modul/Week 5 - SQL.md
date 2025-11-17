# Week 5

## 📌 SQL Dasar & Manipulasi Data (MySQL)

**Tujuan:** Dapat membuat, membaca, memperbarui, dan menghapus data (CRUD).

---

### 1️⃣ DDL (Data Definition Language)

Digunakan untuk mendefinisikan struktur database dan tabel:

* `CREATE` → Membuat database atau tabel
* `ALTER` → Mengubah struktur tabel (tambah/ubah/hapus kolom)
* `DROP` → Menghapus database atau tabel

---

### 2️⃣ DML (Data Manipulation Language)

Digunakan untuk manipulasi data dalam tabel:

* `INSERT` → Menambahkan data baru
* `UPDATE` → Memperbarui data yang sudah ada
* `DELETE` → Menghapus data

---

### 3️⃣ SELECT Dasar

Digunakan untuk membaca data dari tabel:

* `SELECT *` → Menampilkan semua data
* `WHERE` → Menyaring data berdasarkan kondisi
* `ORDER BY` → Mengurutkan data (ASC/DESC)
* `LIMIT` → Membatasi jumlah data yang ditampilkan

---

### 4️⃣ Operator & Fungsi

**Operator:**

* `=` (sama dengan)
* `<>` atau `!=` (tidak sama dengan)
* `LIKE` (pencarian pola)
* `IN` (cek dalam himpunan nilai)
* `BETWEEN` (cek dalam rentang nilai)

**Fungsi Agregasi:**

* `COUNT()` → Menghitung jumlah baris
* `SUM()` → Menjumlahkan nilai
* `AVG()` → Menghitung rata-rata

---

### 5️⃣ Kunci Utama & Relasi

* **Primary Key (PK)** → Identitas unik tiap baris dalam tabel
* **Foreign Key (FK)** → Kunci untuk menghubungkan tabel lain
* **One-to-Many** → Satu data di tabel A terkait dengan banyak data di tabel B
* **Many-to-Many** → Banyak data di tabel A terkait dengan banyak data di tabel B (melalui tabel penghubung)

---

## 📌 Tipe Data dalam MySQL

---

### 1️⃣ Tipe Data Number (Angka)

| Tipe Data         | Keterangan                       | Contoh Nilai   |
| ----------------- | -------------------------------- | -------------- |
| `TINYINT`         | Bilangan kecil (-128 s/d 127)    | `10`           |
| `SMALLINT`        | Bilangan bulat kecil             | `123`          |
| `INT` / `INTEGER` | Bilangan bulat standar           | `2025`         |
| `BIGINT`          | Bilangan bulat besar             | `9999999999`   |
| `DECIMAL(p,s)`    | Bilangan desimal dengan presisi  | `1234.56`      |
| `FLOAT`           | Bilangan pecahan presisi tunggal | `3.14`         |
| `DOUBLE`          | Bilangan pecahan presisi ganda   | `2.718281828`  |
| `AUTO_INCREMENT`  | Auto-increment integer           | `1, 2, 3, ...` |

**Contoh:**

```sql
CREATE TABLE produk (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(50),
  harga DECIMAL(10,2),
  stok INT
);
```

---

### 2️⃣ Tipe Data String (Teks & Karakter)

| Tipe Data    | Keterangan                            | Contoh Nilai            |
| ------------ | ------------------------------------- | ----------------------- |
| `CHAR(n)`    | Teks tetap sepanjang n karakter       | `'ABC  '`               |
| `VARCHAR(n)` | Teks dengan panjang maksimum n        | `'Laptop'`              |
| `TEXT`       | Teks panjang (hingga 65.535 karakter) | `'Deskripsi produk...'` |

**Contoh:**

```sql
CREATE TABLE user_account (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(30) NOT NULL,
  password TEXT NOT NULL
);
```

---

### 3️⃣ Tipe Data Date dan Time

| Tipe Data   | Keterangan                       | Contoh Nilai          |
| ----------- | -------------------------------- | --------------------- |
| `DATE`      | Menyimpan tanggal                | `2025-09-13`          |
| `TIME`      | Menyimpan waktu                  | `14:30:00`            |
| `DATETIME`  | Menyimpan tanggal & waktu        | `2025-09-13 14:30:00` |
| `TIMESTAMP` | Tanggal & waktu (zona waktu UTC) | `2025-09-13 14:30:00` |

**Contoh:**

```sql
CREATE TABLE log_akses (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  waktu_login TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

---

### 4️⃣ Tipe Data Boolean

MySQL tidak punya tipe `BOOLEAN` murni.

* Biasanya menggunakan `TINYINT(1)` → `0 = FALSE`, `1 = TRUE`.

**Contoh:**

```sql
CREATE TABLE siswa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nama VARCHAR(50),
  aktif TINYINT(1) DEFAULT 1
);
```

---

### 5️⃣ Tipe Data Enum

ENUM digunakan untuk membatasi nilai ke daftar tertentu.

**Contoh:**

```sql
CREATE TABLE pesanan (
  id INT AUTO_INCREMENT PRIMARY KEY,
  produk VARCHAR(50),
  status ENUM('pending','proses','selesai','batal') DEFAULT 'pending'
);
```

---

### 6️⃣ Tipe Data JSON (MySQL 5.7+)

MySQL tidak punya `ARRAY` seperti PostgreSQL, tetapi mendukung **JSON**.

**Contoh:**

```sql
CREATE TABLE mahasiswa_json (
  id INT AUTO_INCREMENT PRIMARY KEY,
  data JSON
);

INSERT INTO mahasiswa_json (data) VALUES
('{"nama": "Siti", "hobi": ["Menyanyi", "Menari", "Fotografi"]}');
```

👉 Query JSON di MySQL:

```sql
SELECT
  JSON_EXTRACT(data, '$.nama') AS nama,
  JSON_EXTRACT(data, '$.hobi[0]') AS hobi_pertama
FROM mahasiswa_json;
```

---

### 📊 Perbedaan PostgreSQL vs MySQL

| Fitur     | PostgreSQL        | MySQL                                |
| --------- | ----------------- | ------------------------------------ |
| `ARRAY`   | ✅ Didukung (`{}`) | ❌ Tidak ada (gunakan JSON)           |
| `JSONB`   | ✅ Binary JSON     | ❌ Hanya `JSON` (text-based storage)  |
| `UUID`    | ✅ Native UUID     | ❌ Pakai `CHAR(36)` atau `BINARY(16)` |
| `BOOLEAN` | ✅ Ada             | ❌ Alias `TINYINT(1)`                 |

---

👉 Jadi di MySQL:

* Gunakan **JSON** untuk array/struktur kompleks.
* Gunakan **ENUM** untuk nilai terbatas.
* Gunakan **TINYINT(1)** untuk Boolean.

---