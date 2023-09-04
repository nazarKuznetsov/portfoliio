//
//  DetailView.swift
//  MyCrypto
//
//  Created by Admin on 03.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var detailViewModel: DetailViewModel
    private let columns: [GridItem] = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    private let spacing: CGFloat = 30
    
    init(coin: CoinModel) {
        _detailViewModel = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        
        ScrollView {
            VStack {
                
                ChartView(coin: detailViewModel.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20) {
                    
                    overviewTitle
                    Divider()
                    
                    overviewGrid
                    
                    additionalTitle
                    Divider()
                    
                    additionalGrid
                    
                }
                .padding()
            }
    }
        .navigationTitle(detailViewModel.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                navigationBarTrailingItem
            }
        }
}
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}

extension DetailView {
    
    private var navigationBarTrailingItem: some View {
        HStack {
            Text(detailViewModel.coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(Color.theme.secondaryText)
            CoinImageView(coin: detailViewModel.coin)
                .frame(width: 25, height: 25)
        }
    }
    
    private var overviewTitle: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var additionalTitle: some View {
        Text("Additional Detail")
            .font(.title)
            .bold()
            .foregroundColor(Color.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var overviewGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: spacing,
            pinnedViews: [])
        {
            ForEach(detailViewModel.overviewStatistics) { stat in
                StatisticView(stat: stat)
            }
            
        }
    }
    
    private var additionalGrid: some View {
        LazyVGrid(
            columns: columns,
            alignment: .center,
            spacing: spacing,
            pinnedViews: [])
        {
            ForEach(detailViewModel.additionalStatistics) { stat in
                StatisticView(stat: stat)
            }
            
        }
    }
}
