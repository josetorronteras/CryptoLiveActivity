//
//  ContentView.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @Bindable var cryptoViewModel: CryptoViewModel = CryptoViewModel()
    @State var favoritesViewModel = FavoritesViewModel()
    
    var body: some View {
        List(cryptoViewModel.cryptos, id: \.id) { crypto in
            CryptoCellView(crypto: crypto, vm:favoritesViewModel)
                .padding()
        }
        .task { await cryptoViewModel.fetch() }
        .refreshable { await cryptoViewModel.fetch() }
        .alert(isPresented: $cryptoViewModel.showError, content: {
            Alert(title: Text("An error occurred, try again later"))
        })
        .redacted(reason: cryptoViewModel.isLoading ? .placeholder : [])
    }
}

#Preview {
    ContentView()
}
