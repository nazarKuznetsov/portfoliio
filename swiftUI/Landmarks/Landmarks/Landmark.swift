//
//  Landmark.swift
//  Landmarks
//
//  Created by Admin on 24.08.2023.
//

import SwiftUI
import

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    
    struct Coordinates: Hashable, Codable {
            var latitude: Double
            var longitude: Double
        }
}
