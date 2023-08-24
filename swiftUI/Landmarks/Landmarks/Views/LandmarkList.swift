//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Admin on 24.08.2023.
//

import SwiftUI

struct LandmarkList: View {
    
    @State private var showfavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter { landmark in
            !showfavoritesOnly || landmark.isFavorite
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredLandmarks) { landmark in
                NavigationLink {
                    LandmarkDetail(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}


struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
