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
            VStack(spacing: 20) {
                Text("")
                    .frame(height: 150)
                
                overviewTitle
                Divider()
                
                overviewGrid
                
                additionalTitle
                Divider()
                
                additionalGrid
                
            }
            .padding()
        }
        .navigationTitle(detailViewModel.coin.name)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                <#code#>
//            }
//        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}

extension DetailView {
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
