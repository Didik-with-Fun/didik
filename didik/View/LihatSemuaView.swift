//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
    @EnvironmentObject var db: ProjectDatabaseViewModel
    
    let ProjectsLibrary: [Project]
    let currentTitle: String
    @State var searchText: String = ""
    @State var selectedKelas: Grades
    @State var selectedMatpel: Subject
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
//    init(ProjectsLibrary: [Project], currentTitle: String) {
//        self.ProjectsLibrary = ProjectsLibrary
//        self.currentTitle = currentTitle
//
//
//    }
    
    var body: some View {
        
            
        GeometryReader { geometry in


        	VStack {
                CustomNavigationBarView(filteredGrade: $selectedKelas, filteredSubject: $selectedMatpel, searchText: $searchText, viewType: .lihatSemua)
                    .zIndex(2)
                List(db.filteredSpecificProjects.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
            	})) { project in
                	NavigationLink(
                        destination: DetailProjectMainView(project: project, parentGeometry: geometry, title: currentTitle),
                    	label: {
                        	MateriTableCellView(project: project, height: height, width: width, bookmarked: false)
                    	})
                }
            }


        }

        .navigationBarTitle(currentTitle, displayMode: .automatic)
        .navigationBarItems(trailing: UserButton())
        .navigationBarColor(backgroundColor: UIColor(Color.Didik.BluePrimary))
        
        .onAppear(perform: {
            db.specificProjects = ProjectsLibrary
            db.filteredSpecificProjects = ProjectsLibrary
        })
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(ProjectsLibrary: [placeholder], currentTitle: "Coba", selectedKelas: .ten, selectedMatpel: .BahasaIndonesia)
            .previewDevice("iPad (8th generation)")
    }
}
