CREATE DATABASE IF NOT EXISTS uts_pbd_kelompok_02;
USE uts_pbd_kelompok_02;

CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    kelas VARCHAR(10) NOT NULL,
    angkatan INT NOT NULL
);

CREATE TABLE dosen (
    kode_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    kode_dosen VARCHAR(10),
    FOREIGN KEY (kode_dosen) REFERENCES dosen(kode_dosen)
);

CREATE TABLE grade_nilai (
    grade VARCHAR(5) PRIMARY KEY,
    bobot DECIMAL(3,2) NOT NULL,
    nilai_bawah DECIMAL(5,2) NOT NULL,
    nilai_atas DECIMAL(5,2) NOT NULL
);

CREATE TABLE nilai_praktikum (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15),
    kode_mk VARCHAR(10),
    nilai_tugas DECIMAL(5,2) NOT NULL,
    nilai_kuis DECIMAL(5,2) NOT NULL,
    nilai_uts DECIMAL(5,2) NOT NULL,
    nilai_akhir DECIMAL(5,2) NULL,
    grade VARCHAR(5) NULL,
    bobot DECIMAL(3,2) NULL,
    status_lulus VARCHAR(15) NULL,
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim),
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk),
    FOREIGN KEY (grade) REFERENCES grade_nilai(grade)
);

CREATE TABLE log_rekap_nilai (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15),
    kode_mk VARCHAR(10),
    nilai_akhir DECIMAL(5,2),
    grade VARCHAR(5),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(15),
    keterangan VARCHAR(255),
    waktu_proses TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);