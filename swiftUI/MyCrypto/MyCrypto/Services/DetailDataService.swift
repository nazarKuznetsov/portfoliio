//
//  DetailDataService.swift
//  MyCrypto
//
//  Created by Admin on 03.09.2023.
//

import Foundation
import Combine


class DetailDataService {
    
    @Published var coinDetails: CoinDetailModel? = nil
    var coinDetailsSubscription: AnyCancellable?
    let coin: CoinModel
    
    init(coin: CoinModel) {
        self.coin = coin
        getCoinsDeails()
    }
    
    func getCoinsDeails(){
        guard let url = URL(string: " https://api.coingecko.com/api/v3/coins/\(coin.id)?localization=false&tickers=false&market_data=false&community_data=false&developer_data=false&sparkline=false") else { return }
        coinDetailsSubscription = NetworkingManager.download(url: url)
            .decode(type: CoinDetailModel.self, decoder: JSONDecoder())
        
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue:
                    { [weak self] (returnedCoinDetails) in
                self?.coinDetails = returnedCoinDetails
                self?.coinDetailsSubscription?.cancel()
        })
        
    }
}

