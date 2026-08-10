DROP DATABASE IF EXISTS sistem_akademik;
CREATE DATABASE sistem_akademik CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE sistem_akademik;

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
CREATE TABLE Jurusan (
  kode_jurusan VARCHAR(10) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  jenjang VARCHAR(10) NOT NULL,
  nip_kepala VARCHAR(20) NOT NULL UNIQUE,
  CONSTRAINT fk_jurusan_kepala FOREIGN KEY (nip_kepala) REFERENCES Dosen(nip)
);
CREATE TABLE Mahasiswa (
  nim VARCHAR(15) PRIMARY KEY,
  nama VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE,
  kode_jurusan VARCHAR(10) NOT NULL,
  nip_wali VARCHAR(20),
  nip_pembimbing VARCHAR(20),
  CONSTRAINT fk_mhs_jurusan FOREIGN KEY (kode_jurusan) REFERENCES Jurusan(kode_jurusan),
  CONSTRAINT fk_mhs_wali FOREIGN KEY (nip_wali) REFERENCES Dosen(nip),
  CONSTRAINT fk_mhs_pembimbing FOREIGN KEY (nip_pembimbing) REFERENCES Dosen(nip)
);
CREATE TABLE Mengajar (
  kode_mengajar VARCHAR(12) PRIMARY KEY,
  semester TINYINT UNSIGNED NOT NULL,
  tahun YEAR NOT NULL,
  nip VARCHAR(20) NOT NULL,
  kode_mk VARCHAR(10) NOT NULL,
  CONSTRAINT fk_mengajar_dosen FOREIGN KEY (nip) REFERENCES Dosen(nip),
  CONSTRAINT fk_mengajar_mk FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
  CONSTRAINT uq_mengajar UNIQUE (semester, tahun, nip, kode_mk)
);
CREATE TABLE Mengikuti (
  kode_mengajar VARCHAR(12) NOT NULL,
  nim VARCHAR(15) NOT NULL,
  nilai CHAR(2),
  PRIMARY KEY (kode_mengajar, nim),
  CONSTRAINT fk_mengikuti_mengajar FOREIGN KEY (kode_mengajar) REFERENCES Mengajar(kode_mengajar),
  CONSTRAINT fk_mengikuti_mhs FOREIGN KEY (nim) REFERENCES Mahasiswa(nim),
  CONSTRAINT chk_nilai CHECK (nilai IS NULL OR nilai IN ('A','AB','B','BC','C','D','E'))
);
CREATE TABLE Prasyarat (
  kode_mk VARCHAR(10) NOT NULL,
  kode_mk_prasyarat VARCHAR(10) NOT NULL,
  PRIMARY KEY (kode_mk, kode_mk_prasyarat),
  CONSTRAINT fk_prasyarat_mk FOREIGN KEY (kode_mk) REFERENCES MataKuliah(kode_mk),
  CONSTRAINT fk_prasyarat_syarat FOREIGN KEY (kode_mk_prasyarat) REFERENCES MataKuliah(kode_mk),
  CONSTRAINT chk_prasyarat_bukan_diri CHECK (kode_mk <> kode_mk_prasyarat)
);

INSERT INTO Dosen VALUES
('123345','Eri','eri@example.test'),
('223344','Bima','bima@example.test'),
('222333','Ervan','ervan@example.test');
INSERT INTO MataKuliah VALUES
('MK001','Basis Data',2), ('MK002','Pemrograman Web',3), ('MK003','PBO',3);
INSERT INTO Jurusan VALUES
('J001','JMTI','S1','123345'),
('J002','JSTPK','S1','223344'),
('J003','JTIP','S1','222333');
INSERT INTO Mahasiswa VALUES
('10202101','Doni','doni@example.test','J002','223344',NULL),
('10202102','Dika','dika@example.test','J001','123345',NULL),
('10202103','Fitri','fitri@example.test','J003','222333',NULL),
('10202104','Erna','erna@example.test','J002','223344',NULL);
INSERT INTO Mengajar VALUES
('KM001',3,2022,'123345','MK002'),
('KM002',2,2022,'223344','MK001');
INSERT INTO Mengikuti VALUES
('KM001','10202101','A'), ('KM002','10202102','B');
INSERT INTO Prasyarat VALUES ('MK002','MK003');

SELECT m.nim, m.nama, mk.nama AS mata_kuliah, d.nama AS dosen,
       mg.semester, mg.tahun, k.nilai
FROM Mengikuti k
JOIN Mahasiswa m ON m.nim = k.nim
JOIN Mengajar mg ON mg.kode_mengajar = k.kode_mengajar
JOIN MataKuliah mk ON mk.kode_mk = mg.kode_mk
JOIN Dosen d ON d.nip = mg.nip
ORDER BY m.nim;
