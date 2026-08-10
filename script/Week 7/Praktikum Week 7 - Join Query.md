# Praktikum Minggu 7 — JOIN Query

**Durasi:** 170 menit.

## Tujuan

Membuat dataset slide, memprediksi dan menjalankan INNER/LEFT/RIGHT JOIN, menjelaskan NULL, membuat anti-join serta agregasi, dan membaca EXPLAIN.

## Perangkat

MySQL Server/client dan [skrip JOIN](week7_join_query.sql).

## Langkah

1. Jalankan skrip pembuatan tabel dan data.
2. Kelompokkan jurusan yang ada pada kedua tabel, hanya mahasiswa, dan hanya universitas.
3. Prediksi jumlah baris setiap JOIN sebelum menjalankan query.
4. Jalankan INNER, LEFT, dan RIGHT JOIN; tandai NULL.
5. Buat anti-join mahasiswa tanpa universitas dan universitas tanpa mahasiswa.
6. Bandingkan filter akreditasi pada ON dan WHERE.
7. Hitung jumlah serta rata-rata nilai mahasiswa per jurusan.
8. Jalankan CROSS JOIN dan jelaskan jumlah barisnya.
9. Jalankan EXPLAIN pada INNER JOIN dan catat key serta estimasi baris.

## Luaran

- klasifikasi pasangan/tanpa pasangan;
- tabel prediksi dan hasil;
- tiga jenis JOIN;
- dua anti-join;
- analisis ON vs WHERE;
- query agregasi;
- hasil EXPLAIN;
- kesimpulan.

## Rubrik

| Komponen | Bobot |
|---|---:|
| Prediksi dan dataset | 15% |
| INNER/LEFT/RIGHT | 30% |
| NULL dan anti-join | 20% |
| Agregasi | 20% |
| EXPLAIN dan laporan | 15% |

## Checklist

- [ ] Nama file bukan README.md.
- [ ] Dataset sesuai slide.
- [ ] Ketiga JOIN berhasil.
- [ ] NULL dapat dijelaskan.
- [ ] Anti-join tersedia.
- [ ] Agregasi dan EXPLAIN terdokumentasi.

Kembali ke [Modul Minggu 7](../../Modul/Week%207%20-%20Join%20Query.md).
