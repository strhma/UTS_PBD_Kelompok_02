USE uts_pbd_kelompok_02;

INSERT INTO mahasiswa (nim, nama, kelas, angkatan) VALUES
('IK2411001', 'Azizah Cahya', 'TI-A', 2024),
('IK2411002', 'Mayfaizha Zulaicha Latuconsina', 'TI-A', 2024),
('IK2411003', 'Siti Rahma', 'TI-B', 2024),
('IK2411004', 'Ade Fanjaya', 'TI-B', 2024),
('IK2411005', 'Muhammad Mahruf', 'TI-C', 2024),
('IK2411006', 'Dzubyan Fauzan', 'TI-C', 2024),
('IK2411007', 'Suharmina Aksan', 'TI-D', 2024),
('IK2411008', 'Winda Anugrah', 'TI-D', 2024),
('IK2411009', 'Nur Afni Ishar', 'TI-A', 2024),
('IK2411010', 'Nur Octavia', 'TI-C', 2024),
('IK2411011', 'M. Afrizal Fahrezy', 'TI-A', 2024),
('IK2411012', 'Muhammad Nur Alam', 'TI-A', 2024),
('IK2411013', 'Muh. Ardiansyah', 'TI-B', 2024),
('IK2411014', 'Arya Mahaputra', 'TI-B', 2024),
('IK2411015', 'Andi Dewa Firdaus', 'TI-C', 2024),
('IK2411016', 'Uminati', 'TI-C', 2024),
('IK2411017', 'Lisa Kely', 'TI-D', 2024),
('IK2411018', 'Nur Aisyah', 'TI-D', 2024),
('IK2411019', 'Lilis', 'TI-B', 2024),
('IK2411020', 'Hasriani', 'TI-D', 2024);

INSERT INTO dosen (kode_dosen, nama_dosen, email) VALUES
('D001', 'Abdul Malik, S.Kom., M.Cs.', 'abdul.malik@umbpalopo.ac.id'),
('D002', 'Dosen Kedua, S.Kom., M.T.', 'dosen.dua@umbpalopo.ac.id');

INSERT INTO mata_kuliah (kode_mk, nama_mk, sks, semester, kode_dosen) VALUES
('MK001', 'Pemrograman Basis Data', 3, 4, 'D001'),
('MK002', 'Sistem Operasi', 3, 4, 'D002'),
('MK003', 'Struktur Data', 3, 2, 'D001');

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

INSERT INTO nilai_praktikum (id_nilai, nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts, nilai_akhir, grade, bobot, status_lulus) VALUES
(1, 'IK2411001', 'MK001', 95, 90, 96, NULL, NULL, NULL, NULL),
(2, 'IK2411002', 'MK001', 85, 88, 90, NULL, NULL, NULL, NULL),
(3, 'IK2411003', 'MK001', 80, 82, 83, NULL, NULL, NULL, NULL),
(4, 'IK2411004', 'MK001', 75, 76, 80, NULL, NULL, NULL, NULL),
(5, 'IK2411005', 'MK001', 90, 92, 92, NULL, NULL, NULL, NULL),
(6, 'IK2411006', 'MK001', 70, 72, 75, NULL, NULL, NULL, NULL),
(7, 'IK2411007', 'MK001', 65, 66, 70, NULL, NULL, NULL, NULL),
(8, 'IK2411008', 'MK001', 60, 62, 65, NULL, NULL, NULL, NULL),
(9, 'IK2411009', 'MK001', 55, 56, 58, NULL, NULL, NULL, NULL),
(10, 'IK2411010', 'MK001', 40, 45, 48, NULL, NULL, NULL, NULL),
(11, 'IK2411011', 'MK002', 92, 95, 94, NULL, NULL, NULL, NULL),
(12, 'IK2411012', 'MK002', 84, 85, 87, NULL, NULL, NULL, NULL),
(13, 'IK2411013', 'MK002', 80, 81, 82, NULL, NULL, NULL, NULL),
(14, 'IK2411014', 'MK002', 74, 76, 78, NULL, NULL, NULL, NULL),
(15, 'IK2411015', 'MK002', 70, 71, 73, NULL, NULL, NULL, NULL),
(16, 'IK2411016', 'MK002', 65, 67, 69, NULL, NULL, NULL, NULL),
(17, 'IK2411017', 'MK003', 60, 61, 63, NULL, NULL, NULL, NULL),
(18, 'IK2411018', 'MK003', 55, 57, 59, NULL, NULL, NULL, NULL),
(19, 'IK2411019', 'MK003', 45, 47, 50, NULL, NULL, NULL, NULL),
(20, 'IK2411020', 'MK003', 30, 35, 38, NULL, NULL, NULL, NULL);