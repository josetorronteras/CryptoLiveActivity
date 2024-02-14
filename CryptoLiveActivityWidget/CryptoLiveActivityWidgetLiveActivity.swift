//
//  CryptoLiveActivityWidgetLiveActivity.swift
//  CryptoLiveActivityWidget
//
//  Created by Jose Torronteras on 12/2/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CryptoLiveActivityWidgetLiveActivity: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CryptoLiveActivityWidgetAttributes.self) { context in
            CryptoLiveActivityWidgetView(context: context)
                .padding()
                .activityBackgroundTint(.black)
                .activitySystemActionForegroundColor(.black)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {}
                DynamicIslandExpandedRegion(.trailing) {}
                DynamicIslandExpandedRegion(.bottom) {
                    CryptoLiveActivityWidgetView(context: context)
                }
            } compactLeading: {
                Text(context.attributes.symbol)
            } compactTrailing: {
                Text(context.state.price)
            } minimal: {
                Text(context.state.pct)
            }
            .keylineTint(Color.red)
        }
    }
}

#Preview("Notification", as: .content, using: CryptoLiveActivityWidgetAttributes.preview) {
    CryptoLiveActivityWidgetLiveActivity()
} contentStates: {
    CryptoLiveActivityWidgetAttributes.ContentState.initial
    CryptoLiveActivityWidgetAttributes.ContentState.updated
}
