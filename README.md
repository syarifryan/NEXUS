# Product Requirements Document (PRD)

# NEXUS

## National Electronic X-sectional User Survey

### 1. Ringkasan Produk

NEXUS (National Electronic X-sectional User Survey) merupakan aplikasi mobile berbasis Android yang dikembangkan oleh MSJ-Createch untuk mendukung pengumpulan data survei dan sensus secara digital. Aplikasi ini memungkinkan petugas lapangan mengakses daftar sampel, melakukan wawancara, mengisi kuesioner elektronik, melakukan validasi data secara otomatis, serta melakukan sinkronisasi hasil pencacahan ke server pusat baik secara online maupun offline.

---

### 2. Latar Belakang

Proses pengumpulan data survei secara konvensional masih menghadapi berbagai tantangan, seperti kesalahan pencatatan, keterlambatan validasi, biaya operasional yang tinggi, dan kesulitan dalam melakukan monitoring progres lapangan secara real-time.

Untuk mengatasi permasalahan tersebut, MSJ-Createch mengembangkan NEXUS sebagai platform survei digital yang mampu meningkatkan efisiensi operasional, kualitas data, dan kecepatan pengambilan keputusan berbasis data.

---

### 3. Tujuan Produk

#### Tujuan Bisnis

- Menyediakan platform survei digital yang terintegrasi.
- Meningkatkan kualitas dan akurasi data lapangan.
- Mengurangi biaya operasional survei berbasis kertas.
- Mendukung monitoring dan evaluasi secara real-time.

#### Tujuan Pengguna

- Mempermudah proses pencacahan lapangan.
- Mengurangi kesalahan pengisian data.
- Memungkinkan pengumpulan data tanpa koneksi internet.
- Mempercepat proses pelaporan dan sinkronisasi data.

---

### 4. Stakeholder

| Stakeholder                 | Peran                                    |
| --------------------------- | ---------------------------------------- |
| MSJ-Createch Management     | Pengambil keputusan dan pengelola produk |
| Product Owner               | Menentukan kebutuhan bisnis              |
| Tim Pengembang              | Mengembangkan dan memelihara sistem      |
| Administrator               | Mengelola pengguna dan survei            |
| Supervisor                  | Memantau kualitas dan progres survei     |
| Enumerator/Petugas Lapangan | Melakukan pengumpulan data               |
| Responden                   | Memberikan informasi survei              |

---

### 5. User Persona

#### Enumerator

- Menggunakan perangkat Android.
- Bertanggung jawab melakukan wawancara dan input data.
- Membutuhkan aplikasi yang mudah digunakan dan dapat berjalan secara offline.

#### Supervisor

- Memantau progres enumerator.
- Memeriksa kualitas data.
- Memberikan persetujuan atau revisi hasil survei.

#### Administrator

- Mengelola survei dan kuesioner.
- Mengatur hak akses pengguna.
- Memantau performa sistem.

---

### 6. Ruang Lingkup Produk

#### In Scope

- Login dan autentikasi pengguna.
- Manajemen survei.
- Manajemen responden.
- Pengisian kuesioner digital.
- Validasi data otomatis.
- Pengambilan koordinat GPS.
- Dokumentasi foto.
- Sinkronisasi online dan offline.
- Dashboard monitoring.
- Manajemen pengguna.

#### Out of Scope

- Analisis statistik lanjutan.
- Data mining dan machine learning.
- Publikasi hasil survei nasional.
- Sistem Business Intelligence eksternal.

---

### 7. Fitur Utama

#### 7.1 User Authentication

- Login menggunakan akun terdaftar.
- Logout.
- Reset password.
- Session management.

#### 7.2 Dashboard

- Ringkasan progres survei.
- Jumlah responden.
- Status sinkronisasi.
- Statistik pencacahan harian.

#### 7.3 Survey Management

- Membuat survei baru.
- Mengelola daftar survei.
- Menentukan target responden.
- Distribusi survei ke enumerator.

#### 7.4 Questionnaire Module

- Pengisian kuesioner digital.
- Conditional branching.
- Skip logic.
- Penyimpanan draft.
- Auto-save.

#### 7.5 Data Validation

- Mandatory field validation.
- Range validation.
- Format validation.
- Consistency checking.

#### 7.6 GPS Tracking

- Pengambilan lokasi survei.
- Verifikasi keberadaan enumerator.
- Penyimpanan koordinat geografis.

#### 7.7 Photo Documentation

- Pengambilan foto responden atau objek survei (jika diperlukan).
- Kompresi gambar otomatis.
- Penyimpanan lokal dan cloud.

#### 7.8 Offline Synchronization

- Penyimpanan data lokal.
- Sinkronisasi otomatis ketika koneksi tersedia.
- Conflict resolution mechanism.

#### 7.9 Monitoring & Supervision

- Monitoring progres survei.
- Pemeriksaan hasil wawancara.
- Approval atau revisi data.

---

### 8. User Flow

#### Enumerator

Login → Dashboard → Daftar Survei → Pilih Responden → Isi Kuesioner → Validasi → Simpan → Sinkronisasi

#### Supervisor

Login → Dashboard Monitoring → Review Data → Approve/Revisi

#### Administrator

Login → Dashboard Admin → Kelola Pengguna → Kelola Survei → Monitoring Sistem

---

### 9. Kebutuhan Non-Fungsional

#### Performance

- Waktu respon aplikasi < 3 detik.
- Sinkronisasi data < 30 detik untuk 100 record.

#### Security

- HTTPS/TLS Encryption.
- JWT Authentication.
- Role-Based Access Control (RBAC).
- Data Encryption at Rest.

#### Reliability

- System Availability ≥ 99%.
- Automatic Data Backup.
- Recovery Mechanism.

#### Compatibility

- Android 10 atau lebih tinggi.
- Berbagai ukuran layar smartphone dan tablet.

---

### 10. Arsitektur Sistem

Frontend:

- Flutter

Backend:

- Node.js (Express.js)

Database:

- PostgreSQL

Storage:

- Cloud Object Storage

Deployment:

- AWS / Azure / Google Cloud Platform

---

### 11. KPI Produk

| KPI                               | Target    |
| --------------------------------- | --------- |
| Tingkat keberhasilan sinkronisasi | ≥ 98%     |
| Tingkat error data                | ≤ 2%      |
| Kepuasan pengguna                 | ≥ 85%     |
| Availability sistem               | ≥ 99%     |
| Waktu respon aplikasi             | ≤ 3 detik |

---

### 12. Risiko dan Mitigasi

| Risiko                  | Mitigasi                        |
| ----------------------- | ------------------------------- |
| Tidak tersedia internet | Offline Mode                    |
| Kehilangan perangkat    | Sinkronisasi berkala            |
| Kesalahan input         | Validasi otomatis               |
| Server overload         | Auto-scaling dan load balancing |
| Data tidak sinkron      | Retry mechanism                 |

---

### 13. Future Enhancement

- AI-based Data Validation.
- OCR Document Recognition.
- Voice-to-Text Interview Recording.
- Real-Time Analytics Dashboard.
- GIS Integration.
- AI Assistant untuk Enumerator.
- Predictive Survey Quality Monitoring.

---

### Product Owner

MSJ-Createch

### Product Name

NEXUS (National Electronic X-sectional User Survey)

### Version

1.0

### Status

Draft PRD
