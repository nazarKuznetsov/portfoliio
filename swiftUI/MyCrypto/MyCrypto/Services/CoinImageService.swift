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
    private let fileManager = LocalFileMaanager.instance
    private let folderName = "coin_images"
    private let imageName: String
    
    init(coin: CoinModel) {
        self.coin = coin
        imageName = coin.id
        getCoinImage()
    }
    
    private func getCoinImage() {
        if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
        } else {
            downloadCoinImage()
        }
    }
    
    private func downloadCoinImage(){
        guard let url = URL(string: coin.image) else { return }
        cancellables = NetworkingManager.download(url: url)
            .tryMap({ data in
                return UIImage(data: data)
            })
        
            .sink (receiveCompletion: NetworkingManager.handleCompletion, receiveValue:
                    { [weak self] (returnedImage) in
                guard let self = self, let downloadedImage = returnedImage else { return }
                self.image = returnedImage
                self.cancellables?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
        })
        
    }
}

