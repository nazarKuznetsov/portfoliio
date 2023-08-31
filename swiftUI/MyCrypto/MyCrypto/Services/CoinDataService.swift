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
    var cancellables: AnyCancellable?
    
    init() {
        getCoins()
    }
    
    private func getCoins(){
        guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en&precision=full") else { return }
        cancellables = URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .default))
            .tryMap(handleOutput)
            .decode(type: [CoinModel].self, decoder: JSONDecoder())
            
            .sink { completion in
                switch completion {
                case .finished:
                    print("Success")
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.cancellables?.cancel()
            }
        
    }
    
    func handleOutput(output: URLSession.DataTaskPublisher.Output) throws -> Data {
        guard let response = output.response as? HTTPURLResponse,
              response.statusCode >= 200 && response.statusCode <= 300 else {
            throw URLError(.badServerResponse)
        }
        return output.data
    }
    
}
