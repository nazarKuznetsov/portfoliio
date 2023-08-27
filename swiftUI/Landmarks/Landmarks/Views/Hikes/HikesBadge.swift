//
//  HikesBadge.swift
//  Landmarks
//
//  Created by Admin on 26.08.2023.
//

import SwiftUI

struct HikesBadge: View {
    
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0/3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibilityLabel("Badge for \(name)")
        }
        
    }
}

struct HikesBadge_Previews: PreviewProvider {
    static var previews: some View {
        HikesBadge(name: "Preview Testing")
    }
}
