//
//  MateriTableCellView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 08/11/20.
//

import SwiftUI

struct MateriTableCellView: View {
    
    let materi: DummyMateri
    let height: CGFloat
    let width: CGFloat
    @State var bookmarked: Bool
    
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            
            MateriPreviewImageView(height: height, width: width, materi: materi)
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .top) {
                        Text(materi.title)
                            .font(.title2)
                    }
                    Text(materi.author)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                Button(action: {
                    self.bookmarked.toggle()
                }, label: {
                    Image(systemName: self.bookmarked ? "bookmark.fill" : "bookmark")
                        .resizable()
                        .frame(width: width/7, height: height/3)
                })
                .buttonStyle(PlainButtonStyle())
                .padding()
            }
        }
    }
    
    
}

struct MateriTableCellView_Previews: PreviewProvider {
    static var previews: some View {
        MateriTableCellView(materi: placeholderMateri, height: 125, width: 230, bookmarked: placeholderMateri.bookmarked)
    }
}
