//
//  WelcomeView.swift
//  FoodShop
//
//  Created by Admin on 09.04.2024.
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
