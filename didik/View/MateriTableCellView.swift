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
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            ZStack {
                Image(systemName: materi.imageName)
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.black)
                
                HStack {

                    Spacer()
                    VStack(alignment: .center) {
                        VStack(spacing: 2) {
                            
                            Image(systemName: materi.liked ? "heart.fill" : "heart")
                                .foregroundColor(materi.liked ? .red : .black)
//                            Text(materi.liked ? "❤️" : "􀊴")
                            Text("\(materi.likes)")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.black)
                                
                        }
                        .frame(width: width/7, height: height/2.75)
                        .background(Color.white)
                        .opacity(0.5)
                        .cornerRadius(6)
                            
                        Spacer()
                        
                        // duration
                        VStack(spacing: 2) {
                            
                            ZStack {
                                Image(K.calendarIcon)
                                    .resizable()
                                    .frame(width : 22.5, height: 25)
//                                    .foregroundColor(materi.liked ? .red : .black)
                                Text("\(materi.duration)")
                                    .font(.system(size: 13, weight: .regular, design: .default))
                                    .foregroundColor(.black)
                                    .padding(.top, 5)
                                    .padding(.leading, 2)
//                                    .padding(.top, 2)
                            }
                            Text("Hari")
                                .font(.system(size: 13, weight: .regular, design: .default))
                                .foregroundColor(.black)
                                
                        }.frame(width: width/7, height: height/2.75)
                        .background(Color.white)
                        .opacity(0.5)
                        .cornerRadius(6)
                        
                    }.frame(width: width/7)
                    .padding(10)
                    
                }.padding(5)
                .frame(width: width, height: height)
                
            }.frame(width: width, height: height)
            .cornerRadius(11)
            .clipped()
            
            
            HStack {
                VStack(alignment: .leading) {
                    HStack(alignment: .top){
                        Text(materi.title)
                            .font(.title2)
                    }
                    Text(materi.author)
                        .foregroundColor(.gray)
                        .font(.subheadline)
                }
                Spacer()
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: width/7, height: height/3)
                    .padding()
            }
        }
    }
}

struct MateriTableCellView_Previews: PreviewProvider {
    static var previews: some View {
        MateriTableCellView(materi: placeholderMateri, height: 125, width: 230)
    }
}
