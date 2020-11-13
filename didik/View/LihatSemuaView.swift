//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    let projectsGroup: ProjectsGroup
    @State var searchText: String = ""
    @Binding var selectedKelas: Grades
    @Binding var selectedMatpel: Subject
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    let startPointviewType: ViewType
    
    
    var body: some View {
        
            
        GeometryReader { geometry in


        	VStack {
                CustomNavigationBarView(filteredGrade: $selectedKelas, filteredSubject: $selectedMatpel, searchText: $searchText, viewType: .lihatSemua)
                    .zIndex(2)
                List(db.filteredSpecificProjects.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
            	})) { project in
                	NavigationLink(
                        destination: DetailProjectMainView(project: project, parentGeometry: geometry, title: projectsGroup.title),
                    	label: {
                        	MateriTableCellView(project: project, height: height, width: width, bookmarked: false)
                    	})
                }
            }


        }

        .navigationBarTitle(projectsGroup.title, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
        
        .onAppear(perform: {
            db.specificProjects = projectsGroup.unfilteredGroup
            db.filterLihatSemua(grade: selectedKelas, subject: selectedMatpel)
        })
        .onDisappear(perform: {
            db.filter(grade: selectedKelas, subject: selectedMatpel, view: startPointviewType)
        })
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(projectsGroup: placeholderGroup, selectedKelas: .constant(.ten), selectedMatpel: .constant(.BahasaIndonesia), startPointviewType: .jelajah)
            .previewDevice("iPad (8th generation)")
    }
}
