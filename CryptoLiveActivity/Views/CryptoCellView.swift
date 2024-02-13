//
//  CryptoCellView.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

struct CryptoCellView: View {
    
    var crypto: Crypto
    
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
            } label: {
                Image(systemName: "star")
                    .foregroundStyle(.yellow)
            }
            .padding([.top, .bottom])
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    Group {
        CryptoCellView(crypto: Crypto.crypto)
            .padding()
        CryptoCellView(crypto: Crypto.cryptoWithoutImage)
            .padding()
    }
}
