USE uts_pbd_kelompok_03;

-- Input Data Dosen (2 Dosen)
INSERT INTO dosen (kode_dosen, nama_dosen, email) VALUES
('D001', 'Abdul Malik, S.Kom., M.Cs.', 'abdul.malik@megabuana.ac.id'),
('D002', 'M HASANUDDIN, S.Kom., M.Kom.', 'hasanuddin.@megabuana.ac.id');

-- Input Data Mata Kuliah (3 MK)
INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, semester, kode_dosen) VALUES
('MK001', 'Pemrograman Basis Data', 3, 4, 'D001'),
('MK002', 'Struktur Data', 3, 2, 'D002'),
('MK003', 'Sistem Operasi', 3, 4, 'D001');

-- Input Data Acuan Standar Grade Nilai (10 Baris Sesuai Tabel Bagian G)
INSERT INTO grade_nilai (grade, bobot, nilai_bawah, nilai_atas) VALUES
('A', 4.00, 93.00, 100.00),
('A-', 3.75, 85.00, 92.99),
('B+', 3.50, 81.00, 84.99),
('B', 3.25, 75.00, 80.99),
('B-', 3.00, 71.00, 74.99),
('C+', 2.75, 66.00, 70.99),
('C', 2.50, 61.00, 65.99),
('C-', 2.00, 56.00, 60.99),
('D', 1.00, 40.00, 55.99),
('E', 0.00, 0.00, 39.99);

-- Input Data Mahasiswa (20 Mahasiswa)
INSERT INTO mahasiswa (nim, nama, kelas, angkatan) VALUES
('IK2411001', 'Azizah Cahya', 'TI-A', 2024), ('IK2411011', 'M. Afrizal Fahrezy', 'TI-A', 2024),
('IK2411002', 'Mayfaizha Zulaicha Latuconsina', 'TI-A', 2024), ('IK2411012', 'Muhammad Nur Alam', 'TI-A', 2024),
('IK2411003', 'Siti Rahma', 'TI-B', 2024), ('IK2411013', 'Muh. Ardiansyah', 'TI-B', 2024),
('IK2411004', 'Ade Fanjaya', 'TI-B', 2024), ('IK2411014', 'Arya Mahaputra', 'TI-B', 2024),
('IK2411005', 'Muhammad Mahruf', 'TI-C', 2024), ('IK2411015', 'Andi Dewa Firdaus', 'TI-C', 2024),
('IK2411006', 'Dzubyan Fauzan', 'TI-C', 2024), ('IK2411016', 'Uminati', 'TI-C', 2024),
('IK2411007', 'Suharnina Aksan', 'TI-D', 2024), ('IK2411017', 'Lisa Kely', 'TI-D', 2024),
('IK2411008', 'Winda Anugrah', 'TI-D', 2024), ('IK2411018', 'Nur Aisyah', 'TI-D', 2024),
('IK2411009', 'Nur Afni Ishar', 'TI-A', 2024), ('IK2411019', 'Lilis', 'TI-B', 2024),
('IK2411010', 'Nur Octavia', 'TI-C', 2024), ('IK2411020', 'Hasriani', 'TI-D', 2024);

-- Input Data Nilai Praktikum Bergradasi Bervariasi (20 Data)
INSERT INTO nilai_praktikum (nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts) VALUES
('202401001', 'MK001', 95.00, 90.00, 92.00), ('202401002', 'MK001', 80.00, 85.00, 90.00),
('202401003', 'MK001', 70.00, 75.00, 80.00), ('202401004', 'MK001', 60.00, 65.00, 55.00),
('202401005', 'MK001', 40.00, 35.00, 45.00), ('202401006', 'MK002', 88.00, 82.00, 85.00),
('202401007', 'MK002', 78.00, 74.00, 80.00), ('202401008', 'MK002', 92.00, 95.00, 90.00),
('202401009', 'MK002', 65.00, 70.00, 60.00), ('202401010', 'MK002', 50.00, 55.00, 48.00),
('202401011', 'MK003', 85.00, 90.00, 88.00), ('202401012', 'MK003', 72.00, 75.00, 78.00),
('202401013', 'MK003', 90.00, 92.00, 95.00), ('202401014', 'MK003', 60.00, 58.00, 62.00),
('202401015', 'MK003', 30.00, 40.00, 35.00), ('202401016', 'MK001', 85.00, 80.00, 85.00),
('202401017', 'MK002', 77.00, 83.00, 79.00), ('202401018', 'MK003', 91.00, 89.00, 94.00),
('202401019', 'MK001', 68.00, 72.00, 70.00), ('202401020', 'MK002', 55.00, 60.00, 58.00);
