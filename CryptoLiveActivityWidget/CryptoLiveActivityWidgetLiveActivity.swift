//
//  CryptoLiveActivityWidgetLiveActivity.swift
//  CryptoLiveActivityWidget
//
//  Created by Jose Torronteras on 12/2/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct CryptoLiveActivityWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct CryptoLiveActivityWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CryptoLiveActivityWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(.black)
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension CryptoLiveActivityWidgetAttributes {
    fileprivate static var preview: CryptoLiveActivityWidgetAttributes {
        CryptoLiveActivityWidgetAttributes(name: "World")
    }
}

extension CryptoLiveActivityWidgetAttributes.ContentState {
    fileprivate static var smiley: CryptoLiveActivityWidgetAttributes.ContentState {
        CryptoLiveActivityWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: CryptoLiveActivityWidgetAttributes.ContentState {
         CryptoLiveActivityWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: CryptoLiveActivityWidgetAttributes.preview) {
   CryptoLiveActivityWidgetLiveActivity()
} contentStates: {
    CryptoLiveActivityWidgetAttributes.ContentState.smiley
    CryptoLiveActivityWidgetAttributes.ContentState.starEyes
}
