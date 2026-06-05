USE uts_pbd_kelompok_02;

DELIMITER //

CREATE PROCEDURE rekap_semua_nilai()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_nim VARCHAR(15);
    DECLARE v_mk VARCHAR(10);
    DECLARE v_tugas DECIMAL(5,2);
    DECLARE v_kuis DECIMAL(5,2);
    DECLARE v_uts DECIMAL(5,2);
    DECLARE v_akhir DECIMAL(5,2);
    DECLARE v_grade VARCHAR(5);
    DECLARE v_bobot DECIMAL(3,2);
    DECLARE v_status VARCHAR(15);
    DECLARE v_counter INT DEFAULT 0;
    
    DECLARE cur CURSOR FOR 
        SELECT id_nilai, nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts 
        FROM nilai_praktikum;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_id, v_nim, v_mk, v_tugas, v_kuis, v_uts;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET v_akhir = (v_tugas * 0.30) + (v_kuis * 0.30) + (v_uts * 0.40);
        
        IF v_akhir BETWEEN 93.00 AND 100.00 THEN
            SET v_grade = 'A', v_bobot = 4.00, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 85.00 AND 92.99 THEN
            SET v_grade = 'A-', v_bobot = 3.75, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 81.00 AND 84.99 THEN
            SET v_grade = 'B+', v_bobot = 3.50, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 75.00 AND 80.99 THEN
            SET v_grade = 'B', v_bobot = 3.25, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 71.00 AND 74.99 THEN
            SET v_grade = 'B-', v_bobot = 3.00, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 66.00 AND 70.99 THEN
            SET v_grade = 'C+', v_bobot = 2.75, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 61.00 AND 65.99 THEN
            SET v_grade = 'C', v_bobot = 2.50, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 56.00 AND 60.99 THEN
            SET v_grade = 'C-', v_bobot = 2.00, v_status = 'TIDAK LULUS';
        ELSEIF v_akhir BETWEEN 40.00 AND 55.99 THEN
            SET v_grade = 'D', v_bobot = 1.00, v_status = 'TIDAK LULUS';
        ELSE
            SET v_grade = 'E', v_bobot = 0.00, v_status = 'TIDAK LULUS';
        END IF;
        
        UPDATE nilai_praktikum 
        SET nilai_akhir = v_akhir, grade = v_grade, bobot = v_bobot, status_lulus = v_status 
        WHERE id_nilai = v_id;
        
        IF ROW_COUNT() >= 0 THEN
            SET v_counter = v_counter + 1;
        END IF;
        
        INSERT INTO log_rekap_nilai (nim, kode_mk, nilai_akhir, grade, bobot, status_lulus, keterangan)
        VALUES (v_nim, v_mk, v_akhir, v_grade, v_bobot, v_status, 'Rekapitulasi semua nilai sukses');
    END LOOP;
    
    CLOSE cur;
    
    SELECT v_counter AS jumlah_data_diproses;
    
    SELECT m.nim, m.nama, m.kelas, n.kode_mk, n.nilai_akhir, n.grade, n.status_lulus 
    FROM nilai_praktikum n
    JOIN mahasiswa m ON n.nim = m.nim;
END //

CREATE PROCEDURE rekap_nilai_per_mk(IN p_kode_mk VARCHAR(10))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_id INT;
    DECLARE v_nim VARCHAR(15);
    DECLARE v_mk VARCHAR(10);
    DECLARE v_tugas DECIMAL(5,2);
    DECLARE v_kuis DECIMAL(5,2);
    DECLARE v_uts DECIMAL(5,2);
    DECLARE v_akhir DECIMAL(5,2);
    DECLARE v_grade VARCHAR(5);
    DECLARE v_bobot DECIMAL(3,2);
    DECLARE v_status VARCHAR(15);
    DECLARE v_counter INT DEFAULT 0;
    
    DECLARE cur CURSOR FOR 
        SELECT id_nilai, nim, kode_mk, nilai_tugas, nilai_kuis, nilai_uts 
        FROM nilai_praktikum 
        WHERE kode_mk = p_kode_mk;
        
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    
    read_loop: LOOP
        FETCH cur INTO v_id, v_nim, v_mk, v_tugas, v_kuis, v_uts;
        IF done THEN
            LEAVE read_loop;
        END IF;
        
        SET v_akhir = (v_tugas * 0.30) + (v_kuis * 0.30) + (v_uts * 0.40);
        
        IF v_akhir BETWEEN 93.00 AND 100.00 THEN
            SET v_grade = 'A', v_bobot = 4.00, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 85.00 AND 92.99 THEN
            SET v_grade = 'A-', v_bobot = 3.75, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 81.00 AND 84.99 THEN
            SET v_grade = 'B+', v_bobot = 3.50, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 75.00 AND 80.99 THEN
            SET v_grade = 'B', v_bobot = 3.25, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 71.00 AND 74.99 THEN
            SET v_grade = 'B-', v_bobot = 3.00, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 66.00 AND 70.99 THEN
            SET v_grade = 'C+', v_bobot = 2.75, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 61.00 AND 65.99 THEN
            SET v_grade = 'C', v_bobot = 2.50, v_status = 'LULUS';
        ELSEIF v_akhir BETWEEN 56.00 AND 60.99 THEN
            SET v_grade = 'C-', v_bobot = 2.00, v_status = 'TIDAK LULUS';
        ELSEIF v_akhir BETWEEN 40.00 AND 55.99 THEN
            SET v_grade = 'D', v_bobot = 1.00, v_status = 'TIDAK LULUS';
        ELSE
            SET v_grade = 'E', v_bobot = 0.00, v_status = 'TIDAK LULUS';
        END IF;
        
        UPDATE nilai_praktikum 
        SET nilai_akhir = v_akhir, grade = v_grade, bobot = v_bobot, status_lulus = v_status 
        WHERE id_nilai = v_id;
        
        IF ROW_COUNT() >= 0 THEN
            SET v_counter = v_counter + 1;
        END IF;
        
        INSERT INTO log_rekap_nilai (nim, kode_mk, nilai_akhir, grade, bobot, status_lulus, keterangan)
        VALUES (v_nim, v_mk, v_akhir, v_grade, v_bobot, v_status, 'Rekapitulasi nilai per mata kuliah sukses');
    END LOOP;
    
    CLOSE cur;
    
    SELECT v_counter AS jumlah_data_diproses;
    
    SELECT m.nim, m.nama, m.kelas, n.kode_mk, n.nilai_akhir, n.grade, n.status_lulus 
    FROM nilai_praktikum n
    JOIN mahasiswa m ON n.nim = m.nim
    WHERE n.kode_mk = p_kode_mk;
END //

DELIMITER ;