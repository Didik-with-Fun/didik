//
//  JelajahMateriView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct JelajahMateriView: View {
    
    @EnvironmentObject var db: JelajahMateriViewModel
    
    @State var searchText: String = ""
    @State var selectedGrade: Grades = .allGrades
    @State var selectedSubject: Subjects = .allSubjects
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBarView(filteredGrade: $selectedGrade, filteredSubject: $selectedSubject, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
                
                //workaraund to make nav bar not expanding
                HStack(spacing: 0) {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 1)
                }

                if searchText != "" {
                    List(db.filteredProjects.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
                    })) { project in
                        NavigationLink(
                            destination: DummyView(),
                            label: {
                                MateriTableCellView(project: project, height: 125, width: 230, bookmarked: false)
                            })
                    }
                } else {
                    ScrollView(.vertical) {
                        VStack(spacing : 0) {
                            ForEach(db.jelajahMateriGroup) {
                                index in
                                MateriPreviewCollectionView(title: index.title, ProjectsLibrary: index.group)

                                
                            }
                        }
                    }
                }
                
            }
            .navigationBarColor(backgroundColor: UIColor(named: K.bluePrimary))
            .navigationBarTitle("Jelajah Materi", displayMode: .automatic)
            .navigationBarItems(trailing: UserButton())
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}

struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        JelajahMateriView()
            .environmentObject(DummyModel())
            .previewDevice("iPad (8th generation)")
    }
}
