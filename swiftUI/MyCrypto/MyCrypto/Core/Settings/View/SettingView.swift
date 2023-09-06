//
//  SettingView.swift
//  MyCrypto
//
//  Created by Admin on 04.09.2023.
//

import SwiftUI

struct SettingView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let githubURLString = "https://github.com/nazarKuznetsov/portfoliio.git"
    let coinGeckoURLString = "https://www.coingecko.com"
    
    var body: some View {
        NavigationView {
            List {
                swiftUIThinkingSection
                coinGeckoSection
            }
            .font(.headline)
            .accentColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    leadingBarItem
                }
            }
        }
        
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}

extension SettingView {
    
    private var leadingBarItem: some View {
        Button (action: {
            dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
        })
    }
    
    private var swiftUIThinkingSection: some View {
        Section(header: Text("SwiftUI Thinking")) {
            VStack(alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("This app was made by Nazar Kuznetsov. It uses MVVM Architecture, Combine, CoreData!")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            if let url = URL(string: githubURLString) {
                Link("You can visit my github ", destination: url)
            }
           
        }
    }
    
    private var coinGeckoSection: some View {
        Section(header: Text("CoinGecko")) {
            VStack(alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .frame( height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text("The cryptocurrency data that is used in this app comes from a free AI from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            if let url = URL(string: coinGeckoURLString) {
                Link("You can visit CoinGecko", destination: url)
            }
           
        }
    }
    
}
