//
//  ContentView.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(CryptoViewModel.self) var cryptoViewModel
    @Environment(FavoritesViewModel.self) var favoritesViewModel
    
    var body: some View {
        @Bindable var cryptoViewModel = cryptoViewModel
        List(cryptoViewModel.cryptos, id: \.id) { crypto in
            CryptoCellView(crypto: crypto, vm: favoritesViewModel)
                .padding()
        }
        .task { await cryptoViewModel.fetch() }
        .refreshable { await cryptoViewModel.fetch() }
        .alert(isPresented: $cryptoViewModel.showError, content: {
            Alert(title: Text("An error occurred, try again later"))
        })
        .disabled(cryptoViewModel.isLoading ? true : false)
        .redacted(reason: cryptoViewModel.isLoading ? .placeholder : [])
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                Text("API Cache 10 seconds")
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(CryptoViewModel())
        .environment(FavoritesViewModel())
}
