//
//  FavoritesViewModel.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 14/2/24.
//

import Foundation

@Observable
final class FavoritesViewModel {
    
    // The actual cryptos the user has favorited
    private var favorites = Set<String>()
}

// MARK: - Public Methods
extension FavoritesViewModel {
    
    /// adds/remove the crypto to favorite set
    func modify(_ crypto: Crypto) {
        if !contains(crypto) {
            favorites.insert(crypto.id)
        } else {
            favorites.remove(crypto.id)
        }
    }
    
    // returns true if our set contains this crypto
    func contains(_ crypto: Crypto) -> Bool {
        favorites.contains(crypto.id)
    }
}

// MARK: - Private Methods
private extension FavoritesViewModel {
}
