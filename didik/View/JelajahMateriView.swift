//
//  JelajahMateriView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct JelajahMateriView: View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    @State var searchText: String = ""
    @State var selectedGrade: Grades = .allGrades
    @State var selectedSubject: Subject = .allSubjects
    
    let viewType: ViewType = .jelajah
    
    
    var parentGeometry: GeometryProxy
    
    @State var isShowing = false
    
    init(parentGeometry: GeometryProxy) {
        self.parentGeometry = parentGeometry

    }
    

    var body: some View {
        NavigationView {
            VStack {
                CustomNavigationBarView(filteredGrade: $selectedGrade, filteredSubject: $selectedSubject, searchText: $searchText, viewType: .jelajah)
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
                            destination: DetailProjectMainView(project: project, parentGeometry: parentGeometry, title: project.name),
                            label: {
                                MateriTableCellView(project: project, height: 125, width: 230, bookmarked: false)
                            })
                    }
                    
                    
                } else {
//                    ScrollView(.vertical) {
                    RefreshableScrollView(refreshing: self.$db.loading) {
                        VStack(spacing : 0) {
                            ForEach(db.jelajahMateriGroup) {
                                index in
                                MateriPreviewCollectionView(parentGeometry: parentGeometry, projectsGroup: index, selectedGrade: $selectedGrade, selectedSubject: $selectedSubject, startPointviewType: viewType)
                            }
                        }
                        
                    }
                        
//                    }
                    
                }
                
            }
            .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
            .navigationBarTitle("Jelajah Materi", displayMode: .automatic)
            .navigationBarItems(trailing: UserButton())

            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
    
}

struct JelajahMateriView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in

            JelajahMateriView(parentGeometry: geometry)
                .environmentObject(ProjectDatabaseViewModel())
                .previewDevice("iPad (8th generation)")
        }
    }
}
