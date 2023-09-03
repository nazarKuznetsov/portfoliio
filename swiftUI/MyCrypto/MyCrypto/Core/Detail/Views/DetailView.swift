//
//  DetailView.swift
//  MyCrypto
//
//  Created by Admin on 03.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject var detailViewModel: DetailViewModel

    
    init(coin: CoinModel) {
        self.coin = coin
        _detailViewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        
        Text("Hello")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
