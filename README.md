# UTS Pemrograman Basis Data - Kelompok 02

## 📝 Judul Projek
**Sistem Rekap Nilai Praktikum Mahasiswa**

## 👥 Nama Kelompok & Anggota
* **Nama Kelompok:** Kelompok 02
* **Daftar Anggota:**
  1. [Azizah Cahya] - [IK2411042]
  2. [Mayfaizha Zulaicha Latuconsina] - [IK2411041]
  3. [Muhammad Mahruf] - [IK2411061]
  4. [Ade Fanjaya] - [IK2411033]
  5. [Sitti Rahma] - [IK2411048]

---

## 📄 Deskripsi Sistem
Sistem Rekap Nilai Praktikum Mahasiswa adalah sebuah sistem database relasional berbasis MySQL yang dirancang untuk membantu dosen program studi S1 Informatika dalam mengelola, menghitung, dan mencatat nilai praktikum mahasiswa secara otomatis dan terintegrasi. 

Sistem ini memiliki kemampuan untuk:
1. Menyimpan data utama mahasiswa, dosen, dan mata kuliah.
2. Menghitung Nilai Akhir secara otomatis berdasarkan rumus persentase bobot: `(Tugas * 30%) + (Kuis * 30%) + (UTS * 40%)`.
3. Menentukan *Grade* huruf (A hingga E) beserta bobot nilainya berdasarkan skala yang ditentukan.
4. Mengklasifikasikan status kelulusan mahasiswa dengan batas minimal kelulusan adalah Grade C.
5. Mencatat setiap riwayat proses rekap nilai secara otomatis ke dalam tabel log transaksi rekap.

---

## 📊 Struktur Tabel
Sistem ini menggunakan minimal 6 tabel yang saling berelasi:

1. **`mahasiswa`** (Menyimpan data identitas mahasiswa)
   * `nim` (VARCHAR, Primary Key)
   * `nama` (VARCHAR)
   * `kelas` (VARCHAR)
   * `angkatan` (INT)

2. **`dosen`** (Menyimpan data dosen pengampu)
   *`kode_dosen` (VARCHAR, Primary Key)
   * `nama_dosen` (VARCHAR)
   * `email` (VARCHAR)

3. **`mata_kuliah`** (Menyimpan data mata kuliah yang tersedia)
   * `kode_mk` (VARCHAR, Primary Key)
   * `nama_mk` (VARCHAR)
   * `sks` (INT)
   * `semester` (INT)
   * `kode_dosen` (VARCHAR, Foreign Key -> `dosen`)

4. **`grade_nilai`** (Menyimpan standar acuan kelulusan dan bobot)
   * `grade` (VARCHAR, Primary Key)
   * `bobot` (DECIMAL)
   * `nilai_bawah` (DECIMAL)
   * `nilai_atas` (DECIMAL)

5. **`nilai_praktikum`** (Menyimpan komponen nilai mentah dan hasil kalkulasi akhir)
   * `id_nilai` (INT, Primary Key)
   * `nim` (VARCHAR, Foreign Key -> `mahasiswa`)
   * `kode_mk` (VARCHAR, Foreign Key -> `mata_kuliah`)
   * `nilai_tugas`, `nilai_kuis`, `nilai_uts` (DECIMAL)
   * [cite_start]`nilai_akhir` (DECIMAL, Diisi via procedure)
   * `grade` (VARCHAR, Foreign Key -> `grade_nilai`, Diisi via procedure)
   * `bobot` (DECIMAL, Diisi via procedure)
   * `status_lulus` (VARCHAR, Diisi via procedure)

6. **`log_rekap_nilai`** (Mencatat riwayat audit operasional dari Stored Procedure)
   * `id_log` (INT, Primary Key, Auto Increment)
   * `nim`, `kode_mk`, `nilai_akhir`, `grade`, `bobot`, `status_lulus` (Menyimpan data histori kalkulasi)
   * `keterangan` (VARCHAR) [cite: 98]
   * `waktu_proses` (TIMESTAMP, Terisi otomatis saat eksekusi)

---

## 🛠️ Cara Menjalankan Program
Ikuti langkah-langkah berikut untuk menjalankan program di lingkungan lokal Anda (XAMPP / phpMyAdmin)

1. Buka kontrol panel **XAMPP** dan aktifkan layanan **Apache** dan **MySQL**.
2. Masuk ke halaman **phpMyAdmin** melalui peramban (`http://localhost/phpmyadmin`).
3. Buat database baru bernama **`uts_pbd_kelompok_02`**.
4. Buka tab **SQL** atau menu **Import**, lalu jalankan file dengan urutan eksekusi berikut:
   * `database.sql` (Untuk membuat skema dan seluruh struktur tabel beserta relasi)
   * `data_awal.sql` (Untuk mengisi minimal 20 data master awal)
   * `procedure_rekap_nilai.sql` (Untuk mengompilasi logika *Stored Procedure* ke dalam database)
5. Untuk menguji sistem, buka file `query_pengujian.sql` lalu salin dan jalankan kodenya di tab SQL phpMyAdmin.

---

## ⚙️ Daftar Stored Procedure
Projek ini dilengkapi dengan dua fungsi utama penyimpanan perintah (*Stored Procedure*):

1. **`rekap_semua_nilai()`**
   * **Deskripsi:** Memproses rekap semua nilai mahasiswa yang terdaftar di tabel `nilai_praktikum` secara menyeluruh
   * **Fitur Pemrograman:** Menggunakan kombinasi variabel lokal, perulangan `LOOP`/`WHILE`, serta mekanisme **Explicit Cursor** untuk melakukan pembacaan per baris tabel secara sekuensial, melakukan kalkulasi, dan mencatat riwayat log. Menampilkan total baris data yang diproses memanfaatkan **Implicit Cursor** (`ROW_COUNT()`).

2. **`rekap_nilai_per_mk(p_kode_mk)`** 
   * **Deskripsi:** Melakukan pemrosesan kalkulasi rekap nilai secara spesifik yang difilter berdasarkan kode mata kuliah tertentu.
   * **Fitur Pemrograman:** Mengimplementasikan konsep **Cursor dengan Parameter** di mana filter input diintegrasikan ke dalam pernyataan kueri cursor.

---

## 🤝 Pembagian Tugas Anggota Kelompok
*(Sesuaikan dengan jumlah anggota kelompokmu yang tertera pada Halaman 11 berkas soal)*

* **Anggota 1 ([Azizah Cahya])**: Bertanggung jawab penuh atas pembuatan struktur database, skema tabel, pembuatan relasi constraint, dan penyusunan file `data_awal.sql`.
* **Anggota 2 ([Mayfaizha Zulaicha Latuconsina])**: Mengimplementasikan penulisan kode untuk bagian kalkulasi dan perhitungan nilai akhir menggunakan variabel lokal di dalam prosedur.
* **Anggota 3 ([Muhammad Mahruf])**: Menyusun logika struktur kontrol percabangan untuk penentuan grade, bobot, status kelulusan, dan implementasi perulangan cursor.
* **Anggota 4 ([Ade Fanjaya])**: Bertanggung jawab menyusun mekanisme penulisan log rekap nilai, penulisan kueri *Explicit Cursor*, *Implicit Cursor*, dan pembuatan dokumentasi file laporan utama.
* **Anggota 5 ([Sitti Rahma])**: Mengelola administrasi repository GitHub (README, repositori), pengujian program (`query_pengujian.sql`), dan dokumentasi file pendukung.

---

## 📸 Screenshot Hasil Program

### 1. Data Awal Log Rekap Nilai Kosong
![Tabel Log Kosong di Awal](path_atau_nama_file_gambar_log_kosong.jpg)

### 2. Eksekusi Stored Procedure Berhasil
![Hasil Jalankan Procedure](path_atau_nama_file_gambar_call_procedure.jpg)

### 3. Tabel Nilai Praktikum Terisi Otomatis Setelah Diproses
![Hasil Akhir Nilai Praktikum](path_atau_nama_file_gambar_nilai_praktikum_sukses.jpg)

### 4. Tabel Log Rekap Nilai Menyimpan Riwayat Log Transaksi
![Hasil Akhir Log Rekap](path_atau_nama_file_gambar_log_rekap_sukses.jpg)