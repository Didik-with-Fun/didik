//
//  LihatSemuaView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 30/10/20.
//

import SwiftUI

struct LihatSemuaView: View {
    
    let ProjectsLibrary: [Project]
    let currentTitle: String
    @State var searchText: String = ""
    @State var selectedKelas: Grades = .allGrades
    @State var selectedMatpel: Subject = .allSubjects
    
    let height: CGFloat = 125
    let width: CGFloat = 230
    
    var body: some View {
        
            
        GeometryReader { geometry in


        	VStack {
            	CustomNavigationBarView(filteredGrade: $selectedKelas, filteredSubject: $selectedMatpel, searchText: $searchText, showDropDown: true)
                    .zIndex(2)
            	List(ProjectsLibrary.filter({ searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.lowercased())
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
        
    }
}

struct LihatSemuaView_Previews: PreviewProvider {
    static var previews: some View {
        LihatSemuaView(ProjectsLibrary: [placeholder], currentTitle: "nipples")
            .previewDevice("iPad (8th generation)")
    }
}
