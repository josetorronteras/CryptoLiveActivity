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
            thumbnailImage(context.attributes.id)
                .resizable()
                .frame(width: 50.0, height: 50.0)
            VStack(alignment: .leading) {
                Text(context.attributes.symbol)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .bold()
                Text(context.state.price)
                    .font(.body)
                    .foregroundStyle(.white.opacity(0.7))
            }
            Spacer()
            HStack(spacing: 2) {
                Image(systemName: "arrowtriangle.up.fill")
                    .font(.body)
                Text("\(context.state.pct) %")
                    .font(.body)
            }
            .foregroundColor(.green)
        }
    }
}

// MARK: - Private Methods
private extension CryptoLiveActivityWidgetView {
    
    /// Creates a thumbnail image from an image file name.
    func thumbnailImage(_ imageFileName: String) -> Image {
        let defaultImage = Image(systemName: "dollarsign.circle.fill")
        
        guard let url = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.josetorronteras.cryptoLive")?.appendingPathComponent(imageFileName) else {
            return defaultImage
        }
        
        if let data = try? Data(contentsOf: url), let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
        } else {
            return defaultImage
        }
    }
}
