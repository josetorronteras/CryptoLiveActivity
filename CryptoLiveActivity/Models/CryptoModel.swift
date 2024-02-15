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
    let id: String
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        symbol = try container.decode(String.self, forKey: .symbol)
        price = try container.decode(String.self, forKey: .price)
        pct = try container.decode(String.self, forKey: .pct)
        imageurl = try container.decode(String.self, forKey: .imageurl)
        id = "\(symbol)-\(imageurl)"
    }
    
    init(id: String, symbol: String, price: String, pct: String, imageurl: String) {
        self.id = id
        self.symbol = symbol
        self.price = price
        self.pct = pct
        self.imageurl = imageurl
    }
}

// MARK: - Crypto Comparable
extension Crypto: Comparable {
    static func < (lhs: Crypto, rhs: Crypto) -> Bool {
        lhs.symbol < rhs.symbol
    }
}
