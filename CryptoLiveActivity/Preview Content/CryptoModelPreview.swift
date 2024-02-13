//
//  CryptoModelPreview.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 13/2/24.
//

import Foundation

extension Crypto {
    
    static var crypto: Crypto {
        Crypto(symbol: "BTC", price: "55123", pct: "", imageurl: "")
    }
    
    static var cryptoWithoutImage: Crypto {
        Crypto(symbol: "BTC", price: "55123", pct: "", imageurl: "/media/37746251/btc.png")
    }
}
