# Praktikum Minggu 6 — Normalisasi Basis Data

**Durasi:** 170 menit.  
**Fokus:** UNF, functional dependency, 1NF, 2NF, 3NF, BCNF, dan lossless join.

## 1. Tujuan

Mahasiswa mampu menemukan anomali, menulis dependency, menormalisasi nota penjualan, menetapkan key, dan membuktikan dekomposisi melalui SQL JOIN.

## 2. Perangkat

- MySQL Server dan client;
- aplikasi diagram/tabel;
- [skrip verifikasi normalisasi](week6_verifikasi_normalisasi.sql).

## 3. Alokasi Waktu

| Kegiatan | Menit |
|---|---:|
| Pretest dan analisis UNF | 25 |
| Functional dependency | 25 |
| 1NF–3NF/BCNF | 60 |
| Implementasi SQL | 35 |
| Lossless join dan laporan | 25 |

## 4. Pretest

1. Apa itu redundansi?
2. Sebutkan tiga anomali.
3. Apa arti `X → Y`?
4. Apa perbedaan PK tunggal dan composite?
5. Apa arti lossless join?

## 5. Data UNF Nota

Gunakan atribut nota dari slide dan dua transaksi contoh. Gambarkan repeating group barang. Identifikasi atribut input dan atribut turunan: subtotal, total, serta kurang bayar.

## 6. Functional Dependency

Lengkapi berdasarkan asumsi bisnis:

| Determinan | Atribut yang ditentukan | Alasan |
|---|---|---|
| NomorNota | ... | ... |
| KodePelanggan | ... | ... |
| KodeKasir | ... | ... |
| KodeBarang | ... | ... |
| NomorNota + NomorBaris | ... | ... |

Jangan menyimpulkan dependency hanya karena data sampel kebetulan sama.

## 7. Transformasi ke 1NF

1. Ubah setiap barang menjadi satu baris.
2. Pastikan tidak ada sel berisi daftar.
3. Tambahkan `nomor_baris` jika barang dapat muncul berulang.
4. Tentukan candidate key.
5. Tunjukkan redundansi yang masih tersisa.

## 8. Transformasi ke 2NF

1. Periksa atribut yang hanya bergantung pada NomorNota.
2. Periksa atribut yang hanya bergantung pada KodeBarang.
3. Pisahkan Nota, Barang, dan DetailNota.
4. Pastikan atribut DetailNota bergantung penuh pada key detail.

## 9. Transformasi ke 3NF

1. Cari dependency KodePelanggan → data pelanggan.
2. Cari dependency KodeKasir → NamaKasir.
3. Pisahkan Pelanggan dan Kasir.
4. Tentukan seluruh PK dan FK.
5. Periksa apakah determinan pada setiap tabel merupakan key.

## 10. Pemeriksaan BCNF

Isi tabel:

| Tabel | Functional dependency | Determinan key? | BCNF? |
|---|---|:---:|:---:|
| Pelanggan | ... | | |
| Kasir | ... | | |
| Barang | ... | | |
| Nota | ... | | |
| DetailNota | ... | | |

## 11. Implementasi SQL

Jalankan skrip. Periksa tabel menggunakan `SHOW CREATE TABLE`. Pastikan PK, composite PK, dan FK sesuai hasil normalisasi.

## 12. Uji Lossless Join

Jalankan query JOIN pada skrip. Bandingkan:

- jumlah baris detail sebelum dan sesudah;
- nomor nota dan barang;
- jumlah dan harga;
- data pelanggan serta kasir;
- subtotal hasil perhitungan.

Jika muncul baris palsu atau data hilang, periksa kembali key dan kondisi JOIN.

## 13. Uji Anomali Setelah Normalisasi

1. Tambahkan Barang tanpa Nota — seharusnya dapat dilakukan.
2. Ubah nama pelanggan sekali pada tabel Pelanggan.
3. Hapus satu DetailNota tanpa menghapus Barang.
4. Coba memasukkan DetailNota dengan Nota tidak tersedia — harus ditolak FK.

Jelaskan anomali yang telah dicegah.

## 14. Luaran

1. tabel UNF;
2. daftar functional dependency;
3. hasil 1NF, 2NF, dan 3NF;
4. pemeriksaan BCNF;
5. diagram tabel hasil;
6. bukti implementasi SQL;
7. bukti lossless join;
8. analisis anomali;
9. kesimpulan.

## 15. Rubrik

| Komponen | Bobot |
|---|---:|
| Identifikasi anomali/dependency | 20% |
| 1NF | 15% |
| 2NF | 15% |
| 3NF dan BCNF | 20% |
| PK, FK, dan implementasi | 15% |
| Lossless join | 10% |
| Laporan | 5% |

## 16. Checklist

- [ ] Nama file bukan `README.md`.
- [ ] Functional dependency memiliki alasan bisnis.
- [ ] Setiap tahap dapat dibandingkan.
- [ ] PK dan FK jelas.
- [ ] Tidak ada repeating group.
- [ ] Partial dependency dihilangkan.
- [ ] Transitive dependency dihilangkan.
- [ ] BCNF diperiksa.
- [ ] Lossless join dibuktikan.
- [ ] Data yang dipakai sintetis.

Kembali ke [Modul Minggu 6](../../Modul/Week%206%20-%20Normalisasi.md).
