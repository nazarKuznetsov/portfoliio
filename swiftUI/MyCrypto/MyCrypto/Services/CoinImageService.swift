//
//  CoinImageService.swift
//  MyCrypto
//
//  Created by Admin on 31.08.2023.
//

import SwiftUI
import Combine

class CoinImageService {
    @Published var image: UIImage? = nil
    
    private var cancellables: AnyCancellable?
    private var coin: CoinModel
    init(coin: CoinModel) {
        self.coin = coin
        getImage()
    }
    
    private func getImage(){
        guard let url = URL(string: coin.image) else { return }
        cancellables = NetworkingManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
        
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue:
                    { [weak self] (returnedImage) in
                self?.image = returnedImage
                self?.cancellables?.cancel()
        })
        
    }
}

