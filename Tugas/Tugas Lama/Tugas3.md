## 🧩 **Soal Latihan: JOIN Query**

### **Tabel yang digunakan**

1. **Tabel `karyawan`**

   | Kolom           | Tipe Data     | Keterangan                     |
   | --------------- | ------------- | ------------------------------ |
   | `id_karyawan`   | INT           | Primary Key                    |
   | `nama`          | VARCHAR(50)   | Nama karyawan                  |
   | `jabatan`       | VARCHAR(30)   | Posisi karyawan                |
   | `gaji`          | DECIMAL(10,2) | Gaji bulanan                   |
   | `id_departemen` | INT           | Kode departemen tempat bekerja |

2. **Tabel `departemen`**

   | Kolom               | Tipe Data   | Keterangan             |
   | ------------------- | ----------- | ---------------------- |
   | `id_departemen`     | INT         | Primary Key            |
   | `nama_departemen`   | VARCHAR(50) | Nama departemen        |
   | `lokasi`            | VARCHAR(50) | Lokasi kantor          |
   | `kepala_departemen` | VARCHAR(50) | Nama kepala departemen |

---

### **A. Dasar (Pemahaman Konsep)**

1. Jelaskan dengan singkat perbedaan antara:

   * `INNER JOIN`
   * `LEFT JOIN`
   * `RIGHT JOIN`
   * `FULL JOIN`

2. Apa fungsi dari klausa `ON` dalam perintah JOIN?

3. Apakah penggabungan tabel bisa dilakukan tanpa perintah `JOIN`?
   Jelaskan dengan contoh sederhana menggunakan tabel `karyawan` dan `departemen`.

---

### **B. Praktik (Query Dasar)**

4. **Tampilkan nama karyawan, jabatan, dan nama departemen tempatnya bekerja.**

   > (Gunakan `INNER JOIN`.)

---

5. **Tampilkan semua karyawan beserta nama departemennya, termasuk karyawan yang belum ditempatkan di departemen mana pun.**

   > (Gunakan `LEFT JOIN`.)

---

6. **Tampilkan semua departemen beserta nama karyawannya, termasuk departemen yang belum memiliki karyawan.**

   > (Gunakan `RIGHT JOIN`.)

---

7. **Tampilkan semua data karyawan dan departemen, baik yang memiliki pasangan data maupun tidak.**

   > (Gunakan `FULL JOIN` atau gabungan `LEFT JOIN` + `RIGHT JOIN`.)

---

8. **Tampilkan nama karyawan dan nama departemennya yang berlokasi di 'Jakarta'.**

---

9. **Tampilkan karyawan dengan gaji di atas 8.000.000 dari departemen yang berlokasi di 'Surabaya'.**

---

10. **Tampilkan semua departemen beserta nama kepala departemen, urutkan berdasarkan nama departemen secara alfabetis.**

---

### **C. Tantangan (Analisis dan Gabungan)**

11. Buat query untuk menampilkan:

* Nama karyawan
* Jabatan
* Nama departemen
* Kepala departemen
  Hanya untuk karyawan yang **gajinya lebih dari 10.000.000**.

---

12. Buat query untuk menampilkan **jumlah karyawan per departemen** berdasarkan tabel `karyawan`, lalu gabungkan dengan `departemen` agar menampilkan juga **nama kepala departemen dan lokasi**.

---

13. Buat query untuk menampilkan **karyawan dengan jabatan 'Manager'** dari **departemen yang berlokasi di Jakarta atau Bandung**.

---

14. Buat query untuk menampilkan **departemen yang belum memiliki karyawan sama sekali.**

---

15. Buat query untuk menampilkan **karyawan beserta lama bekerja perusahaan** dengan menghitung selisih antara **tahun sekarang dan tahun masuk** (tambahkan kolom `tahun_masuk` di tabel `karyawan`).

---


**Nb : Silahkan lakukan dummy data**