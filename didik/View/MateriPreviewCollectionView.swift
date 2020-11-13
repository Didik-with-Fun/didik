//
//  MateriPreviewCollectionView.swift
//  didik
//
//  Created by Fandrian Rhamadiansyah on 29/10/20.
//

import SwiftUI



struct MateriPreviewCollectionView: View {
    
    var parentGeometry: GeometryProxy

    let projectsGroup: ProjectsGroup

    @Binding var selectedGrades: Grades
    @Binding var selectedSubject: Subject
    let startPointviewType: ViewType

    var body: some View {
        VStack(spacing: 10){
            HStack {
                Text(projectsGroup.title)
                    .font(.title2)
                    .bold()
                    .padding(.horizontal)
                    .padding(.bottom)
                
                Spacer()
                NavigationLink(
                    destination: LihatSemuaView(projectsGroup: projectsGroup, selectedKelas: $selectedGrades, selectedMatpel: $selectedSubject, startPointviewType: startPointviewType),
                    label: {
                        Text("Lihat Semua")
                            .font(.caption)
                            .padding(.horizontal)
                            .padding(.bottom)
                    })
                
                
            }
            ScrollView(.horizontal) {
                HStack (alignment: .top, spacing: 10) {
                    if projectsGroup.group.count > 5 {
                        ForEach(0...4, id: \.self) { index in
                            NavigationLink(
                                destination: DetailProjectMainView(project: projectsGroup.group[index], parentGeometry: parentGeometry, title: projectsGroup.group[index].name),
                                label: {
                                    MateriPreviewView(height: 126, width: 230, project: projectsGroup.group[index])
                                        .padding(.leading)
                                })
                        }
                    } else {
                        ForEach(projectsGroup.group) { index in
                            NavigationLink(
                                destination: DetailProjectMainView(project: index, parentGeometry: parentGeometry, title: index.name),
                                label: {
                                    MateriPreviewView(height: 126, width: 230, project: index)
                                        .padding(.leading)
                                })
                            
                        }
                    }
                    
                }
                
            }
            
        }
        .padding(.vertical)
    }
}

struct MateriPreviewCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in

            MateriPreviewCollectionView(parentGeometry: geometry, projectsGroup: placeholderGroup, selectedGrades: .constant(.allGrades), selectedSubject: .constant(.BahasaIndonesia), startPointviewType: .jelajah)
                .previewDevice("iPad (8th generation)")
        }
    }
}
