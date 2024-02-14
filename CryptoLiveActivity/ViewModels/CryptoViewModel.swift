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
    var showError: Bool = false
    
    init(initialState: [Crypto] = Array.init(repeating: .mock, count: 5)) {
        self.cryptos = initialState
    }
}

// MARK: - Public Methods
extension CryptoViewModel {
    
    /// Fetch the cryptos from API and update the cryptos array
    func fetch() async {
        isLoading = true
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,XRP,SOL&tsyms=EUR") else {
            showError = true
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedResponse = try JSONDecoder().decode(Cryptos.self, from: data)
            cryptos = decodedResponse.display.values.compactMap { $0.eur }.sorted(by: >)
            isLoading = false
        } catch {
            showError = true
        }
    }
}

// MARK: - Crypto Extension
extension Crypto {
    
    /// Mock Crypto
    static var mock: Crypto {
        Crypto(symbol: "title", price: "price", pct: "", imageurl: "")
    }
}
