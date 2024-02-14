//
//  CryptoLiveActivityWidgetView.swift
//  CryptoLiveActivityWidgetExtension
//
//  Created by Jose Torronteras on 14/2/24.
//

import SwiftUI
import WidgetKit

struct CryptoLiveActivityWidgetView: View {
    
    var context: ActivityViewContext<CryptoLiveActivityWidgetAttributes>
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(.black)
                .frame(width: 50.0, height: 50.0)
            VStack(alignment: .leading) {
                Text(context.attributes.symbol)
                    .font(.title2)
                    .foregroundStyle(.black)
                    .bold()
                Text("\(context.state.price) €")
                    .font(.body)
                    .foregroundStyle(.black.opacity(0.7))
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack(spacing: 2) {
                    Image(systemName: "arrowtriangle.up.fill")
                        .font(.body)
                    Text(context.state.pct)
                        .font(.body)
                }
                .foregroundColor(.green)
                ProgressView(value: context.state.timer)
                    .scaledToFit()
                    .frame(width: 60)
            }
        }
    }
}
