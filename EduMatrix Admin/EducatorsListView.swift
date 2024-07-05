//
//  EducatorsListView.swift
//  EduMatrix Admin
//
//  Created by Ankit Rajput on 04/07/24.
//

import SwiftUI

struct EducatorsListView: View {
    var educators1 : [Educator]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(educators1) { educator in
                        EducatorCardView(educator: educator)
                    }
                }
                .padding(.top, 5)
            }
        }
    }
    
    
}

//struct EducatorsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        EducatorsListView()
//    }
//}
