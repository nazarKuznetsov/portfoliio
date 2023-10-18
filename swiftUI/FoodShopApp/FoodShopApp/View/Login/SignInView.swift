//
//  SignInView.swift
//  FoodShopApp
//
//  Created by Admin on 16.10.2023.
//

import SwiftUI
import CountryPicker

struct SignInView: View {
    
    @State var mobileNumber: String = ""
    @State var isShowPicker: Bool = false
    @State var selectedCountry: Country?
    
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
                            isShowPicker = true
                        } label: {
                            if let selectedCountry = selectedCountry {
                                
                                Text("\(selectedCountry.isoCode.getFlag())")
                                    .font(.customfont(.medium, fontSize: 20))
                                
                                Text("+\(selectedCountry.phoneCode)")
                                    .font(.customfont(.medium, fontSize: 18))
                                    .foregroundColor(.primaryText)
                            }
                            
                            
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
            .sheet(isPresented: $isShowPicker, content: {
                CountryPickerView(country: $selectedCountry)
            })
            .padding(.horizontal, 20)
            .frame(width: .screenWidth, alignment: .leading)
            .padding(.top, .topInsets + .screenWidth * 0.7 )
            .background(Color.darkGray.opacity(0.1))
            
            
        }
        .onAppear {
            self.selectedCountry = Country(phoneCode: "90", isoCode: "TR")
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
