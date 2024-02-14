//
//  CryptoLiveActivityWidgetAttributes.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 14/2/24.
//

import ActivityKit

struct CryptoLiveActivityWidgetAttributes: ActivityAttributes {
    
    struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var price: String
        var pct: String
        var timer: Float
    }
    
    // Fixed non-changing properties about your activity go here!
    var id: String
    var symbol: String
}
