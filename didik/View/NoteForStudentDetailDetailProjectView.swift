//
//  NoteForStudentDetailDetailProjectView.swift
//  didik
//
//  Created by Edwin Sendjaja on 11/10/20.
//

import SwiftUI

struct NoteForStudentDetailDetailProjectView: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("Catatan untuk siswa")
                        .fontWeight(.bold)
                        .font(.system(size: 24))
                    Spacer()
                }
                .padding(15)
                
                Text("Do:  1. Membaca bahan belajar sebagai bahan apersepsi  2. Peserta didik menyelesaikan masalah sederhana Sistem Persamaan Linear Dua Variabel sebagai apersepsi  3. Peserta didik aktif mencari bahan untuk menjawab masalah 4. Peserta didik berkontribusi aktif dalam pemecahan masalah.    Dont  1. Pasif, tidak terlibat.  2. Takut tdk berani mencoba")
                    .fixedSize(horizontal: false, vertical: true)

                    .padding(.leading, 15)

//                    Spacer()
                
            }
            Spacer()
        }
    }
}

struct NoteForStudentDetailDetailProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NoteForStudentDetailDetailProjectView()
    }
}
