//
//  CoinRowView.swift
//  MyCrypto
//
//  Created by Admin on 29.08.2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: CoinModel
    let showHoldingsCount: Bool 
    
    var body: some View {
        HStack(spacing: 0) {
            leadingColumn
            Spacer()
            
            if showHoldingsCount {
                centerColumn
            }
            
            trailingColumn
        }
        .font(.subheadline)
    }
}

//struct CoinRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinRowView(coin: dev.coin)
//    }
//}

extension CoinRowView {
    private var leadingColumn: some View {
        HStack(spacing: 0){
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(Color.theme.secondaryText)
                .frame(minWidth: 30)
            Circle()
                .frame(width: 30, height: 30)
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(Color.theme.accent)
            
        }
    }
    
    private var centerColumn: some View {
        VStack(alignment: .trailing) {
            Text(coin.currentHoldingsValue.asCurrencyWith6Decimals())
            Text((coin.currentHoldings ?? 0).asNumberString())
        }
    }
    
    private var trailingColumn: some View {
        VStack(alignment: .trailing) {
            Text("\(coin.currentPrice.asCurrencyWith2Decimals())")
                .bold()
                .foregroundColor(Color.theme.accent)
            Text("\(coin.priceChangePercentage24H?.asPercentString() ?? "")%")
                .foregroundColor(
                    (coin.priceChangePercentage24H ?? 0) >= 0 ?
                    Color.theme.green : Color.theme.red
                )
        }
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
}
