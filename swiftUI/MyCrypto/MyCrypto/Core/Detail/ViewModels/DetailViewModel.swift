//
//  DetailViewModel.swift
//  MyCrypto
//
//  Created by Admin on 03.09.2023.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    private let coinDetailService: DetailDataService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        coinDetailService = DetailDataService(coin: coin)
        self.addSubcribers()
    }
    
    private func addSubcribers() {
        coinDetailService.$coinDetails
            .sink { returnedCoinDetails in
                print(returnedCoinDetails)
            }
            .store(in: &cancellables)
    }
}
