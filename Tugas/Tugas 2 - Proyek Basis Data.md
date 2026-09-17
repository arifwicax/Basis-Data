tidak # Tugas 2 — Proyek Perancangan dan Implementasi Basis Data

**Mata kuliah:** Basis Data (SI2514010)  
**Dosen pengampu:** Arif Wicaksono Septyanto, S.Kom., M.Kom.  
**Bentuk tugas:** Proyek terintegrasi  
**Metode penilaian:** Pemeriksaan proyek, demonstrasi, dan interview individual

## Tujuan Proyek

Mahasiswa menerapkan materi pada modul menjadi sebuah basis data yang berangkat dari masalah nyata, dirancang melalui ERD, dioptimalkan, dinormalisasi, diimplementasikan menggunakan MySQL, diisi menggunakan DML, dan diuji menggunakan JOIN Query.

## Bentuk Pengerjaan

Proyek dapat dikerjakan secara individu atau kelompok sesuai pembagian dosen. Walaupun proyek dikerjakan bersama, penilaian pemahaman dilakukan secara individual melalui interview. Nilai anggota dalam kelompok dapat berbeda berdasarkan penguasaan dan kontribusinya.

## Pemilihan Studi Kasus

Pilih permasalahan nyata di sekitar mahasiswa. Contoh:

- toko, kafe, atau usaha kecil;
- perpustakaan;
- sekolah atau lembaga kursus;
- klinik atau layanan kesehatan;
- penyewaan kendaraan;
- pengelolaan kos;
- organisasi atau komunitas;
- inventaris laboratorium;
- pemesanan tiket atau kegiatan;
- kasus lain yang disetujui dosen.

Hindari menyalin proyek yang sudah tersedia secara utuh di internet. Studi kasus harus dapat dijelaskan berdasarkan kebutuhan pengguna yang dipilih.

## Tahapan Proyek

### 1. Identifikasi Masalah

Jelaskan:

- latar belakang masalah;
- pihak yang menggunakan sistem;
- proses yang sedang berjalan;
- data yang perlu disimpan;
- masalah pada pencatatan saat ini;
- informasi atau laporan yang dibutuhkan.

Jika memungkinkan, kebutuhan diperoleh dari observasi atau wawancara sederhana dengan calon pengguna.

### 2. Aturan Bisnis

Tuliskan aturan bisnis yang jelas dan dapat diterjemahkan menjadi model data.

Contoh:

> Satu pelanggan dapat membuat banyak pesanan, tetapi setiap pesanan harus dimiliki tepat satu pelanggan.

Aturan bisnis harus menjelaskan hubungan, kewajiban data, batasan, dan kondisi penting dalam studi kasus.

### 3. ERD Awal

Buat ERD awal yang memuat:

- entitas;
- atribut;
- primary/candidate key;
- relasi;
- derajat relasi;
- kardinalitas;
- partisipasi wajib atau opsional.

### 4. Optimasi ERD

Periksa dan perbaiki ERD berdasarkan:

- redundansi data;
- entitas kuat dan lemah;
- pemilihan primary dan alternative key;
- atribut multivalue, composite, atau derived;
- atribut yang sebenarnya menjadi milik relasi;
- relasi N:M;
- repeating columns;
- kebutuhan generalisasi atau spesialisasi;
- fleksibilitas model jika data berkembang.

Sertakan diagram sebelum dan sesudah optimasi serta alasan setiap perubahan.

### 5. Normalisasi

Pilih sedikitnya satu data transaksi utama dari studi kasus, kemudian tunjukkan:

1. bentuk data belum normal atau UNF;
2. functional dependency;
3. proses menuju 1NF;
4. proses menuju 2NF;
5. proses menuju 3NF;
6. pemeriksaan BCNF bila relevan;
7. primary key dan foreign key hasil normalisasi;
8. alasan dekomposisi tetap lossless.

### 6. Implementasi MySQL dengan DDL

Buat skrip SQL untuk:

- membuat database;
- membuat seluruh tabel;
- menentukan tipe data;
- menentukan primary key;
- menentukan foreign key;
- menggunakan `NOT NULL`, `UNIQUE`, `CHECK`, atau `DEFAULT` sesuai kebutuhan;
- menentukan aturan referensial dengan alasan yang jelas.

Skrip harus dapat dijalankan dari database kosong.

### 7. Pengisian Data dengan DML

Isi data dummy yang cukup untuk menunjukkan seluruh hubungan dan kondisi penting. Data harus mencakup:

- data yang memiliki pasangan;
- data yang belum memiliki pasangan bila relasi mengizinkan;
- beberapa transaksi;
- beberapa detail transaksi;
- variasi data yang cukup untuk pengujian query.

Gunakan data sintetis dan jangan menggunakan data pribadi nyata.

### 8. Operasi DML

Demonstrasikan:

- `INSERT`;
- `SELECT`;
- `UPDATE` dengan kondisi yang aman;
- `DELETE` dengan kondisi yang aman;
- bukti sebelum dan sesudah perubahan.

### 9. JOIN Query

Buat query yang sesuai dengan kebutuhan studi kasus, mencakup:

- INNER JOIN;
- LEFT JOIN;
- RIGHT JOIN atau LEFT JOIN dengan posisi tabel dibalik;
- pencarian data tanpa pasangan;
- JOIN lebih dari dua tabel;
- JOIN dengan filter;
- JOIN dengan agregasi dan `GROUP BY`.

Setiap query harus disertai pertanyaan bisnis dan penjelasan hasilnya.

### 10. Pengujian Constraint

Lakukan beberapa uji data tidak valid, misalnya:

- primary key duplikat;
- foreign key yang tidak tersedia;
- nilai wajib yang dikosongkan;
- nilai di luar domain CHECK;
- pelanggaran UNIQUE;
- penghapusan data induk yang masih digunakan.

Catat query, pesan error, constraint yang bekerja, dan kesimpulannya.

## Berkas yang Dikumpulkan

1. laporan proyek;
2. ERD awal;
3. ERD hasil optimasi;
4. proses normalisasi;
5. kamus data;
6. skrip pembuatan database dan tabel;
7. skrip data dummy;
8. skrip DML dan JOIN;
9. hasil pengujian constraint;
10. petunjuk menjalankan proyek;
11. pembagian kontribusi apabila dikerjakan berkelompok.

## Struktur Laporan

1. identitas proyek;
2. latar belakang dan masalah;
3. kebutuhan pengguna;
4. aturan bisnis;
5. ERD awal;
6. optimasi ERD;
7. normalisasi;
8. skema fisik dan kamus data;
9. implementasi DDL;
10. implementasi DML;
11. JOIN dan informasi yang dihasilkan;
12. pengujian constraint;
13. kendala dan penyelesaian;
14. kesimpulan;
15. kontribusi anggota.

## Demonstrasi Proyek

Pada saat penilaian, mahasiswa harus dapat:

- membuat database dari skrip;
- menunjukkan tabel serta hubungan;
- menjalankan query yang diminta;
- mengubah atau memperbaiki query sederhana;
- menjelaskan ERD dan normalisasi;
- menunjukkan constraint yang menjaga data;
- menjelaskan hasil JOIN.

## Interview Individual

Interview menjadi bagian penting dari penilaian. Pertanyaan dapat mencakup:

- alasan memilih entitas dan atribut;
- alasan pemilihan key;
- cara membaca kardinalitas;
- perubahan sebelum dan sesudah optimasi;
- functional dependency dan tahapan normalisasi;
- alasan penempatan foreign key;
- perbedaan DDL dan DML;
- prediksi hasil JOIN;
- penjelasan query dan constraint;
- bagian yang dikerjakan mahasiswa;
- perubahan kecil yang harus dilakukan langsung saat interview.

Mahasiswa harus memahami keseluruhan proyek, bukan hanya bagian yang dinyatakan sebagai kontribusinya.

## Kriteria Penilaian

| Komponen | Bobot |
|---|---:|
| Analisis masalah dan aturan bisnis | 10% |
| ERD awal dan optimasi | 15% |
| Normalisasi | 15% |
| Implementasi DDL dan constraint | 15% |
| DML, data uji, dan JOIN | 15% |
| Pengujian serta dokumentasi | 10% |
| Demonstrasi proyek | 5% |
| Pemahaman saat interview individual | 15% |
| **Total** | **100%** |

## Penilaian Interview

Interview dinilai dari:

- ketepatan jawaban;
- kemampuan menggunakan bahasa sendiri;
- kemampuan menjelaskan alasan desain;
- kemampuan membaca serta memperbaiki ERD atau query;
- konsistensi jawaban dengan proyek yang dikumpulkan;
- penguasaan keseluruhan proyek;
- bukti kontribusi dan kesungguhan.

Jika mahasiswa tidak dapat menjelaskan isi proyek, nilai proyek dapat dikurangi meskipun berkas dan aplikasi dapat dijalankan.

## Ketentuan Keaslian

- Proyek harus berasal dari analisis mahasiswa.
- Referensi diperbolehkan, tetapi sumber harus dicantumkan.
- Penggunaan kode atau rancangan dari sumber lain harus dipahami dan dijelaskan.
- Proyek antarkelompok tidak boleh identik.
- Data pribadi dan kredensial tidak boleh disimpan dalam repository.
- Plagiarisme mengikuti ketentuan akademik yang berlaku.

## Checklist Proyek

- [ ] Masalah dan pengguna dijelaskan.
- [ ] Aturan bisnis tersedia.
- [ ] ERD awal dan hasil optimasi tersedia.
- [ ] Normalisasi sampai 3NF dijelaskan.
- [ ] PK dan FK konsisten.
- [ ] Skrip dapat dijalankan dari database kosong.
- [ ] Data dummy memadai.
- [ ] DML dan JOIN lengkap.
- [ ] Pengujian constraint terdokumentasi.
- [ ] Laporan dan petunjuk penggunaan tersedia.
- [ ] Kontribusi anggota dicatat.
- [ ] Setiap mahasiswa siap mengikuti interview.
