//
//  HomeViewModel.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var allCoin = [CoinModel]()
    @Published var portfolioCoins = [CoinModel]()
    
    private let dataService = CoinDataService()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { returnedCoins in
                self.allCoin = returnedCoins
            }
            .store(in: &cancellables)
    }
}
