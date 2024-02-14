//
//  CryptoLiveActivityWidgetAttributesPreview.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 14/2/24.
//

import Foundation

// MARK: - CryptoLiveActivityWidget Attributes Preview
extension CryptoLiveActivityWidgetAttributes {
    
    static var preview: CryptoLiveActivityWidgetAttributes {
        CryptoLiveActivityWidgetAttributes(id: "id", symbol: "BTC")
    }
}

// MARK: - CryptoLiveActivityWidget ContentState Preview
extension CryptoLiveActivityWidgetAttributes.ContentState {
    
    static var initial: CryptoLiveActivityWidgetAttributes.ContentState {
        CryptoLiveActivityWidgetAttributes.ContentState(price: "48,023.51", pct: "3,14 %", timer: 0.2)
    }
    
    static var updated: CryptoLiveActivityWidgetAttributes.ContentState {
        CryptoLiveActivityWidgetAttributes.ContentState(price: "48,056.09", pct: "3,17 %", timer: 0.2)
    }
}
