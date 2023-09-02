//
//  MyCryptoApp.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import SwiftUI

@main
struct MyCryptoApp: App {
    
    @StateObject var homeViewModel = HomeViewModel()
    
    init(){
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(homeViewModel)
        }
    }
}
