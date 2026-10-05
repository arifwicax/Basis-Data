# Penjelasan Normalisasi Tabel Penjualan

Maksud normalisasi adalah proses memecah tabel `Penjualan` agar tidak terjadi pengulangan dan ketergantungan data yang salah.

## 1. 1NF: Nilai Harus Atomik

Data pada setiap kolom harus berisi satu nilai, bukan daftar atau kelompok nilai.

Contoh yang sudah memenuhi 1NF:

| no_faktur | kode_barang | nama_barang |
|---|---|---|
| F001 | B01 | Pulpen |
| F001 | B02 | Buku tulis |

Satu baris hanya menyimpan satu barang. Tidak boleh menulis:

| no_faktur | kode_barang |
|---|---|
| F001 | B01, B02 |

Karena `kode_barang` berisi lebih dari satu nilai.

## 2. 2NF: Menghilangkan Ketergantungan Parsial

Pada tabel detail, primary key terdiri dari dua kolom:

```text
(no_faktur, kode_barang)
```

Namun, tidak semua atribut bergantung pada kedua kolom tersebut.

Contohnya:

- `jumlah` bergantung pada `no_faktur` dan `kode_barang`.
- `nama_barang` hanya bergantung pada `kode_barang`.
- `tgl_faktur` hanya bergantung pada `no_faktur`.

Ketergantungan pada sebagian primary key disebut ketergantungan parsial.

Karena itu, data dipisahkan menjadi:

```text
Faktur(no_faktur, tgl_faktur, kd_pelanggan)
Barang(kode_barang, nama_barang, harga_satuan)
Detail_Faktur(no_faktur, kode_barang, jumlah, subtotal)
```

Dengan pemisahan ini:

- Data faktur disimpan di tabel `Faktur`.
- Data barang disimpan di tabel `Barang`.
- Data barang yang dibeli disimpan di `Detail_Faktur`.

## 3. 3NF: Menghilangkan Ketergantungan Transitif

Ketergantungan transitif terjadi ketika atribut non-key bergantung pada atribut non-key lainnya.

Contohnya pada tabel awal:

```text
no_faktur → kd_pelanggan → nama_pelanggan, alamat
```

Artinya:

- `no_faktur` menentukan pelanggan.
- `kd_pelanggan` menentukan nama dan alamat pelanggan.

Jadi, `nama_pelanggan` dan `alamat` tidak langsung bergantung pada `no_faktur`, tetapi melalui `kd_pelanggan`.

Agar memenuhi 3NF, data pelanggan dipisahkan:

```text
Pelanggan(kd_pelanggan, nama_pelanggan, alamat)
Faktur(no_faktur, tgl_faktur, kd_pelanggan)
```

## Kesimpulan

- **1NF:** setiap kolom berisi satu nilai.
- **2NF:** tidak ada atribut yang hanya bergantung pada sebagian primary key.
- **3NF:** tidak ada atribut non-key yang bergantung pada atribut non-key lainnya.

Hasil akhirnya:

```text
Pelanggan(kd_pelanggan PK, nama_pelanggan, alamat)

Barang(kode_barang PK, nama_barang, harga_satuan)

Faktur(no_faktur PK, tgl_faktur, kd_pelanggan FK)

Detail_Faktur(
    no_faktur PK/FK,
    kode_barang PK/FK,
    jumlah,
    subtotal
)
```
