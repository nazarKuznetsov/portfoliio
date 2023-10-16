//
//  WelcomeView.swift
//  FoodShopApp
//
//  Created by Admin on 16.10.2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Image("welcom_bg")
                .resizable()
                .scaledToFill()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    WelcomeView()
}
