DROP DATABASE IF EXISTS sistem_akademik;
CREATE DATABASE sistem_akademik CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistem_akademik;

CREATE TABLE Jurusan (
  kode_jurusan VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  jenjang VARCHAR(10) NOT NULL
);

CREATE TABLE Dosen (
  nip VARCHAR(20) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE
);

CREATE TABLE MataKuliah (
  kode_mk VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  sks TINYINT UNSIGNED NOT NULL,
  CONSTRAINT chk_mk_sks CHECK (sks BETWEEN 1 AND 6)
);

CREATE TABLE Mahasiswa (
  nim VARCHAR(15) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  kode_jurusan VARCHAR(10) NOT NULL,
  CONSTRAINT fk_mahasiswa_jurusan FOREIGN KEY (kode_jurusan)
    REFERENCES Jurusan(kode_jurusan)
);

INSERT INTO Jurusan VALUES
('J001', 'JMTI', 'S1'), ('J002', 'JSTPK', 'S1'), ('J003', 'JTIP', 'S1');
INSERT INTO Dosen VALUES
('123345', 'Eri', 'eri@example.test'),
('223344', 'Bima', 'bima@example.test'),
('222333', 'Ervan', 'ervan@example.test');
INSERT INTO MataKuliah VALUES
('MK001', 'Basis Data', 2),
('MK002', 'Pemrograman Web', 3),
('MK003', 'PBO', 3);
INSERT INTO Mahasiswa VALUES
('10202101', 'Doni', 'doni@example.test', 'J002'),
('10202102', 'Dika', 'dika@example.test', 'J001'),
('10202103', 'Fitri', 'fitri@example.test', 'J003'),
('10202104', 'Erna', 'erna@example.test', 'J002');

SELECT m.nim, m.nama, j.nama AS jurusan
FROM Mahasiswa m JOIN Jurusan j ON j.kode_jurusan = m.kode_jurusan
ORDER BY m.nim;
