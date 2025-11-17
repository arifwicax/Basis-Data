# Normalisasi
## 🧩 **Bentuk Normal Pertama (1NF – First Normal Form)**

### 🎯 **Tujuan:**

Agar setiap kolom dalam tabel berisi **satu nilai saja (tidak ganda)** dan setiap baris bisa **dibedakan secara unik** dengan **primary key**.
Jadi, tabel harus rapi, tidak ada nilai yang bercabang atau ditumpuk dalam satu kolom.

---

## 🪜 **Langkah-langkah dan Penjelasan Sederhana**

### 1️⃣ **Pastikan setiap atribut bernilai tunggal (atomic)**

Artinya:

* Dalam satu sel tabel, **tidak boleh ada lebih dari satu nilai**.
* Tidak boleh ada data seperti “Data A, Data B” di dalam satu kolom.

📘 **Contoh belum 1NF:**

| NIM | Nama | Hobi             |
| --- | ---- | ---------------- |
| 101 | Andi | Membaca, Menulis |

👉 Kolom **Hobi** berisi dua nilai ("Membaca" dan "Menulis").
Ini **tidak memenuhi 1NF**, karena satu sel seharusnya berisi **satu nilai saja**.

✅ **Perbaikan (jadi 1NF):**

| NIM | Nama | Hobi    |
| --- | ---- | ------- |
| 101 | Andi | Membaca |
| 101 | Andi | Menulis |

Sekarang setiap baris berisi **satu nilai per kolom** — sudah **atomic** ✅

---

### 2️⃣ **Tambahkan atribut yang diperlukan, terutama calon Primary Key**

Tujuannya agar setiap baris **unik dan bisa dibedakan**.

📘 Contoh:
Kalau sebelumnya tabel tidak punya pembeda unik seperti ID, maka tambahkan kolom **ID** atau **kode unik**.

| ID | NIM | Nama | Hobi    |
| -- | --- | ---- | ------- |
| 1  | 101 | Andi | Membaca |
| 2  | 101 | Andi | Menulis |

Sekarang kita bisa tahu **baris mana** yang spesifik karena ada **ID** sebagai primary key.

---

### 3️⃣ **Hapus atribut yang tidak diperlukan (hindari redudansi)**

Redudansi = pengulangan data yang tidak perlu, yang bisa bikin tabel besar dan sulit dikelola.

📘 Contoh belum efisien:

| NIM | Nama | Jurusan | DosenWali | Hobi    |
| --- | ---- | ------- | --------- | ------- |
| 101 | Andi | SI      | Bu Sinta  | Membaca |
| 101 | Andi | SI      | Bu Sinta  | Menulis |

👉 Di sini **Nama, Jurusan, dan DosenWali** berulang-ulang muncul untuk NIM yang sama.
Kalau dibiarkan, nanti susah kalau ada perubahan (misalnya nama dosen wali ganti — harus ubah di banyak baris).

✅ **Solusi:** pisahkan menjadi tabel-tabel kecil sesuai kelompok data.

---

### 💡 **Hasil Normalisasi ke-1 (1NF):**

#### 🧱 Tabel Mahasiswa

| NIM | Nama | Jurusan | DosenWali |
| --- | ---- | ------- | --------- |
| 101 | Andi | SI      | Bu Sinta  |

#### 🧱 Tabel Hobi

| NIM | Hobi    |
| --- | ------- |
| 101 | Membaca |
| 101 | Menulis |

---

## 🧠 **Kesimpulan Mudah**

| Prinsip                | Penjelasan                                                         |
| ---------------------- | ------------------------------------------------------------------ |
| 1️⃣ Nilai tunggal      | Setiap kolom hanya boleh punya **satu nilai**, bukan daftar nilai. |
| 2️⃣ Ada primary key    | Setiap baris harus **unik** dan bisa dibedakan.                    |
| 3️⃣ Hindari data ganda | Hilangkan atribut yang berulang agar data lebih rapi dan efisien.  |

---

### 🎓 **Inti Singkatnya:**

> Bentuk Normal Pertama (1NF) memastikan bahwa tabel berisi **data yang terstruktur, rapi, dan tidak ganda**, sehingga mudah diproses dan diolah oleh sistem database.

---

## 🧩 **Bentuk Normalisasi Ke-2 (2NF – Second Normal Form)**

### 🎯 Tujuan:

Menghilangkan **ketergantungan sebagian** (partial dependency), yaitu ketika ada kolom (atribut) yang hanya tergantung pada **sebagian** dari primary key gabungan, bukan pada seluruhnya.

---

## 🪜 **Langkah-langkah dan Penjelasan Mudah**

### 1. **Cari atribut yang bisa menjadi Primary Key**

Pertama-tama, tentukan kolom mana yang menjadi **pembeda unik** dari setiap baris (record).
Kalau tabel punya lebih dari satu kolom kunci (composite key), perhatikan baik-baik hubungan antar kolom lainnya.

📘 **Contoh:**
Misalkan tabel berikut 👇

| NIM | KodeMK | Nama | NamaMK     | Nilai |
| --- | ------ | ---- | ---------- | ----- |
| 101 | MK01   | Andi | Basis Data | 90    |
| 101 | MK02   | Andi | Jaringan   | 80    |

👉 Primary key gabungan di sini adalah **(NIM, KodeMK)** karena kombinasi keduanya unik untuk setiap baris.

---

### 2. **Evaluasi atribut lain**

Sekarang, lihat kolom selain primary key:

* Apakah kolom tersebut bergantung pada **seluruh** primary key?
* Atau hanya pada **bagian dari** primary key?

📍 Jika hanya bergantung pada sebagian kunci → **itu masalah di 2NF**.

---

### 3. **Jika atribut bernilai tunggal dan bergantung penuh pada primary key → tetap dalam satu tabel**

Contoh:

* Kolom **Nilai** bergantung pada **(NIM, KodeMK)** → ini benar, karena nilai tertentu hanya bisa diketahui dari kombinasi mahasiswa dan mata kuliah tertentu.
  Jadi kolom **Nilai** boleh tetap di tabel itu.

---

### 4. **Jika atribut bernilai jamak atau hanya bergantung pada sebagian kunci → pisahkan ke tabel baru**

Contoh:

* Kolom **Nama** hanya bergantung pada **NIM** (tidak perlu KodeMK).
* Kolom **NamaMK** hanya bergantung pada **KodeMK** (tidak perlu NIM).

Berarti harus dipisahkan:

📘 **Hasil dekomposisi:**

* **Tabel Mahasiswa**

  | NIM | Nama |
  | --- | ---- |
  | 101 | Andi |

* **Tabel MataKuliah**

  | KodeMK | NamaMK     |
  | ------ | ---------- |
  | MK01   | Basis Data |
  | MK02   | Jaringan   |

* **Tabel Nilai**

  | NIM | KodeMK | Nilai |
  | --- | ------ | ----- |
  | 101 | MK01   | 90    |
  | 101 | MK02   | 80    |

---

## 💡 **Kesimpulan Sederhana:**

| Langkah                                        | Penjelasan Mudah                                    |
| ---------------------------------------------- | --------------------------------------------------- |
| 1️⃣ Cari primary key                           | Tentukan kolom unik yang mewakili setiap baris data |
| 2️⃣ Evaluasi kolom lain                        | Cek apakah kolom lain bergantung penuh pada kunci   |
| 3️⃣ Kalau bergantung penuh → tetap             | Simpan dalam tabel yang sama                        |
| 4️⃣ Kalau hanya bergantung sebagian → pisahkan | Buat tabel baru agar tidak ada duplikasi data       |

---

🧠 **Intinya:**

> Bentuk Normal ke-2 (2NF) memastikan **setiap kolom non-key bergantung sepenuhnya pada seluruh primary key**, bukan hanya sebagian.
> Hasilnya: data jadi lebih rapi, tidak duplikat, dan mudah di-update tanpa inkonsistensi.

---

## 🧩 **Bentuk Normal Ketiga (3NF – Third Normal Form)**

### 🎯 **Tujuan:**

Agar **setiap kolom non-kunci hanya bergantung langsung pada kunci utama (primary key)** — bukan pada kolom lain.
Dengan kata lain, **hilangkan ketergantungan tidak langsung (transitif)** antar kolom non-key.

---

## 💡 **1. Apa Itu Ketergantungan Transitif?**

Ketergantungan **transitif** terjadi ketika ada hubungan seperti ini:

> A (Primary Key) → B (Non-key) → C (Non-key)

Artinya:

* Kolom **C** tidak langsung bergantung pada **Primary Key (A)**,
  tapi bergantung pada **kolom lain (B)** yang juga bukan kunci utama.

🔎 Ini membuat data bisa **tidak konsisten** dan menyebabkan **redudansi** (pengulangan data).

---

## 📘 **2. Contoh Kasus Sebelum 3NF**

Misalkan ada tabel mahasiswa berikut:

| NIM | Nama | KodeJurusan | NamaJurusan        |
| --- | ---- | ----------- | ------------------ |
| 101 | Andi | SI          | Sistem Informasi   |
| 102 | Budi | TI          | Teknik Informatika |
| 103 | Cici | SI          | Sistem Informasi   |

---

### ⚠️ **Masalah:**

* Primary key: `NIM`
* `NamaJurusan` bergantung pada `KodeJurusan`, **bukan langsung ke NIM**.
  Jadi ada **ketergantungan transitif**:
  `NIM → KodeJurusan → NamaJurusan`.


Akibatnya:

* Kalau nama jurusan berubah (misal “Sistem Informasi” jadi “Sains Informasi”),
  maka kita harus ubah **banyak baris**.
* Ini bisa menimbulkan **inkonsistensi data**.

---

## 🧱 **3. Cara Memperbaiki ke 3NF**

### 🔹 Langkah 1 – Identifikasi ketergantungan transitif

Cari kolom non-key yang tergantung pada kolom non-key lain.
Dalam contoh ini:

> `NamaJurusan` tergantung pada `KodeJurusan` (bukan pada `NIM`).

### 🔹 Langkah 2 – Pisahkan tabel

Buat tabel baru untuk atribut yang memiliki hubungan langsung tersebut.

---

## ✅ **Hasil Setelah Normalisasi ke-3:**

### 🧱 **Tabel Mahasiswa**

| NIM | Nama | KodeJurusan |
| --- | ---- | ----------- |
| 101 | Andi | SI          |
| 102 | Budi | TI          |
| 103 | Cici | SI          |

### 🧱 **Tabel Jurusan**

| KodeJurusan | NamaJurusan        |
| ----------- | ------------------ |
| SI          | Sistem Informasi   |
| TI          | Teknik Informatika |

---

Sekarang:

* `NamaJurusan` **tidak lagi tergantung pada NIM**,
  tapi **langsung pada KodeJurusan** (yang jadi primary key di tabel Jurusan).
* Data jadi **lebih efisien, tidak berulang, dan mudah diubah**.

---

## 📊 **4. Kesimpulan Sederhana**

| Aspek               | Penjelasan                                                               |
| ------------------- | ------------------------------------------------------------------------ |
| **Fokus utama**     | Menghilangkan ketergantungan tidak langsung antar kolom non-key.         |
| **Ciri tabel 3NF**  | Setiap kolom non-key hanya bergantung pada primary key.                  |
| **Manfaat**         | Menghindari redudansi, menjaga konsistensi, dan mempermudah update data. |
| **Kapan digunakan** | Setelah tabel memenuhi bentuk 2NF.                                       |

---

## 🧠 **Analogi Sederhana**

Bayangkan kamu punya data seperti ini:

> Mahasiswa → Jurusan → Nama Jurusan

Jika "Nama Jurusan" tergantung pada "Jurusan",
berarti ia tidak langsung tergantung pada "Mahasiswa".
Nah, bentuk normal ke-3 **memaksa kita untuk memisahkan** informasi jurusan ke tabel tersendiri agar data tetap **logis dan efisien**.

---

### 🎓 **Inti Singkatnya:**

> Bentuk Normal Ketiga (3NF) memastikan bahwa **semua kolom non-kunci hanya bergantung langsung pada primary key**, bukan pada kolom non-key lain, sehingga data menjadi **lebih konsisten dan bebas redudansi**.

---
