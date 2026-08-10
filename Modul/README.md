# Modul Perkuliahan Basis Data

## Identitas Mata Kuliah

| Komponen | Keterangan |
|---|---|
| Mata kuliah | Basis Data |
| Kode | SI2514010 |
| Program studi | Statistika |
| Bobot | 3 SKS |
| Dosen pengampu | **Arif Wicaksono Septyanto, S.Kom., M.Kom.** |
| RPS | Tahun ajaran 2025–2030, terbit 1 Agustus 2025 |
| Prasyarat | SI2514009 – Matematika Diskrit 2 |

## Fokus Capaian Modul

Struktur materi menggunakan **Sub-CPMK mingguan dari RPS** sebagai acuan langsung. CPL dan CPMK tidak diulang pada setiap modul agar tujuan belajar, materi, aktivitas, dan asesmen tetap terarah pada kemampuan akhir minggu terkait.

## Peta Modul Mingguan

| Minggu | Sub-CPMK sesuai RPS | Materi utama | Modul |
|---:|---|---|---|
| 1 | Menjelaskan pengertian, manfaat penerapan basis data, serta perbedaan sistem informasi tradisional dan modern (C2) | Kontrak kuliah, sistem file, konsep dan komponen basis data, instalasi MySQL | [Minggu 1](Week%201%20-%20Pengantar%20Basis%20Data.md) |
| 2 | Menjelaskan konsep dan jenis pemodelan basis data (C2) | Hierarki, jaringan, relasional, objek; komponen ERD | [Minggu 2](Week%202%20-%20Pemodelan%20Basis%20Data.md) |
| 3 | Menganalisis kebutuhan dan merancang basis data (C4, C6) | Optimasi ERD, key, entitas lemah, generalisasi, dan fleksibilitas struktur | [Minggu 3](Week%203%20-%20Optimasi%20ERD.md) |
| 4 | Menganalisis kebutuhan dan merancang basis data (C4, C6) | Konversi entitas dan relasi 1:N, DDL serta DML awal | [Minggu 4](Week%204%20-%20Implementasi%20ERD%20Dasar.md) |
| 5 | Menjelaskan dan menerapkan SQL: DDL, DML, DCL (C2, C3) | N:M, rekursif, 1:1, DDL/DML lengkap, dan constraint | [Minggu 5](Week%205%20-%20Implementasi%20ERD%20dengan%20DDL%20dan%20DML.md) |
| 6 | Menganalisis kebutuhan dan merancang basis data (C4, C6) | Anomali, functional dependency, 1NF–3NF, BCNF, dan lossless join | [Minggu 6](Week%206%20-%20Normalisasi.md) |
| 7 | Menjelaskan dan menerapkan SQL (C2, C3) | INNER, LEFT, RIGHT JOIN, NULL, anti-join, dan agregasi | [Minggu 7](Week%207%20-%20Join%20Query.md) |
| 8 | Evaluasi capaian minggu 1–7 | Ujian Tengah Semester | [Minggu 8](Week%208%20-%20UTS.md) |
| 9 | Mengembangkan aplikasi yang berinteraksi dengan basis data menggunakan SQL standar (C6) | Driver, konfigurasi, koneksi, cursor, dan repository | [Minggu 9](Week%209%20-%20Koneksi%20Aplikasi%20dan%20Basis%20Data.md) |
| 10 | Mengembangkan aplikasi yang berinteraksi dengan basis data menggunakan SQL standar (C6) | CRUD, JOIN, agregasi, dan visualisasi | [Minggu 10](Week%2010%20-%20CRUD%20Aplikasi%20dan%20Visualisasi.md) |
| 11 | Menjelaskan ACID dalam manajemen transaksi (C2) | Transaksi, konkurensi, isolation, dan ACID | [Minggu 11](Week%2011%20-%20Transaksi%20dan%20ACID.md) |
| 12 | Menerapkan pencegahan SQL Injection dengan *prepared statement* (C3) | Parameterized query, allowlist, least privilege, dan pengujian | [Minggu 12](Week%2012%20-%20Prepared%20Statement%20dan%20SQL%20Injection.md) |
| 13 | Menerapkan *automated backup procedures* dengan scripting dan scheduling tools (C3) | Backup, restore, otomasi dan verifikasi | [Minggu 13](Week%2013%20-%20Backup%20dan%20Recovery.md) |
| 14 | Menjelaskan dan menerapkan teknologi basis data modern (C2, C3) | Konsep NoSQL dan document database | [Minggu 14](Week%2014%20-%20NoSQL%20Dasar.md) |
| 15 | Menjelaskan dan menerapkan teknologi basis data modern (C2, C3) | Implementasi, query dan visualisasi NoSQL | [Minggu 15](Week%2015%20-%20Implementasi%20NoSQL.md) |
| 16 | Presentasi proyek PjBL | Integrasi rancangan, implementasi, keamanan, visualisasi | [Minggu 16](Week%2016%20-%20Presentasi%20Proyek.md) |

## Alur Proyek Semester

Studi kasus yang sama dikembangkan bertahap: kebutuhan dan *business rule* → ERD → normalisasi → implementasi MySQL → CRUD/JOIN → aplikasi dan visualisasi → transaksi dan keamanan → backup → eksplorasi NoSQL → presentasi. Dengan alur ini, setiap tugas menjadi bagian dari proyek akhir, bukan pekerjaan yang terpisah.

## Sumber Materi

Modul mempertahankan materi yang telah tersedia dan menambahkan materi dari seluruh slide pada folder `Slide`. Acuan utama mengikuti daftar pustaka RPS: Bagui & Earp (2023), Smirnova & Tezuysal (2022), Uzayr (2022), serta Pettit & Cosentino (2022).
