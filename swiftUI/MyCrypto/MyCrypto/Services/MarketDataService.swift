//
//  MarketDataService.swift
//  MyCrypto
//
//  Created by Admin on 01.09.2023.
//

import Foundation
import Combine


class MarketDataService {
    
    @Published var marketData: MarketDataModel? = nil
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue:
                    { [weak self] (returnedData) in
                self?.marketData = returnedData.data
                self?.marketDataSubscription?.cancel()
        })
        
    }
}

