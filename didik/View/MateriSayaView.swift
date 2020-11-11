//
//  MateriSayaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 09/11/20.
//

import SwiftUI

struct MateriSayaView: View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    @State var searchText: String = ""
    @State var selectedKelas: Grade = .allGrades
    @State var selectedMatpel: Subject = .allSubjects
    
    var parentGeometry: GeometryProxy

    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBarView(filteredGrade: $selectedKelas, filteredSubject: $selectedMatpel, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
                
                HStack{
                    Spacer()
                    NavigationLink(
                        destination: CreateProjectView(selectedSubject: .constant(.Mathematic), isDropdownSubjectOpen: true),
                        label: {
                            BuatMateriButton()
                        })
                }
                .padding()

                if searchText != "" {
                    List(db.myProjects.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                    })) { project in
                        NavigationLink(
                            destination: DetailProjectMainView(project: project, parentGeometry: parentGeometry, title: project.name),
                            label: {
                                MateriTableCellView(project: project, height: 125, width: 230, bookmarked: false)
                            })
                    }
                } else {
                    ScrollView(.vertical) {
                        VStack(spacing : 0) {
                            ForEach(db.myProjectsGroup) {
                                index in
                                MateriPreviewCollectionView(parentGeometry: parentGeometry, title: index.title, ProjectsLibrary: index.group)

                                
                            }
                        }
                    }
                }
                
            }
            .navigationBarTitle("Materi Saya", displayMode: .automatic)
            .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
            .navigationBarItems(trailing: UserButton())
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}

struct MateriSayaView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in

        MateriSayaView(parentGeometry: geometry)
            .environmentObject(ProjectDatabaseViewModel())
            .previewDevice("iPad (8th generation)")
        }
    }
}

struct BuatMateriButton: View {
    var body: some View {
        Text("Buat Materi")
            .font(.caption)
            .foregroundColor(.white)
            .bold()
            .frame(width: 230, height: 39, alignment: .center)
            .background(Color.Didik.BlueSecondary)
            .cornerRadius(10)
    }
}
