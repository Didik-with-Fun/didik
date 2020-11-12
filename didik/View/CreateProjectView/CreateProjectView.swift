//
//  CreateProjectView.swift
//  didik
//
//  Created by Haddawi on 04/11/20.
//

import SwiftUI

struct CreateProjectView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var selectedSubject: Subject
    @State var selectedGrade: Grades
    @State var contentNamaProyek: String = ""
    @State var showPopOver = false
    @State var showPopOverContents: Tooltips
    
    let isDropdownSubjectOpen: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    // MARK: - Form View
                    VStack {
                        
                        // MARK: - Subjects & Grades Dropdown
                        HStack (spacing: 30) {
                            
                            // MARK: - Subjects Dropdown
                            VStack (alignment: .leading) {
                                Text("Mata Pelajaran")
                                    .padding(.vertical, 5)
                                
                                DropdownSubject(selected: $selectedSubject, width: 350)
                            }
                            
                            // MARK: - Grades Dropdown
                            VStack (alignment: .leading) {
                                Text("Kelas")
                                    .padding(.vertical, 5)
                                
                                DropdownGrades(selected: $selectedGrade, width: 350)
                            }
                        }
                        .padding(.vertical, 20)
                        
                        // MARK: - Topics Dropdown
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Materi Pembelajaran")
                                    .padding(.vertical, 5)
                                
                                DropdownTopics(isDropdownShowed: false, selected: .constant(topicList[0]), width: 755)
                            }
                        }
                        
                        // MARK: - Core Competence aka Kompentensi Dasar
                        HStack {
                            VStack (alignment: .leading) {
                                Text("Kompentensi Dasar")
                                    .padding(.vertical, 10)
                                
                                HStack (alignment: .top) {
                                    Text("KD 3.1")
                                    
                                    Text("Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel.")
                                }.padding(.bottom, 5)
                                
                                HStack (alignment: .top) {
                                    Text("KD 3.1")
                                    
                                    Text("Menjelaskan dan menentukan penyelesaian pertidaksamaan rasional dan irasional satu variabel.")
                                }.padding(.bottom, 5)
                            }
                            .padding(.top, 20)
                        }
                        
                        // MARK: - Form Field - Project Name aka Nama Proyek
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Nama Proyek")
                                        .padding(.vertical, 5)
                                    
                                    Button(action: {
                                        withAnimation {
                                            self.showPopOver.toggle()
                                        }
                                    }, label: {
                                        Image("Info")
                                    })
                                }
                                
                                TextField("Nama Proyek", text: $contentNamaProyek, onEditingChanged: { (changed) in
                                                print("Username onEditingChanged - \(changed)")
                                })
                                .font(Font.system(size: 20))
                                .textFieldStyle(PlainTextFieldStyle())
                                .foregroundColor(Color.Didik.GreyLight)
                                .frame(height: 50)
                                .padding(.leading, 4)
                                .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                            }
                        }.padding([.top, .horizontal], 20)
                        
                        
                        // MARK: - Form Field - Project Description aka Deskripsi Proyek
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Deskripsi/ Ringkasan Proyek")
                                        .padding(.vertical, 5)
                                    
                                    Button(action: {}, label: {
                                        Image("Info")
                                    })
                                }
                                
                                TextEditor(text: $contentNamaProyek)
                                    .frame(height: 100)
                                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                                
                               
                            }
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Goals aka Tujuan Proyek
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Tujuan Pembelajaran")
                                        .padding(.vertical, 5)
                                    
                                    Button(action: {}, label: {
                                        Image("Info")
                                    })
                                }
                                
                                TextEditor(text: $contentNamaProyek)
                                    .frame(height: 100)
                                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                                
                               
                            }
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Media Uploads
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Media")
                                        .padding(.vertical, 5)
                                    
                                    Button(action: {}, label: {
                                        Image("Info")
                                    })
                                }
                                
                                ScrollView (.horizontal) {
                                    HStack (alignment: .top, spacing: 20) {
                                        Image("InsertMedia")
                                        
                                            Image("InsertMediaDummy").padding(.horizontal, 10)
                                            Image("InsertMediaDummy").padding(.horizontal, 10)
                                            Image("InsertMediaDummy").padding(.horizontal, 10)
                                            Image("InsertMediaDummy").padding(.horizontal, 10)
                                            Image("InsertMediaDummy").padding(.horizontal, 10)
                                    }
                                }
                            }
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Activity
                        HStack {
                            ActivityMainView(totalActivityTime: 0)
                        }.padding([.top, .horizontal], 20)
                        
                        // MARK: - Form Field - Notes aka Catatan Siswa
                        HStack {
                            VStack (alignment: .leading, spacing: 10) {
                                HStack {
                                    Text("Catatan Siswa")
                                        .padding(.vertical, 5)
                                    
                                    Button(action: {}, label: {
                                        Image("Info")
                                    })
                                }
                                
                                TextEditor(text: $contentNamaProyek)
                                    .frame(height: 100)
                                    .overlay(RoundedRectangle(cornerRadius: 13).stroke(Color.gray))
                                
                               
                            }
                        }.padding([.top, .horizontal], 20)
                    }
                    
                    if self.showPopOver {
                        GeometryReader {_ in
                            VStack(alignment: .center) {
                                TooltipView(tooltip: .constant(.namaProyek))
                            }
                        }.background(
                            Color.black.opacity(0.6)
                                .edgesIgnoringSafeArea(.all)
                                .onTapGesture {
                                    withAnimation {
                                        self.showPopOver.toggle()
                                    }
                                }
                        )
                    }
                }
                
                // MARK: - Buttons View
                HStack (spacing: 20) {
                    Spacer()
                    
                    Button(action: {}, label: {
                        Text("Save to Draft")
                        .frame(width: 258, height: 48)
                        .background(Color.Didik.GreyDark)
                        .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        Text("Publish")
                        .frame(width: 258, height: 48)
                        .background(Color.Didik.BluePrimary)
                        .foregroundColor(.white)
                    })
                    .cornerRadius(10)
                }
                .padding(20)
            }
        }
        .navigationBarTitle("Materi Saya", displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
    }
}

struct CreateProjectView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CreateProjectView(selectedSubject: .Mathematic, selectedGrade: .ten, contentNamaProyek: "", showPopOver: false, showPopOverContents: .namaProyek, isDropdownSubjectOpen: false)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}
