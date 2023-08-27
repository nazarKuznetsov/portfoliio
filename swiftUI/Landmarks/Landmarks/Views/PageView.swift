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
        ZStack(alignment: .bottomLeading) {
            PageViewController(pages: pages, currentPage: $currentPage)
            Text("current Page: \(currentPage)")
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.trailing)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageView(pages: ModelData().features.map { FeatureCard(landmark: $0) })
            .aspectRatio(3 / 2, contentMode: .fit)
    }
}
