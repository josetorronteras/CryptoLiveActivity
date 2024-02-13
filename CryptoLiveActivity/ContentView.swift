//
//  ContentView.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var vm: CryptoViewModel
    
    var body: some View {
        List(vm.cryptos, id: \.id) { crypto in
            CryptoCellView(crypto: crypto)
                .padding()
        }
        .task { await vm.fetch() }
        .refreshable { await vm.fetch() }
        .redacted(reason: vm.isLoading ? .placeholder : [])
    }
}

#Preview {
    ContentView(vm: CryptoViewModel())
}
