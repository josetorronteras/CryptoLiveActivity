//
//  CryptoCellView.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

struct CryptoCellView: View {
    
    var crypto: Crypto
    @State var vm: FavoritesViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: "https://www.cryptocompare.com/" + crypto.imageurl)) { image in
                image
                    .resizable()
            } placeholder: {
                Circle()
                    .frame(width: 30, height: 30)
            }
            .frame(width: 40, height: 40)
            
            VStack(alignment: .leading) {
                Text(crypto.symbol)
                    .font(.title2)
                    .bold()
                Text(crypto.price)
                    .font(.headline)
            }
            
            Spacer()
            
            Button {
                vm.modify(crypto)
            } label: {
                Image(systemName: vm.contains(crypto) ? "star.fill": "star")
                    .foregroundStyle(.yellow)
            }
            .padding([.top, .bottom])
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CryptoCellView(crypto: Crypto.crypto, vm: FavoritesViewModel())
            .padding()
        CryptoCellView(crypto: Crypto.cryptoWithoutImage, vm: FavoritesViewModel())
            .padding()
    }
}
