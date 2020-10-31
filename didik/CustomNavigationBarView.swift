//
//  CustomNavigationBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI


struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var isHidden : Bool
    
    let title : String
    
    var body: some View {
        VStack {
            HStack {
                if !isHidden {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .aspectRatio(contentMode: .fit)
                            Text("Back")
                        }.padding()
                        
                    }
                    
                    .padding(.leading)
                    .padding(.top, 40)
                } else {
                    Rectangle()
                        .foregroundColor(tabBarAndNavBarColor)
                        .frame(maxHeight : 100)
                }
                
                
                Spacer()
            }
            HStack {
                Text(title)
                    .foregroundColor(Color.white)
                    .padding()
                Spacer()
                Image(systemName: "photo")
                    .foregroundColor(.black)
                    .font(.system(size: 20))
                    .padding()
            }
            HStack {
                CustomDropDownMenu(options: ["Yes", "No","Hide"])
                    .padding()
                CustomDropDownMenu(options: ["What","Yes", "No","Hide"])
                    .padding()
                Spacer()
                Text("TextField")
                    .padding()
            }
        }.background(tabBarAndNavBarColor)
        
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomNavigationBarView(isHidden: true, title: "Juragan Materi")
            CustomDropDownMenu(options: ["Yes", "No","Hide"])
        }
        
    }
}

//MARK: - Custom Drop Down Menu

struct CustomDropDownMenu : View {
    
    let options : [String]
    
//    @State var isShowed : Bool
    
    var body: some View {
        VStack {
            HStack {
                Text(options[0])
                    .padding()
                
                Image(systemName: "chevron.up")
                    .padding()
            }
            .foregroundColor(.white)
            .background(tabBarAndNavBarColor)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 1)
            )
//            VStack {
//                ForEach(0..<self.options.count) {
//                    index in
//                    Text(options[index])
//                        .font(.system(size: 17, weight: .bold, design: .default))
//                        .padding()
//                }
//            }.background(Color.white)
//            .cornerRadius(10)
//            .shadow(radius: 5)
            
            
            
        }
    }
}
