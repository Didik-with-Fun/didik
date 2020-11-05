//
//  CustomNavigationBarView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI


struct CustomNavigationBarView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let title: String
    @State var filterKelasString: String
    @State var filterMateriString: String
    @Binding var searchText: String
    let showDropDown: Bool
    let previousTitle: String?
    
    //    @Binding var search : String
    
    
    var body: some View {
        VStack (alignment: .leading){
            HStack {
                if previousTitle != nil {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .aspectRatio(contentMode: .fit)
                            Text(previousTitle ?? "back")
                        }.padding()
                        .foregroundColor(.white)
                        
                    }
                    
                    .padding(.leading)
                } else {
                    HStack {
                        Text("")
                    }.padding()
                }
                
                
                Spacer()
            }.padding(.top, 10)
            HStack {
                Text(title)
                    .font(.title)
                    .bold()
                    .foregroundColor(Color.white)
                Spacer()
                // image
                NavigationLink(
                    destination: DummyView(),
                    label: {
                        Image(systemName: "person.circle")
                            .foregroundColor(.black)
                            .font(.system(size: 20))
                            .padding(.horizontal)
                    })
                
            }.padding(.leading, 20)
            HStack(spacing: 0){
                if showDropDown {
                    HStack(spacing: 10) {
                        CustomDropDownMenu(options: ["Yes", "No","Hide"], selected: $filterKelasString, width: UIScreen.main.bounds.width * 0.15)
                        CustomDropDownMenu(options: ["What","Yes", "No","Hide"], selected: $filterMateriString, width: UIScreen.main.bounds.width * 0.15)
                            .padding(.trailing, 10)
                    }
                } else {
                    VStack {
                        HStack {
                            Text("")
                                .padding(.vertical, 8)

                        }
                    }.padding(.vertical, 10)
                    
                    
                }

                SearchBarView(text: $searchText)
                    .padding(.leading, 10)
                    .padding(.trailing)

            }.padding(.leading, 20)
        }.background(Color(K.TabBarColor))
        
    }
}

struct CustomNavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CustomNavigationBarView(title: "Jelajah Materi", filterKelasString: "Kelas", filterMateriString: "Materi", searchText: .constant(""), showDropDown: true, previousTitle: nil)
            CustomNavigationBarView(title: "Jelajah Materi", filterKelasString: "Kelas", filterMateriString: "Materi", searchText: .constant(""), showDropDown: false, previousTitle: nil)
        }
        
    }
}

//MARK: - Custom Drop Down Menu

struct CustomDropDownMenu : View {
    
    let options : [String]
    
    @State var isShowed : Bool = false
    @Binding var selected : String
    
    
    
    let width : CGFloat
    
    var body: some View {
        VStack {
            Button(action: {
                self.isShowed.toggle()
            }) {
                HStack(spacing : 10) {
                    Text(selected)
                        .frame(width: width * 0.85, alignment: .center)
                        .padding(.vertical, 8)
                        .padding(.leading, 10)
                    Image(systemName: "chevron.up")
                        .frame(width: width * 0.15, alignment: .center)
                        .padding(.vertical, 8)
                        .padding(.trailing, 10)
                }
            }
            .foregroundColor(.white)
            .background(Color(K.TabBarColor))
            
            .overlay(
                VStack{
                    if isShowed {
                        VStack {
                            ForEach(0..<self.options.count) {
                                index in
                                Button(action: {
                                    self.isShowed.toggle()
                                    self.selected = options[index]
                                }) {
                                    Text(options[index])
                                        .foregroundColor(.black)
                                        .font(.system(size: 17, weight: .bold, design: .default))
                                        .padding(.vertical, 10)
                                        .frame(width: width * 0.85, alignment: .center)
                                }
   
                            }
                        }.background(Color.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        
                    }
                }, alignment: .topLeading
            )
            
            
            
            
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.white, lineWidth: 1)
        )
        .padding(.vertical, 10)
        
        
        
    }
}
