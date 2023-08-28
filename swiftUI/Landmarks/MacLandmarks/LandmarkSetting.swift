//
//  LandmarkSetting.swift
//  Landmarks
//
//  Created by Admin on 28.08.2023.
//

import SwiftUI

struct LandmarkSetting: View {
    
    @AppStorage("MapView.zoom")
        private var zoom: MapView.Zoom = .medium

    
    var body: some View {
        Form {
            Picker("Map Zoom", selection: $zoom){
                ForEach(MapView.Zoom.allCases){ level in
                    Text(level.rawValue)
                }
            }
            .pickerStyle(.inline)
        }
        .frame(width: 300)
        .navigationTitle("Landmaark Settings")
        .padding(80)
    }
}

struct LandmarkSetting_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkSetting()
    }
}
