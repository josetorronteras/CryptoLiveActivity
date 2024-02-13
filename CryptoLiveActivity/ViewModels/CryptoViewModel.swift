//
//  CryptoViewModel.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 13/2/24.
//

import Foundation

@Observable
final class CryptoViewModel {
    
    private(set) var isLoading: Bool = true
    private(set) var cryptos: [Crypto] = [.mock]
    
    init(initialState: [Crypto] = Array.init(repeating: .mock, count: 5)) {
        self.cryptos = initialState
        DispatchQueue.main.asyncAfter(deadline: .now() + 5.0) { [weak self] in
            self?.isLoading = false
        }
    }
}

// MARK: - Public Methods
extension CryptoViewModel {
    func fetch() async {
        isLoading = true
    }
}

// MARK: - Crypto Extension
extension Crypto {
    static var mock: Crypto {
        Crypto(symbol: "title", price: "price", pct: "", imageurl: "")
    }
}
