//
//  CryptoModel.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 13/2/24.
//

import Foundation

// MARK: - Cryptos
struct Cryptos: Decodable {
    let display: [String: Display]
    
    enum CodingKeys: String, CodingKey {
        case display = "DISPLAY"
    }
}

// MARK: - Display
struct Display: Decodable {
    let eur: Crypto

    enum CodingKeys: String, CodingKey {
        case eur = "EUR"
    }
}

// MARK: - Crypto
struct Crypto: Decodable, Identifiable {
    var id: String = UUID().uuidString
    let symbol: String
    let price: String
    let pct: String
    let imageurl: String
    
    enum CodingKeys: String, CodingKey {
        case symbol = "FROMSYMBOL"
        case price = "PRICE"
        case pct = "CHANGEPCTDAY"
        case imageurl = "IMAGEURL"
    }
}

// MARK: - Crypto Comparable
extension Crypto: Comparable {
    static func < (lhs: Crypto, rhs: Crypto) -> Bool {
        lhs.symbol < rhs.symbol
    }
}
