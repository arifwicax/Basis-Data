DROP DATABASE IF EXISTS praktikum_join;
CREATE DATABASE praktikum_join;
USE praktikum_join;
CREATE TABLE universitas (jurusan VARCHAR(30) PRIMARY KEY, tgl_berdiri DATE, nama_dekan VARCHAR(60), jum_mhs SMALLINT UNSIGNED, akr ENUM('A','B','C','N/A'));
CREATE TABLE mahasiswa (id_mahasiswa INT AUTO_INCREMENT PRIMARY KEY, nama VARCHAR(50), asal VARCHAR(50), kel ENUM('L','P'), tinggi TINYINT UNSIGNED, jurusan VARCHAR(30), nilai_uan DECIMAL(5,2), INDEX(jurusan));
INSERT INTO universitas VALUES
('Kimia','1987-07-12','Prof. Mulyono',662,'B'),('Ilmu Komputer','2003-02-23','Dr. Syahrial',412,'A'),('Akuntansi','1985-03-19','Maya Fitrianti',895,'B'),('Farmasi','1997-05-30','Prof. Silvia',312,'C'),('Fisika','1989-12-10','Dr. Umar',275,'A'),('Hukum','1983-08-08','Prof. Gunarto',754,'B');
INSERT INTO mahasiswa (nama,asal,kel,tinggi,jurusan,nilai_uan) VALUES
('Riana Putria','Padang','P',155,'Kimia',339.20),('Rudi Permana','Bandung','L',163,'Ilmu Komputer',290.44),('Sari Citra','Jakarta','P',161,'Manajemen',310.60),('Rina Kumala','Jakarta','P',158,'Akuntansi',337.99),('James Situmorang','Medan','L',168,'Kedokteran Gigi',341.10),('Sandri Fatmala','Bandung','P',165,'Ilmu Komputer',322.91),('Husli Khairan','Jakarta','L',170,'Akuntansi',288.55),('Christine Wijaya','Medan','P',157,'Manajemen',321.74),('Ikhsan Prayoga','Jakarta','L',172,'Ilmu Komputer',300.16),('Bobby Permana','Medan','L',161,'Ilmu Komputer',280.82);
SELECT m.nama,m.jurusan,u.nama_dekan FROM mahasiswa m INNER JOIN universitas u ON u.jurusan=m.jurusan;
SELECT m.nama,m.jurusan,u.nama_dekan FROM mahasiswa m LEFT JOIN universitas u ON u.jurusan=m.jurusan;
SELECT m.nama,u.jurusan,u.nama_dekan FROM mahasiswa m RIGHT JOIN universitas u ON u.jurusan=m.jurusan;
SELECT m.nama,m.jurusan FROM mahasiswa m LEFT JOIN universitas u ON u.jurusan=m.jurusan WHERE u.jurusan IS NULL;
SELECT u.jurusan,COUNT(m.id_mahasiswa) jumlah,ROUND(AVG(m.nilai_uan),2) rata_nilai FROM universitas u LEFT JOIN mahasiswa m ON m.jurusan=u.jurusan GROUP BY u.jurusan;
