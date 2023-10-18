//
//  ConnectButton.swift
//  FoodShopApp
//
//  Created by Admin on 16.10.2023.
//

import SwiftUI

struct ConnectButton: View {
    @State var title: String = "Title"
    var backgroundColorForButton: Color = .primaryApp
    var didTap: (()->())?
    var imageName: String
    
    var body: some View {
        Button {
            didTap?()
        } label: {
            
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 20, height: 20)
            
             Text(title)
                .font(.customfont(.semibold, fontSize: 20))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 60, maxHeight: 60)
        .background(backgroundColorForButton)
        .cornerRadius(20)    }
}

#Preview {
    ConnectButton(imageName: "fb_logo")
}
