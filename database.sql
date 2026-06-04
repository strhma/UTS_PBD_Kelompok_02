-- 1. Membuat Database sesuai format ketentuan
CREATE DATABASE uts_pbd_kelompok_03;
USE uts_pbd_kelompok_02;

-- 2. Membuat Tabel Mahasiswa (Min. 20 Data)
CREATE TABLE mahasiswa (
    nim VARCHAR(15) PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    kelas VARCHAR(10) NOT NULL,
    angkatan INT NOT NULL
);

-- 3. Membuat Tabel Dosen (Min. 2 Data)
CREATE TABLE dosen (
    kode_dosen VARCHAR(10) PRIMARY KEY,
    nama_dosen VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL
);

-- 4. Membuat Tabel Mata Kuliah (Min. 3 Data)
CREATE TABLE mata_kuliah (
    kode_mk VARCHAR(10) PRIMARY KEY,
    nama_mk VARCHAR(100) NOT NULL,
    sks INT NOT NULL,
    semester INT NOT NULL,
    kode_dosen VARCHAR(10),
    FOREIGN KEY (kode_dosen) REFERENCES dosen(kode_dosen) ON UPDATE CASCADE ON DELETE SET NULL
);

-- 5. Membuat Tabel Grade Nilai (10 Data sesuai Ketentuan Bagian G)
CREATE TABLE grade_nilai (
    grade VARCHAR(2) PRIMARY KEY,
    bobot DECIMAL(3,2) NOT NULL,
    nilai_bawah DECIMAL(5,2) NOT NULL,
    nilai_atas DECIMAL(5,2) NOT NULL
);

-- 6. Membuat Tabel Nilai Praktikum (Min. 20 Data)
CREATE TABLE nilai_praktikum (
    id_nilai INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15) NOT NULL,
    kode_mk VARCHAR(10) NOT NULL,
    nilai_tugas DECIMAL(5,2) NOT NULL,
    nilai_kuis DECIMAL(5,2) NOT NULL,
    nilai_uts DECIMAL(5,2) NOT NULL,
    nilai_akhir DECIMAL(5,2) DEFAULT NULL,
    grade VARCHAR(2) DEFAULT NULL,
    bobot DECIMAL(3,2) DEFAULT NULL,
    status_lulus VARCHAR(15) DEFAULT NULL,
    FOREIGN KEY (nim) REFERENCES mahasiswa(nim) ON UPDATE CASCADE,
    FOREIGN KEY (kode_mk) REFERENCES mata_kuliah(kode_mk) ON UPDATE CASCADE
);

-- 7. Membuat Tabel Log Rekap Nilai (Kosong di Awal)
CREATE TABLE log_rekap_nilai (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    nim VARCHAR(15),
    kode_mk VARCHAR(10),
    nilai_akhir DECIMAL(5,2),
    grade VARCHAR(2),
    bobot DECIMAL(3,2),
    status_lulus VARCHAR(15),
    keterangan VARCHAR(255),
    waktu_proses TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

