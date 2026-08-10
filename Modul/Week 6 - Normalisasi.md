# Minggu 6 — Normalisasi Basis Data

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK yang didukung:** Mahasiswa mampu menganalisis kebutuhan dan merancang basis data yang konsisten (C4, C6).

## 1. Pengertian Normalisasi

**Normalisasi** adalah proses mengorganisasi tabel relasional agar data tersimpan secara logis, konsisten, dan memiliki redundansi seminimal mungkin. Tabel besar diuraikan menjadi tabel yang lebih kecil, kemudian dihubungkan kembali menggunakan key.

Normalisasi bukan sekadar “memecah tabel”. Pemecahan harus mengikuti ketergantungan data dan tidak boleh menghilangkan informasi.

## 2. Tujuan Normalisasi

Sesuai slide, normalisasi menghasilkan tabel yang:

1. memuat data yang benar-benar diperlukan;
2. memiliki redundansi sesedikit mungkin;
3. lebih efisien ketika diperbarui;
4. mengurangi risiko kehilangan data yang tidak disengaja;
5. menjaga integritas dan konsistensi;
6. mudah dikembangkan serta dipelihara.

## 3. Redundansi dan Anomali

Contoh tabel:

| NIM | Nama | KodeMK | MataKuliah | SKS | Nilai |
|---|---|---|---|---:|---|
| 1 | Hana | KD01 | Basis Data | 2 | A |
| 1 | Hana | KD02 | Kalkulus | 3 | B |
| 2 | Cantika | KD01 | Basis Data | 2 | B |

Nama mahasiswa, nama mata kuliah, dan SKS berulang.

### 3.1 Insertion Anomaly

Kita sulit menyimpan mata kuliah baru jika belum ada mahasiswa yang mengambilnya karena baris mengharuskan NIM dan Nilai.

### 3.2 Update Anomaly

Jika SKS Basis Data berubah, semua baris KD01 harus diperbarui. Jika satu baris terlewat, data menjadi inkonsisten.

### 3.3 Deletion Anomaly

Jika baris terakhir mahasiswa yang mengambil suatu mata kuliah dihapus, informasi mata kuliah tersebut ikut hilang.

## 4. Istilah Dasar

| Istilah | Makna |
|---|---|
| Relasi | Tabel pada model relasional |
| Atribut | Kolom |
| Tuple | Baris |
| Determinan | Atribut yang menentukan atribut lain |
| Candidate key | Key minimal yang mengidentifikasi tuple |
| Composite key | Key yang terdiri dari beberapa atribut |
| Non-key attribute | Atribut yang bukan bagian candidate key |
| Dekomposisi | Pemecahan tabel menjadi tabel lebih kecil |

## 5. Functional Dependency

Notasi `X → Y` berarti setiap nilai X menentukan tepat satu nilai Y pada satu waktu.

Contoh:

```text
NIM → Nama
KodeMK → NamaMK, SKS
(NIM, KodeMK) → Nilai
```

Dependensi berasal dari aturan bisnis, bukan hanya dari data contoh. Dua nilai kebetulan sama tidak otomatis membentuk functional dependency.

## 6. Syarat Dekomposisi yang Baik

### 6.1 Lossless-Join Decomposition

Setelah tabel dipecah, JOIN harus dapat mengembalikan informasi semula tanpa kehilangan atau menghasilkan baris palsu.

Contoh:

```text
Mahasiswa(NIM, Nama)
MataKuliah(KodeMK, NamaMK)
KRS(NIM, KodeMK, Nilai)
```

JOIN ketiganya dapat membentuk kembali data mahasiswa, mata kuliah, dan nilai.

### 6.2 Lossy Decomposition

Dekomposisi lossy kehilangan penghubung atau menghasilkan pasangan yang tidak pernah ada. Contohnya, jika tabel KRS tidak menyimpan pasangan NIM–KodeMK, hubungan siapa mengambil mata kuliah apa akan hilang.

### 6.3 Dependency Preservation

Aturan ketergantungan sebaiknya tetap dapat ditegakkan pada tabel hasil tanpa JOIN yang rumit. Misalnya `KodeMK → NamaMK` dijaga pada tabel MataKuliah.

### 6.4 BCNF atau Minimal 3NF

Target rancangan yang baik adalah BCNF bila memungkinkan. Jika constraint tertentu membuat BCNF sulit dicapai tanpa kehilangan dependency preservation, minimal gunakan 3NF dengan alasan yang terdokumentasi.

## 7. Tabel Tidak Normal pada Nota Penjualan

Slide memakai atribut:

```text
nomor_nota, kode_pelanggan, nama_pelanggan,
kode_kasir, nama_kasir, kode_barang, nama_barang,
jumlah, harga_satuan, DP, jatuh_tempo, tanggal,
nama_kontak, telepon, subtotal, total, kurang_bayar
```

Satu nota memiliki banyak barang. Jika barang ditempatkan sebagai kelompok berulang atau kolom `barang1`, `barang2`, tabel masih **Unnormalized Form (UNF)**.

Nilai yang dapat dihitung:

```text
subtotal = jumlah × harga_satuan
total = jumlah seluruh subtotal
kurang_bayar = total − DP
```

Atribut turunan tidak selalu perlu disimpan karena dapat dihitung dan berisiko tidak konsisten.

## 8. First Normal Form (1NF)

Syarat 1NF:

1. setiap sel memiliki nilai atomik/tunggal;
2. tidak ada repeating group atau multivalue;
3. setiap baris dapat diidentifikasi secara unik;
4. satu kolom menyimpan satu domain data yang konsisten.

Ubah barang dalam nota menjadi baris:

| NomorNota | KodeBarang | Jumlah | HargaSatuan |
|---|---|---:|---:|
| 83453 | B01 | 2 | 1000000 |
| 83453 | B05 | 3 | 200000 |
| 83453 | B03 | 2 | 1200000 |

Candidate key detail dapat berupa `(NomorNota, KodeBarang)` jika barang hanya boleh muncul sekali per nota. Jika barang sama dapat muncul lebih dari sekali, gunakan `NomorBaris`.

1NF belum otomatis menghilangkan redundansi; data pelanggan dan barang masih dapat berulang.

## 9. Second Normal Form (2NF)

Syarat 2NF:

1. sudah memenuhi 1NF;
2. setiap atribut non-key bergantung penuh pada seluruh candidate key;
3. tidak ada partial dependency.

Pada key `(NomorNota, KodeBarang)`:

```text
NomorNota → Tanggal, KodePelanggan, KodeKasir, DP
KodeBarang → NamaBarang
(NomorNota, KodeBarang) → Jumlah, HargaJual
```

Atribut yang hanya bergantung pada sebagian key dipisahkan:

```text
Nota(NomorNota, Tanggal, KodePelanggan, KodeKasir, DP, JatuhTempo)
Barang(KodeBarang, NamaBarang)
DetailNota(NomorNota, KodeBarang, Jumlah, HargaJual)
```

2NF terutama relevan ketika tabel memiliki composite candidate key. Tabel dengan candidate key satu atribut otomatis tidak memiliki partial dependency, tetapi belum tentu 3NF.

## 10. Third Normal Form (3NF)

Syarat 3NF:

1. sudah memenuhi 2NF;
2. tidak ada transitive dependency antara atribut non-key.

Contoh pada Nota:

```text
NomorNota → KodePelanggan
KodePelanggan → NamaPelanggan, NamaKontak, Telepon
```

`NamaPelanggan` bergantung tidak langsung pada NomorNota melalui KodePelanggan. Pisahkan:

```text
Pelanggan(KodePelanggan, NamaPelanggan, NamaKontak, Telepon)
Kasir(KodeKasir, NamaKasir)
Nota(NomorNota, Tanggal, KodePelanggan, KodeKasir, DP, JatuhTempo)
Barang(KodeBarang, NamaBarang)
DetailNota(NomorNota, KodeBarang, Jumlah, HargaJual)
```

## 11. Boyce-Codd Normal Form (BCNF)

Sebuah tabel memenuhi BCNF jika setiap determinan merupakan superkey/candidate key.

BCNF lebih ketat dari 3NF. Banyak tabel sederhana yang telah dirancang baik otomatis memenuhi BCNF. Pemeriksaan dilakukan dengan menuliskan seluruh functional dependency dan memastikan sisi kiri setiap dependency adalah key.

## 12. Hasil Skema Nota Penjualan

```text
Pelanggan(kode_pelanggan, nama, nama_kontak, telepon)
Kasir(kode_kasir, nama)
Barang(kode_barang, nama)
Nota(nomor_nota, tanggal, kode_pelanggan, kode_kasir, dp, jatuh_tempo)
DetailNota(nomor_nota, nomor_baris, kode_barang, jumlah, harga_jual)
```

Key dan hubungan:

- PK Pelanggan: `kode_pelanggan`;
- PK Kasir: `kode_kasir`;
- PK Barang: `kode_barang`;
- PK Nota: `nomor_nota`;
- PK DetailNota: `(nomor_nota, nomor_baris)`;
- Nota memiliki FK ke Pelanggan dan Kasir;
- DetailNota memiliki FK ke Nota dan Barang.

## 13. Membuktikan Lossless Join

```sql
SELECT n.nomor_nota, n.tanggal,
       p.nama AS pelanggan,
       k.nama AS kasir,
       b.nama AS barang,
       d.jumlah, d.harga_jual,
       d.jumlah * d.harga_jual AS subtotal
FROM Nota n
JOIN Pelanggan p ON p.kode_pelanggan = n.kode_pelanggan
JOIN Kasir k ON k.kode_kasir = n.kode_kasir
JOIN DetailNota d ON d.nomor_nota = n.nomor_nota
JOIN Barang b ON b.kode_barang = d.kode_barang;
```

Bandingkan jumlah dan makna baris JOIN dengan data awal. JOIN harus mengembalikan hubungan transaksi yang benar, bukan Cartesian product.

## 14. Kapan Normalisasi Berhenti?

Untuk pembelajaran dasar, target praktis adalah 3NF atau BCNF. Normal form lebih tinggi ada, tetapi diterapkan jika terdapat dependency khusus. Jangan melakukan denormalisasi sebelum masalah performa diukur. Denormalisasi menambah redundansi dan membutuhkan mekanisme konsistensi.

## 15. Kesalahan Umum

1. Memecah tabel tanpa menulis functional dependency.
2. Menganggap 1NF sudah menghilangkan semua redundansi.
3. Mengira semua tabel harus memiliki surrogate key.
4. Menghapus atribut turunan tanpa mempertimbangkan kebutuhan.
5. Memisahkan tabel sampai hubungan data hilang.
6. Tidak menentukan PK dan FK hasil dekomposisi.
7. Menentukan dependency hanya dari beberapa baris contoh.
8. Tidak menguji lossless join.
9. Menyebut tabel banyak kolom pasti tidak normal.
10. Melakukan denormalisasi tanpa pengukuran.

## 16. Prosedur Normalisasi

1. Kumpulkan seluruh atribut dari kebutuhan/dokumen.
2. Tentukan candidate key.
3. Tuliskan functional dependency.
4. Hilangkan repeating group untuk 1NF.
5. Hilangkan partial dependency untuk 2NF.
6. Hilangkan transitive dependency untuk 3NF.
7. Periksa determinan untuk BCNF.
8. Tetapkan PK dan FK.
9. Uji lossless join dan dependency preservation.
10. Cocokkan kembali dengan ERD dan business rule.

## 17. Latihan

1. Jelaskan tiga anomali menggunakan tabel mahasiswa–mata kuliah.
2. Tentukan dependency pada tabel nota.
3. Ubah kelompok barang menjadi 1NF.
4. Tunjukkan partial dependency sebelum 2NF.
5. Tunjukkan transitive dependency sebelum 3NF.
6. Jelaskan perbedaan 3NF dan BCNF.
7. Buktikan hasil dekomposisi dapat di-JOIN.

## 18. Kuis Formatif

1. Nilai tunggal dalam setiap sel merupakan syarat apa?
2. Dependency pada sebagian composite key disebut apa?
3. Dependency non-key melalui non-key disebut apa?
4. Apa arti lossless join?
5. Mengapa dependency preservation penting?
6. Dalam BCNF, setiap determinan harus merupakan apa?

## 19. Rangkuman

- Normalisasi mengurangi redundansi dan anomali.
- Functional dependency menjadi dasar dekomposisi.
- Dekomposisi harus lossless dan sebisa mungkin menjaga dependency.
- 1NF menghilangkan repeating group dan multivalue.
- 2NF menghilangkan partial dependency.
- 3NF menghilangkan transitive dependency.
- BCNF mengharuskan setiap determinan merupakan key.
- PK dan FK menghubungkan tabel hasil normalisasi.
- JOIN digunakan untuk membuktikan informasi tetap dapat dikembalikan.

## 20. Asesmen dan Praktikum

Asesmen mencakup Tugas 3 normalisasi, praktikum, pretest, kuis, functional dependency, proses UNF–3NF/BCNF, dan bukti lossless join.

[Praktikum Minggu 6 — Normalisasi Basis Data](../script/Week%206/Praktikum%20Week%206%20-%20Normalisasi%20Basis%20Data.md)

## Referensi

1. Slide Week 6 — *Normalisasi*.
2. Bagui, S. & Earp, R. (2023). *Database Design Using Entity-Relationship Diagrams*.
3. RPS SI2514010 — Basis Data.
