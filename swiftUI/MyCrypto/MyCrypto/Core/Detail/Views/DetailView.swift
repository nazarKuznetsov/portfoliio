//
//  DetailView.swift
//  MyCrypto
//
//  Created by Admin on 03.09.2023.
//

import SwiftUI

struct DetailView: View {
    
    @StateObject private var detailViewModel: DetailViewModel
    @State private var showFullDescription: Bool = false
    
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
                    
                    descriptionSection
                    
                    overviewGrid
                    
                    additionalTitle
                    Divider()
                    
                    additionalGrid
                    
                    websiteSection
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
    
    private var websiteSection: some View {
        VStack(alignment: .leading, spacing: 20) {
            if let websiteString = detailViewModel.websiteURL,
                let url = URL(string: websiteString) {
                Link("Website", destination: url)
            }
                
            if let redditString = detailViewModel.redditURL,
               let url = URL(string: redditString) {
                Link("Reddit", destination: url)
            }
            
        }.accentColor(.blue)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
    }
    
    private var descriptionSection: some View {
        ZStack {
            if let coinDescription = detailViewModel.coinDescription, !coinDescription.isEmpty {
                VStack(alignment: .leading) {
                    Text(coinDescription)
                        .lineLimit(showFullDescription ? nil : 3)
                        .font(.callout)
                        .foregroundColor(Color.theme.secondaryText)
                    Button(action: {
                        withAnimation(.easeInOut) {
                            showFullDescription.toggle()
                        }
                    }, label: {
                        Text(showFullDescription ? "Less" : "Read more..")
                            .font(.caption)
                            .fontWeight(.bold)
                            .padding(.vertical, 4)
                    }).accentColor(.blue)
                }.frame(maxWidth: .infinity, alignment: .leading)
                
            }
        }
    }
    
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
