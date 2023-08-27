//
//  PageView.swift
//  Landmarks
//
//  Created by Admin on 27.08.2023.
//

import SwiftUI

struct PageView<Page:View>: View {
    var pages: [Page]
    @State private var currentPage = 1
    
    var body: some View {
        VStack {
            PageViewController(pages: pages, currentPage: $currentPage)
            Text("current Page: \(currentPage)")
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
