//
//  HomeViewModel.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var allCoin = [CoinModel]()
    @Published var portfolioCoins = [CoinModel]()
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.allCoin.append(DeveloperPreview.instance.coin)
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
}
