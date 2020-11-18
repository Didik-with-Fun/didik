//
//  Tooltips.swift
//  didik
//
//  Created by Haddawi on 09/11/20.
//

import Foundation

struct Tooltip {
    let title: String
    let descriptions: String
}

enum Tooltips: CaseIterable {
    case namaProyek
    case deskripsiProyek
    case tujuanPembelajaran
    case mediaUpload
    case mediaNotAvailable
    case aktifitas
    case catatanSiswa
    case proyekBelumLengkap
    case confirmationPublish
    case projectPublishSuccess
    case projectDraftSuccess
    case projectPublishFailed
    case projectDraftFailed
    case uncompleteSubject
    case uncompleteGrade
    case uncompleteTopic
    case uncompleteProjectName
    case uncompleteProjectSummary
    case uncompleteProjectLearningGoals
    case uncompleteProjectActivities
    
    var value: (title: String, description: String, icon: String) {
        switch self {
            case .namaProyek:
                return ("Nama Proyek", "Untuk menentukan Nama Proyek Bapak/Ibu diminta untuk memberikan judul berbentuk permasalahan yang akan diberikan kepada murid. Contoh: ”Membuat Program Excel untuk Mengubah Matriks Menjadi Huruf", "")
            case .deskripsiProyek:
                return ("Deskripsi/ Ringkasan Proyek", "Tuliskan informasi penting yang perlu diketahui murid. Seperti : 1. Gambaran besar mengenai proyek yang dilakukan 2. Hasil akhir dari proyek yang akan dibuat", "")
            case .tujuanPembelajaran:
                return ("Tujuan Pembelajaran", "Tujuan pembelajaran adalah tujuan dari pemberian proyek ini kepada murid. Contoh : 1. Menjelaskan pengertian ; 2. Menjelaskan bentuk umum ; 3. Menentukan Himpunan Penyelesaian (HP) ; 4. Menyelesaikan masalah nyata yang berkaitan dengan SPLTV", "")
            case .mediaUpload:
                return ("Media", "Masukan media referensi di mana murid bisa mendapatkan informasi tambahan mengenai proyek yang harus dilakukan.", "")
            case .mediaNotAvailable:
                    return ("Ups", "Upload berkas gambar ke dalam materi sedang dalam pengembangan, nantikan segera.", "TooltipFailed")
            case .aktifitas:
                return ("Aktifitas", "Tuliskan secara jelas mengenai perencanaan & penjadwalan project yang akan berlangsung. Tuliskan secara detail langkah apa saja yang harus dilewati oleh murid", "")
            case .catatanSiswa:
                return ("Catatan Siswa", "Masukan catatan tambahan untuk siswa. Seprti hal-hal yang harus dilakukan, hal-hal yang harus dihindari, dan lain-lain", "")
            case .proyekBelumLengkap:
                return ("Lengkapi isian terlebih dahulu", "Untuk menentukan Nama Proyek guru diharuskan memberikan judul permasalahan yang akan diberikan kepada murid, contoh: ”Mengukur jumlah penyebaran Covid-19 dengan metode persamaan linear”", "")
            case .confirmationPublish:
                return ("Apakah anda yakin untuk mempublish materi ini?", "Setelah di upload, materi ini akan dipublikasikan dan anda tidak bisa mengubahnya lagi. File ini akan tersimpan di handphonemu", "")
            case .projectPublishSuccess:
                return ("File kamu berhasil di Publish", "Sekarang file kamu dapat di akses di Jelajah Materi oleh pengguna lain", "TooltipSuccess")
            case .projectDraftSuccess:
                return ("File kamu berhasil dimasukan ke dalam Draft", "File kamu sudah berhasil tersimpan di dalam draft", "TooltipSuccess")
            case .projectPublishFailed:
                return ("File kamu gagal di Publish", "Periksa lagi Draft pengerjaanmu dan pastikan Nama Proyek, Deskripsi/Ringkasan Proyek, Tujuan Pemebelajaran, Aktivitas, dan Catatan untuk Siswa sudah terisi semua", "TooltipFailed")
            case .projectDraftFailed:
                return ("File kamu gagal dimasukan ke dalam Draft", "Periksa lagi Draft pengerjaanmu dan pastikan Nama Proyek, Deskripsi/Ringkasan Proyek, Tujuan Pemebelajaran, Aktivitas, dan Catatan untuk Siswa sudah terisi semua", "TooltipFailed")
            case .uncompleteSubject:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Mata Pelajaran sudah dipilih", "TooltipFailed")
            case .uncompleteGrade:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Kelas sudah dipilih", "TooltipFailed")
            case .uncompleteTopic:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Mata Pembelajaran sudah dipilih", "TooltipFailed")
            case .uncompleteProjectName:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Nama Materi sudah diisi", "TooltipFailed")
            case .uncompleteProjectSummary:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Deskripsi/ Ringkasan Proyek sudah diisi", "TooltipFailed")
            case .uncompleteProjectLearningGoals:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Tujuan Pembelajaran sudah diisi", "TooltipFailed")
            case .uncompleteProjectActivities:
                return ("Tunggu dulu", "Periksa lagi Draft pengerjaanmu dan pastikan Aktifitas sudah diisi", "TooltipFailed")
        }
    }
}
