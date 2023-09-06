//
//  CoinDataService.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import Foundation
import Combine


class CoinDataService {
    
    @Published var allCoins = [CoinModel]()
    var coinDataSubscription: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=full") else { return }
        coinDataSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue:
                    { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinDataSubscription?.cancel()
        })
        
    }
}
