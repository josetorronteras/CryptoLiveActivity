//
//  CryptoLiveActivityApp.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 12/2/24.
//

import SwiftUI

@main
struct CryptoLiveActivityApp: App {
    
    @State var cryptoViewModel = CryptoViewModel()
    @State var favoritesViewModel = FavoritesViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(cryptoViewModel)
                .environment(favoritesViewModel)
        }
    }
}
