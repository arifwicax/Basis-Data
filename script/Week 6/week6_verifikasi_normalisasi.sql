DROP DATABASE IF EXISTS praktikum_normalisasi;
CREATE DATABASE praktikum_normalisasi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE praktikum_normalisasi;

CREATE TABLE Pelanggan (
  kode_pelanggan INT PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  nama_kontak VARCHAR(100),
  telepon VARCHAR(20)
);
CREATE TABLE Kasir (
  kode_kasir VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL
);
CREATE TABLE Barang (
  kode_barang VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL
);
CREATE TABLE Nota (
  nomor_nota INT PRIMARY KEY,
  tanggal DATE NOT NULL,
  kode_pelanggan INT NOT NULL,
  kode_kasir VARCHAR(10) NOT NULL,
  dp DECIMAL(14,2) NOT NULL DEFAULT 0 CHECK (dp >= 0),
  jatuh_tempo DATE,
  FOREIGN KEY (kode_pelanggan) REFERENCES Pelanggan(kode_pelanggan),
  FOREIGN KEY (kode_kasir) REFERENCES Kasir(kode_kasir)
);
CREATE TABLE DetailNota (
  nomor_nota INT NOT NULL,
  nomor_baris SMALLINT UNSIGNED NOT NULL,
  kode_barang VARCHAR(10) NOT NULL,
  jumlah INT UNSIGNED NOT NULL CHECK (jumlah > 0),
  harga_jual DECIMAL(14,2) NOT NULL CHECK (harga_jual >= 0),
  PRIMARY KEY (nomor_nota, nomor_baris),
  FOREIGN KEY (nomor_nota) REFERENCES Nota(nomor_nota),
  FOREIGN KEY (kode_barang) REFERENCES Barang(kode_barang)
);

INSERT INTO Pelanggan VALUES
(7831,'Toko ABC','Dion','085000000001'),
(4521,'Toko DEF','Sita','085000000002');
INSERT INTO Kasir VALUES ('K01','Anita');
INSERT INTO Barang VALUES
('B01','Monitor'),('B02','Mouse'),('B03','Hard Disk'),('B05','Keyboard');
INSERT INTO Nota VALUES
(83453,'2019-08-22',7831,'K01',1000000,'2019-08-30'),
(83457,'2019-08-22',4521,'K01',500000,'2019-08-29');
INSERT INTO DetailNota VALUES
(83453,1,'B01',2,1000000),(83453,2,'B05',3,200000),(83453,3,'B03',2,1200000),
(83457,1,'B02',1,125000),(83457,2,'B03',1,1250000),(83457,3,'B05',2,200000);

SELECT n.nomor_nota, n.tanggal, p.nama AS pelanggan, k.nama AS kasir,
       b.nama AS barang, d.jumlah, d.harga_jual,
       d.jumlah * d.harga_jual AS subtotal
FROM Nota n
JOIN Pelanggan p ON p.kode_pelanggan = n.kode_pelanggan
JOIN Kasir k ON k.kode_kasir = n.kode_kasir
JOIN DetailNota d ON d.nomor_nota = n.nomor_nota
JOIN Barang b ON b.kode_barang = d.kode_barang
ORDER BY n.nomor_nota, d.nomor_baris;

SELECT n.nomor_nota,
       SUM(d.jumlah * d.harga_jual) AS total,
       n.dp,
       SUM(d.jumlah * d.harga_jual) - n.dp AS kurang_bayar
FROM Nota n JOIN DetailNota d ON d.nomor_nota = n.nomor_nota
GROUP BY n.nomor_nota, n.dp;
