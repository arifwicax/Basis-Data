
### Indikator Penilaian Tugas 2 – Implementasi SQL

| No. | Komponen Penilaian                       | Indikator                                                                                                                                   |          Bobot |
| --- | ---------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | -------------: |
| 1   | **Kesesuaian ERD dengan Database** | Struktur tabel sesuai ERD Tugas 1; entitas, atribut, PK, FK, dan relasi diterjemahkan dengan benar.                                         |  **10%** |
| 2   | **Implementasi DDL**               | Mampu membuat database dan tabel menggunakan`CREATE`; menentukan tipe data, PK, FK, constraint, serta menggunakan `ALTER` dengan tepat. |  **15%** |
| 3   | **Implementasi DML**               | Mampu menggunakan`INSERT`, `SELECT`, `UPDATE`, dan `DELETE` dengan benar serta menggunakan data yang sesuai dengan studi kasus.     |  **15%** |
| 4   | **Query Kebutuhan Client**         | Query mampu menghasilkan informasi yang dibutuhkan client, termasuk penggunaan kondisi, pengurutan, dan`JOIN` antar tabel.                |  **10%** |
| 5   | **Dokumentasi Implementasi**       | Dokumentasi tersusun dengan format kebutuhan/tujuan, query SQL, hasil eksekusi, dan penjelasan.                                             |  **10%** |
| 6   | **Interview / Pemahaman Individu** | Mampu menjelaskan, menjalankan, dan memodifikasi implementasi database secara langsung.                                                     |  **40%** |
|     | **TOTAL**                          |                                                                                                                                             | **100%** |

### Rubrik Interview Individu – 40%

| Indikator Interview                                                               |         Bobot |
| --------------------------------------------------------------------------------- | ------------: |
| Menjelaskan struktur tabel serta hubungan database dengan ERD                     |  **8%** |
| Menjelaskan dan menunjukkan fungsi PK, FK, tipe data, dan constraint              |  **8%** |
| Menjelaskan serta menjalankan perintah DDL                                        |  **6%** |
| Menjelaskan serta menjalankan perintah DML                                        |  **6%** |
| Menjalankan dan menjelaskan query`SELECT`/`JOIN` berdasarkan kebutuhan client |  **6%** |
| **Memodifikasi query secara langsung berdasarkan instruksi dosen**          |  **6%** |
| **Total Interview**                                                         | **40%** |

### Rubrik Penilaian Tugas 2

Skor akhir menggunakan rentang maksimum **90**. Rentang **66–76** digunakan apabila masih terdapat kekurangan yang cukup terlihat; rentang **76–86** hanya diberikan apabila pekerjaan sudah sesuai dan kekurangannya bersifat minor. Nilai komponen dihitung berdasarkan bobot pada tabel indikator penilaian.

| No. | Komponen Penilaian | 51–56 | 56–66 | 66–76 | 76–86 | 86–90 |
| ---: | --- | --- | --- | --- | --- | --- |
| 1 | **Kesesuaian ERD dengan Database** | Database tidak dibuat atau struktur tabel sama sekali tidak mengacu pada ERD Tugas 1. | Sebagian entitas sudah menjadi tabel, tetapi banyak atribut, PK, FK, atau relasi yang tidak sesuai ERD dan tidak ada penjelasan perubahan. | Struktur tabel cukup sesuai ERD, tetapi masih ada entitas, atribut, PK/FK, atau relasi yang belum diterjemahkan dengan tepat. | Struktur tabel sesuai ERD dengan kekurangan minor; perubahan dari ERD Tugas 1 sudah dijelaskan. | Seluruh entitas, atribut, PK, FK, dan relasi diterjemahkan dengan tepat; setiap perubahan dari ERD Tugas 1 dijelaskan beserta alasannya. |
| 2 | **Implementasi DDL** | Tidak ada perintah DDL atau database/tabel tidak dapat dibuat. | `CREATE DATABASE` dan `CREATE TABLE` dibuat, tetapi banyak tipe data, PK, FK, atau constraint yang salah; `ALTER TABLE` tidak ada. | Tabel dapat dibuat, tetapi masih ada kesalahan tipe data, constraint (`NOT NULL`, `UNIQUE`, `DEFAULT`), atau FK; `ALTER TABLE` dilakukan tetapi alasannya kurang jelas. | Seluruh tabel dibuat dengan PK dan FK yang benar; `ALTER TABLE` dilakukan dengan alasan yang jelas dan hanya memiliki kekurangan minor. | Database dan seluruh tabel dibuat rapi dan tepat; tipe data, PK, FK, dan constraint sesuai kebutuhan; `ALTER TABLE` dilengkapi alasan perubahan yang kuat. |
| 3 | **Implementasi DML** | Tidak ada perintah DML atau data tidak dapat dimasukkan ke tabel. | Data dimasukkan hanya sebagian tabel, tidak sesuai studi kasus, atau perintah `UPDATE`/`DELETE` tidak dijelaskan. | Data sudah dimasukkan ke sebagian besar tabel, tetapi belum cukup menunjukkan hubungan antartabel; penjelasan `UPDATE`/`DELETE` belum lengkap. | Seluruh tabel sudah terisi data yang relevan dengan studi kasus dan perintah `INSERT`, `UPDATE`, `DELETE` dijelaskan dengan kondisi yang jelas. | Data berasal dari hasil Tugas 1 atau data dummy yang realistis, cukup untuk menunjukkan relasi antartabel; seluruh perintah DML benar dan dijelaskan alasannya. |
| 4 | **Query Kebutuhan Client** | Tidak ada query `SELECT` atau query tidak berkaitan dengan kebutuhan client. | Query hanya menampilkan isi tabel tanpa kondisi, pengurutan, atau `JOIN`; kebutuhan informasi tidak jelas. | Query sudah menjawab kebutuhan client, tetapi `JOIN` atau kondisi (`WHERE`, `ORDER BY`) belum tepat. | Query menjawab kebutuhan client dengan `JOIN`, kondisi, dan pengurutan yang sesuai dengan kekurangan minor. | Query relevan dengan kebutuhan client, menggunakan `JOIN` antartabel, kondisi, dan pengurutan yang tepat; setiap query disertai kebutuhan informasinya. |
| 5 | **Dokumentasi Implementasi** | Dokumentasi tidak ada atau tidak mengikuti format yang ditentukan. | Dokumentasi tidak lengkap; hasil eksekusi tidak dilampirkan atau penjelasan sangat terbatas. | Format Kebutuhan → Query → Hasil → Penjelasan sudah digunakan, tetapi masih ada bagian yang kurang lengkap. | Dokumentasi lengkap dengan format yang ditentukan dan kekurangan minor pada hasil atau penjelasan. | Dokumentasi tersusun sistematis sesuai format, setiap query disertai hasil eksekusi (screenshot/output) dan penjelasan yang jelas, serta lampiran script SQL lengkap. |
| 6 | **Interview / Pemahaman Individu** | Tidak mampu menjelaskan, menjalankan, atau memodifikasi implementasi database. | Hanya mampu menjelaskan sebagian kecil implementasi; tidak mampu menjalankan atau memodifikasi query tanpa bantuan besar. | Mampu menjelaskan dan menjalankan implementasi secara umum, tetapi masih ragu saat memodifikasi query. | Mampu menjelaskan, menjalankan, dan memodifikasi implementasi dengan sedikit kekurangan. | Mampu menjelaskan, menjalankan, dan memodifikasi seluruh implementasi secara mandiri, runtut, dan tepat. Penilaian mengikuti **Rubrik Interview Individu** di atas. |

**Keterangan:** Rentang skor menunjukkan tingkat pencapaian setiap komponen. Bobot komponen tetap mengikuti tabel utama: 10%, 15%, 15%, 10%, 10%, dan 40%. Skor maksimum keseluruhan tugas adalah **90**.
