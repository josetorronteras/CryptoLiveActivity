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
    private(set) var cryptos: [Crypto]
    var showError: Bool = false
    
    init(initialState: [Crypto] = .mock) {
        self.cryptos = initialState
    }
}

// MARK: - Public Methods
extension CryptoViewModel {
    
    /// Fetch the cryptos from API and update the cryptos array
    func fetch() async {
        isLoading = true
        guard let url = URL(string: "https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BNB,DOGE,XRP,SOL&tsyms=EUR") else {
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
            try await fetchAndSaveImage()
            isLoading = false
        } catch {
            print(error)
            showError = true
        }
    }
}

// MARK: - Public Methods
private extension CryptoViewModel {
    
    /// Fetches and saves images for cryptocurrencies asynchronously
    func fetchAndSaveImage() async throws {
        for crypto in cryptos {
            print(crypto.id)
            guard let url = URL(string: "https://www.cryptocompare.com/" + crypto.imageurl) else { return }
            let (data, _) = try await URLSession.shared.data(from: url)
            if var path = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.josetorronteras.cryptoLive") {
                path = path.appending(path: crypto.id)
                print(path)
                try data.write(to: path)
            }
        }
    }
}

// MARK: - Crypto Extension
extension [Crypto] {
    
    /// Mock Crypto
    static var mock: [Crypto] {
        (0..<5).map { _ in
            Crypto(symbol: "title", price: "price", pct: "", imageurl: "")
        }
    }
}
