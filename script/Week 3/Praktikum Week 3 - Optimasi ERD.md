# Praktikum Minggu 3 — Optimasi ERD

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Sub-CPMK:** Mahasiswa mampu menganalisis kebutuhan basis data dan merancang basis data (C4, C6).

## 1. Tujuan Praktikum

Mahasiswa mampu mengevaluasi ERD awal, menemukan redundansi dan struktur kaku, memilih key, menempatkan atribut relasi, menerapkan generalisasi, mengubah repeating columns menjadi baris, dan membuktikan perbaikan menggunakan skenario data.

## 2. Alokasi Waktu

Durasi praktikum: **170 menit**.

| Kegiatan | Waktu |
|---|---:|
| Pretest dan persiapan | 15 menit |
| Audit ERD awal | 25 menit |
| Latihan teknik optimasi | 45 menit |
| Optimasi studi kasus | 50 menit |
| Validasi sebelum–sesudah | 25 menit |
| Kesimpulan | 10 menit |

## 3. Perangkat dan Input

- aplikasi pemodelan ERD;
- ERD hasil praktikum Minggu 2;
- dokumen aturan bisnis;
- template tabel audit pada panduan ini.

Simpan file sumber diagram dan ekspor versi sebelum serta sesudah optimasi.

## 4. Pretest

1. Apa perbedaan redundansi dan inkonsistensi?
2. Apa yang dimaksud candidate key?
3. Mengapa relasi N:M membutuhkan entitas asosiatif?
4. Apa masalah kolom `item1`, `item2`, `item3`?
5. Apa perbedaan entitas kuat dan lemah?

## 5. Tahap A — Audit ERD Awal

Gunakan ERD Minggu 2 dan isi tabel:

| Temuan | Lokasi | Dampak | Prioritas | Rencana perbaikan |
|---|---|---|---|---|
| Data referensi berulang | ... | ... | ... | ... |
| Key tidak stabil | ... | ... | ... | ... |
| Atribut salah tempat | ... | ... | ... | ... |
| Relasi N:M | ... | ... | ... | ... |
| Atribut multivalue | ... | ... | ... | ... |
| Kolom berulang | ... | ... | ... | ... |
| Domain terlalu sempit | ... | ... | ... | ... |
| Kandidat generalisasi | ... | ... | ... | ... |

## 6. Tahap B — Optimasi Asal Sekolah

### Model Awal

```text
Mahasiswa(nim, nama, asal_sekolah, alamat_sekolah,
          jenis_kelamin, agama)
```

### Tugas

1. Buat lima baris mahasiswa dengan tiga orang dari sekolah sama.
2. Tandai nilai yang berulang.
3. Simulasikan perubahan alamat sekolah.
4. Pisahkan Sekolah menjadi entitas.
5. Tentukan key dan kardinalitas.
6. Gambarkan model sebelum dan sesudah.

### Hasil yang Diharapkan

```text
Sekolah(id_sekolah, nama_sekolah, alamat)
Mahasiswa(nim, nama, jenis_kelamin, agama, id_sekolah)
```

Jelaskan apakah Sekolah merupakan entitas kuat atau lemah dan alasannya.

## 7. Tahap C — Primary dan Alternative Key

Perhatikan data Hobi:

| Hobi | Keterangan |
|---|---|
| Membaca | ... |
| Menulis | ... |
| Main Musik | ... |

Tugas:

1. tentukan candidate key;
2. tambahkan `id_hobi` sebagai surrogate primary key;
3. pertahankan `nama_hobi` sebagai alternative key;
4. jelaskan constraint unik yang masih diperlukan;
5. bandingkan kelebihan dan risiko kedua pilihan key.

## 8. Tahap D — Penambahan Atribut KRS

Model awal:

```text
KRS(nim, kode_mk, nilai)
```

Uji skenario:

- mahasiswa mengulang mata kuliah pada tahun berikutnya;
- mata kuliah ditawarkan pada semester ganjil dan genap;
- terdapat dua kelas mata kuliah pada periode sama.

Perbaiki KRS dengan atribut tahun, semester, dan kelas. Tentukan candidate key yang mencegah duplikasi pendaftaran tetapi tetap mendukung pengambilan ulang.

## 9. Tahap E — Generalisasi Anggota

Sistem perpustakaan menyimpan Mahasiswa dan Dosen sebagai peminjam. Keduanya memiliki nama, kontak, transaksi peminjaman, lama pinjam, denda, dan maksimal pinjam.

Tugas:

1. tandai atribut umum dan atribut khusus;
2. buat supertype `Anggota`;
3. tentukan apakah subtype Mahasiswa dan Dosen masih diperlukan;
4. buat `JenisAnggota` untuk aturan peminjaman;
5. jelaskan bagaimana model mendukung jenis anggota baru.

## 10. Tahap F — Kolom Menjadi Baris

Model awal:

```text
Sirkulasi(id_sirkulasi, tanggal_pinjam, id_anggota,
          id_buku1, id_buku2, id_buku3)
```

Tugas:

1. masukkan contoh peminjaman dua buku;
2. jelaskan cara menyimpan lima buku;
3. identifikasi kolom kosong dan aturan yang berulang;
4. pecah menjadi `Sirkulasi` dan `DetailSirkulasi`;
5. tentukan PK, FK, dan atribut `tanggal_kembali`;
6. buktikan model mendukung jumlah buku tanpa mengubah kolom.

## 11. Tahap G — Optimasi ERD Proyek

Terapkan sedikitnya lima pemeriksaan berikut pada ERD kelompok:

- data referensi berulang;
- entitas kuat/lemah;
- candidate dan alternative key;
- atribut relasi;
- domain atribut;
- generalisasi/spesialisasi;
- repeating columns;
- atribut multivalue;
- relasi N:M;
- atribut composite/derived.

Untuk setiap perubahan, isi tabel:

| No. | Sebelum | Masalah | Sesudah | Alasan | Dampak |
|---:|---|---|---|---|---|
| 1 | ... | ... | ... | ... | ... |
| 2 | ... | ... | ... | ... | ... |
| 3 | ... | ... | ... | ... | ... |
| 4 | ... | ... | ... | ... | ... |
| 5 | ... | ... | ... | ... | ... |

## 12. Validasi dengan Skenario

Uji model setelah optimasi:

1. menambah data referensi sebelum transaksi;
2. mengubah satu fakta tanpa memperbarui banyak tempat;
3. menghapus satu transaksi tanpa kehilangan master;
4. menyimpan jumlah detail lebih banyak dari contoh awal;
5. menyimpan kejadian berulang pada periode berbeda;
6. menambah tipe anggota/kategori baru;
7. menghasilkan laporan yang diperlukan.

Catat hasil:

| Skenario | Model lama | Model baru | Lulus? | Catatan |
|---|---|---|:---:|---|
| Insert | ... | ... | | ... |
| Update | ... | ... | | ... |
| Delete | ... | ... | | ... |
| Pertumbuhan | ... | ... | | ... |
| Laporan | ... | ... | | ... |

## 13. Checklist Kualitas

- [ ] Setiap perubahan mengikuti aturan bisnis.
- [ ] Fakta yang sama tidak disimpan berulang tanpa alasan.
- [ ] Setiap entitas memiliki key stabil.
- [ ] Alternative key tetap dijaga unik.
- [ ] Entitas lemah mempunyai pemilik dan partial key yang jelas.
- [ ] Atribut relasi berada pada entitas asosiatif.
- [ ] Relasi N:M telah diselesaikan.
- [ ] Tidak ada kolom bernomor berulang.
- [ ] Domain atribut mendukung kebutuhan wajar.
- [ ] Generalisasi memiliki manfaat yang dapat dijelaskan.
- [ ] Diagram sebelum dan sesudah dapat dibandingkan.
- [ ] Semua skenario validasi telah diuji.

## 14. Luaran Praktikum

1. jawaban pretest;
2. tabel audit ERD;
3. latihan Asal Sekolah;
4. analisis key Hobi;
5. perbaikan KRS;
6. generalisasi Anggota;
7. perbaikan Sirkulasi;
8. ERD proyek sebelum dan sesudah;
9. tabel alasan setiap perubahan;
10. hasil validasi skenario;
11. kesimpulan.

## 15. Format Laporan

1. identitas dan tujuan;
2. alat serta sumber ERD;
3. hasil audit;
4. pembahasan latihan B–F;
5. optimasi proyek;
6. ERD sebelum dan sesudah;
7. validasi;
8. kendala dan penyelesaian;
9. kesimpulan;
10. lampiran file sumber diagram.

Setiap gambar harus dapat dibaca dan setiap perubahan harus memiliki alasan. Jangan hanya mengumpulkan diagram tanpa analisis.

## 16. Rubrik Penilaian

| Komponen | Bobot |
|---|---:|
| Audit masalah ERD | 15% |
| Pemahaman entitas dan key | 15% |
| Penempatan atribut dan relasi | 15% |
| Generalisasi dan fleksibilitas | 15% |
| Perbaikan repeating columns/N:M | 15% |
| Validasi skenario | 15% |
| Argumentasi dan laporan | 10% |
| **Total** | **100%** |

## 17. Kriteria Keberhasilan

Praktikum berhasil jika mahasiswa dapat menunjukkan bahwa ERD baru lebih efisien dan fleksibel melalui bukti perubahan struktur serta skenario insert, update, delete, pertumbuhan, dan laporan.

Kembali ke [Modul Minggu 3 — Optimasi ERD](../../Modul/Week%203%20-%20Optimasi%20ERD.md).
