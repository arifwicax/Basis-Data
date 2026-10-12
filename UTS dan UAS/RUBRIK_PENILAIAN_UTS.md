# RUBRIK PENILAIAN UTS BASIS DATA

**Semester:** Gasal 2025/2026
**Program Studi:** Sistem Informasi
**Mata Kuliah:** Basis Data A, B, dan C

## A. Ketentuan umum

Nilai akhir UTS adalah jumlah skor Soal 1–5 dengan total **100 poin**. Penilaian berfokus pada ketepatan konsep, kelengkapan rancangan, konsistensi antarbagian, dan kemampuan menerapkan SQL.

Jika jawaban menggunakan nama entitas, atribut, atau struktur tabel yang berbeda dari contoh jawaban tetapi tetap logis, konsisten, dan memenuhi kebutuhan soal, jawaban tetap memperoleh skor sesuai tingkat pencapaiannya.

### Kriteria kualitas jawaban

| Tingkat pencapaian | Deskripsi                                                                                           |
| ------------------ | --------------------------------------------------------------------------------------------------- |
| Sangat baik        | Tepat, lengkap, konsisten, dan disertai alasan/implementasi yang dapat digunakan.                   |
| Baik               | Sebagian besar tepat; terdapat kekurangan kecil yang tidak mengubah rancangan utama.                |
| Cukup              | Memahami konsep dasar, tetapi terdapat beberapa kesalahan atau komponen penting yang belum lengkap. |
| Kurang             | Jawaban sangat terbatas, tidak konsisten, atau menunjukkan miskonsepsi utama.                       |
| Tidak menjawab     | Tidak ada jawaban atau jawaban tidak relevan.                                                       |

## B. Rubrik per soal

### Soal 1 — Perancangan ERD (20 poin)

| Kriteria                                                                                   |         Skor | Catatan koreksi                                                                                            |
| ------------------------------------------------------------------------------------------ | -----------: | ---------------------------------------------------------------------------------------------------------- |
| Entitas utama dan entitas/asosiasi yang diperlukan teridentifikasi lengkap sesuai skenario |            8 | Kurangi secara proporsional jika entitas penting hilang atau relasi M:N tidak memiliki entitas penghubung. |
| Atribut penting dan primary key setiap entitas ditentukan dengan tepat                     |            4 | Nilai atribut dan key yang benar; penamaan berbeda diterima jika maknanya jelas.                           |
| Hubungan, kardinalitas, dan partisipasi ditentukan dengan tepat                            |            6 | Diagram tanpa kardinalitas atau partisipasi tidak mendapat skor penuh.                                     |
| Foreign key dan atribut tambahan konsisten dengan ERD                                      |            2 | Nilai berdasarkan kecocokan FK, atribut, dan hubungan.                                                     |
| **Total**                                                                            | **20** | **Skor parsial diberikan berdasarkan komponen yang benar.**                                          |

**Indikator khusus:**

- **Basis Data A:** donatur, donasi, proyek, pegawai, serta asosiasi alokasi donasi–proyek.
- **Basis Data B:** anggota, buku, petugas, peminjaman, serta detail/asosiasi buku dalam peminjaman.
- **Basis Data C:** pelanggan, lapangan, petugas, reservasi, dan pembayaran.

Skor penuh diberikan apabila hubungan banyak-ke-banyak dipecah menggunakan entitas/asosiasi dan batas kardinalitas dijelaskan dengan benar.

### Soal 2 — Entitas kuat, entitas lemah, dan key (15 poin)

| Kriteria                                                         |         Skor | Catatan koreksi                                                                                                      |
| ---------------------------------------------------------------- | -----------: | -------------------------------------------------------------------------------------------------------------------- |
| Identifikasi entitas kuat/lemah beserta alasan ketergantungannya |            5 | Entitas lemah harus dijelaskan ketergantungannya pada entitas induk.                                                 |
| Penentuan primary key, foreign key, dan alternate key/UNIQUE     |            6 | Key unik dalam soal harus ditandai sebagai alternate key atau`UNIQUE`; PK komposit diutamakan untuk entitas lemah. |
| Hubungan dan kardinalitas antarentitas                           |            4 | Nilai relasi dan pola kardinalitas 1:N secara tepat.                                                                 |
| **Total**                                                  | **15** | **Kesalahan identifikasi tidak menghapus skor key/relasi jika bagian tersebut benar.**                         |

**Indikator khusus:**

- **A:** Pelanggan dan Pesanan merupakan entitas kuat; Item_Pesanan bergantung pada Pesanan.
- **B:** Pasien dan Kunjungan merupakan entitas kuat; Detail_Resep bergantung pada Kunjungan.
- **C:** Pelanggan dan Pengiriman merupakan entitas kuat; Detail_Paket bergantung pada Pengiriman.

Entitas lemah harus memiliki identitas parsial atau nomor urut yang dipadukan dengan foreign key entitas induk sebagai primary key komposit. Key yang dinyatakan unik dalam soal harus diberi alternate key atau constraint `UNIQUE`.

### Soal 3 — Implementasi ERD dengan DDL MySQL (30 poin)

| Kriteria                                                                          |         Skor | Catatan koreksi                                                                        |
| --------------------------------------------------------------------------------- | -----------: | -------------------------------------------------------------------------------------- |
| Struktur tabel dan hubungan sesuai skenario/ERD                                   |           10 | Kurangi proporsional untuk tabel atau relasi utama yang hilang.                        |
| Primary key, foreign key, dan relasi antartabel tepat                             |            8 | FK yang hilang/salah mengurangi skor relasi yang terdampak.                            |
| Tipe data dan atribut sesuai kebutuhan                                            |            5 | Periksa atribut wajib, tanggal, nominal, status, dan tipe data.                        |
| `NOT NULL`, `UNIQUE`, `CHECK`, `DEFAULT`, atau constraint relevan lainnya |            5 | Nilai constraint yang relevan dan tidak bertentangan dengan skenario.                  |
| Sintaks, urutan pembuatan tabel, dan DDL dapat dijalankan                         |            2 | DDL yang tidak berjalan hanya mengurangi bagian ini jika struktur dan key tetap benar. |
| **Total**                                                                   | **30** | **Kesalahan sintaks kecil tidak menghapus skor struktur yang sudah benar.**      |

**Pengurangan yang disarankan:** kesalahan sintaks kecil yang mudah diperbaiki maksimal dikurangi 1 poin; foreign key yang hilang atau salah maksimal dikurangi 3 poin per relasi; tabel/relasi utama yang tidak dibuat dinilai pada kriteria struktur dan dapat mengurangi hingga 10 poin.

**Indikator khusus:**

- **A:** donatur, donasi, pegawai, proyek, dan alokasi donasi.
- **B:** peserta, instruktur, kursus, pendaftaran, dan modul kursus.
- **C:** penyewa, kendaraan, pegawai, dan transaksi sewa.

### Soal 4 — Normalisasi hingga 3NF (25 poin)

| Kriteria                                                            |         Skor | Catatan koreksi                                                                 |
| ------------------------------------------------------------------- | -----------: | ------------------------------------------------------------------------------- |
| Penjelasan dan penerapan 1NF: nilai atomik serta identifikasi kunci |            4 | Harus menunjukkan nilai atomik dan kunci awal.                                  |
| Penghilangan ketergantungan parsial pada 2NF                        |            6 | Atribut yang hanya bergantung pada sebagian PK komposit harus dipisahkan.       |
| Penghilangan ketergantungan transitif pada 3NF                      |            6 | Data master seperti pelanggan, pemasok, produk, pasien, atau dokter dipisahkan. |
| Tabel hasil normalisasi sampai 3NF lengkap dan logis                |            5 | Daftar tabel tanpa penjelasan proses tidak mendapat skor proses penuh.          |
| Primary key dan foreign key setiap tabel                            |            4 | Periksa PK setiap tabel dan FK antartabel.                                      |
| **Total**                                                     | **25** | **Atribut turunan boleh disimpan jika konsistensinya dijelaskan.**        |

**Catatan penilaian:** kolom turunan seperti `subtotal`, `total_item`, atau nilai perhitungan dapat disimpan jika konsistensinya dijelaskan; alternatif yang menghitungnya saat query juga dapat diterima.

### Soal 5 — SQL JOIN (10 poin)

| Kriteria                                                        |         Skor | Catatan koreksi                                                              |
| --------------------------------------------------------------- | -----------: | ---------------------------------------------------------------------------- |
| `INNER JOIN`, kondisi join, dan filter status tepat           |            4 | Berikan skor parsial jika hanya join atau filter yang benar.                 |
| `LEFT JOIN`, fungsi agregat (`MAX`), dan `GROUP BY` tepat |            4 | Periksa penggunaan`LEFT JOIN`, `MAX`, dan pengelompokan.                 |
| Kolom output sesuai permintaan                                  |            1 | Alias dan urutan kolom berbeda tetap diterima.                               |
| Data tanpa transaksi tetap muncul dengan nilai`NULL`          |            1 | Tidak diberikan jika`LEFT JOIN` diganti `INNER JOIN`.                    |
| **Total**                                                 | **10** | **Query dinilai dari hasil dan konsep, bukan kesamaan dengan contoh.** |

## C. Konversi nilai

| Rentang skor | Nilai huruf | Predikat      |
| -----------: | :---------: | ------------- |
|      85–100 |      A      | Sangat baik   |
|       75–84 |      B      | Baik          |
|       65–74 |      C      | Cukup         |
|       50–64 |      D      | Kurang        |
|        0–49 |      E      | Sangat kurang |

## D. Ketentuan umum saat memberi skor

1. Catatan koreksi pada setiap tabel menjadi acuan utama pemberian skor parsial.
2. Kesalahan yang sama akibat satu asumsi dasar tidak dikurangi berulang secara berlebihan.
3. Jika ERD dan SQL tidak konsisten, nilai masing-masing bagian tetap diberikan; pengurangan dilakukan pada kriteria konsistensi yang terdampak.
4. Jawaban dengan penamaan tabel, atribut, alias, atau notasi berbeda tetap diterima jika makna dan hasilnya benar.
5. Jawaban kosong atau tidak relevan memperoleh skor minimal atau nol pada kriteria yang bersangkutan.
6. Indikasi kerja sama atau penyalinan yang tidak diizinkan dicatat untuk ditindaklanjuti sesuai kebijakan akademik.
