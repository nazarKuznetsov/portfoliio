//
//  SignInView.swift
//  FoodShopApp
//
//  Created by Admin on 16.10.2023.
//

import SwiftUI

struct SignInView: View {
    
    @State var mobileNumber: String = ""
    
    var body: some View {
        ZStack {
       
            VStack {
                Image("bottom_bg")
                    .resizable()
                    .scaledToFill()
                    .frame(width: .screenWidth, height:  .screenHeight)
                    
                Spacer()
            }
            
            ScrollView {
                
                VStack {
                    Text("Text")
                        .font(.customfont(.semibold, fontSize: 26))
                        .foregroundColor(.primaryText)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                    HStack {
                        Button {
                            
                        } label: {
                             Image("")
                            
                            Text("+380")
                                .font(.customfont(.medium, fontSize: 18))
                                .foregroundColor(.primaryText)
                        }
                        
                        TextField("Enter Mobile", text: $mobileNumber)
                            .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, maxWidth: .infinity)
                    }
                    Divider()
                        .padding(.bottom, 25)
                    
                    Text("Or connect with social media")
                        .font(.customfont(.semibold, fontSize: 18))
                        .foregroundColor(.textTitle)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 20)
                    
                    ConnectButton(title: "Connect with Google", backgroundColorForButton: .red, imageName: "google_logo")
                    
                    ConnectButton(title: "Connect with Facebook", backgroundColorForButton: .blue, imageName: "fb_logo")
                }
                
                
            }
            .padding(.horizontal, 20)
            .frame(width: .screenWidth, alignment: .leading)
            .padding(.top, .topInsets + .screenWidth * 0.7 )
            .background(Color.darkGray.opacity(0.1))
            
            
        }
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
