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
    case aktifitas
    case catatanSiswa
    case proyekBelumLengkap
    
    var value: (title: String, description: String) {
        switch self {
            case .namaProyek:
                return ("Nama Proyek", "Untuk menentukan Nama Proyek Bapak/Ibu diminta untuk memberikan judul berbentuk permasalahan yang akan diberikan kepada murid. Contoh: ”Membuat Program Excel untuk Mengubah Matriks Menjadi Huruf")
            case .deskripsiProyek:
                return ("Deskripsi/ Ringkasan Proyek", "Tuliskan informasi penting yang perlu diketahui murid. Seperti : 1. Gambaran besar mengenai proyek yang dilakukan 2. Hasil akhir dari proyek yang akan dibuat")
            case .tujuanPembelajaran:
                return ("Tujuan Pembelajaran", "Tujuan pembelajaran adalah tujuan dari pemberian proyek ini kepada murid. Contoh : 1. Menjelaskan pengertian ; 2. Menjelaskan bentuk umum ; 3. Menentukan Himpunan Penyelesaian (HP) ; 4. Menyelesaikan masalah nyata yang berkaitan dengan SPLTV")
            case .mediaUpload:
                return ("Media", "Masukan media referensi di mana murid bisa mendapatkan informasi tambahan mengenai proyek yang harus dilakukan.")
            case .aktifitas:
                return ("Aktifitas", "Tuliskan secara jelas mengenai perencanaan & penjadwalan project yang akan berlangsung. Tuliskan secara detail langkah apa saja yang harus dilewati oleh murid")
            case .catatanSiswa:
                return ("Catatan Siswa", "Masukan catatan tambahan untuk siswa. Seprti hal-hal yang harus dilakukan, hal-hal yang harus dihindari, dan lain-lain")
        case .proyekBelumLengkap:
                return ("Lengkapi isian terlebih dahulu", "Untuk menentukan Nama Proyek guru diharuskan memberikan judul permasalahan yang akan diberikan kepada murid, contoh: ”Mengukur jumlah penyebaran Covid-19 dengan metode persamaan linear”")
        }
    }
}
