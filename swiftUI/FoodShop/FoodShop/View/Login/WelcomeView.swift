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
                .frame(width: .screenWidth, height: .screenHeight)
            
            VStack {
                
                Spacer()
                
                Image("app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 20)
                
                Text("Welcome\nto our store")
                    .font(.customfont(.semibold, fontSize: 48))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center
                    )
                
                Text("Boring trips to the store are a thing of the past.")
                    .font(.customfont(.medium, fontSize: 24))
                    .foregroundColor(.white.opacity(0.7))
                    .multilineTextAlignment(.center)
                    .padding(.bottom, 20)
                
                NavigationLink {
                    SignInView()
                } label: {
                    RoundButton(title: "Get Started") {
                        
                    }

                }

                
                                
                Spacer()
                    .frame(height: 60)
            }
            .padding(.horizontal, 20)
                
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    NavigationView {
        WelcomeView()
    }
}
