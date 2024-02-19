//
//  FavoritesViewModel.swift
//  CryptoLiveActivity
//
//  Created by Jose Torronteras on 14/2/24.
//

import Foundation
import ActivityKit

@Observable
final class FavoritesViewModel {
    
    // The actual cryptos the user has favorited
    private var favorites = Set<String>()
    
    // Key to use UserDefault
    private var key: String = "favorites"
    
    init() {
        let userDefaults = UserDefaults.standard
        if let savedFavorites = userDefaults.array(forKey: key) as? [String] {
            favorites = Set(savedFavorites.filter { checkLiveActivityLife($0) } )
            UserDefaults.standard.set(Array(favorites), forKey: key)
        }
    }
}

// MARK: - Public Methods
extension FavoritesViewModel {
    
    /// adds/remove the crypto to favorite set
    func modify(_ crypto: Crypto) {
        if !contains(crypto) {
            favorites.insert(crypto.id)
            addLive(crypto)
        } else {
            favorites.remove(crypto.id)
            removeLive(crypto)
        }
        favorites = favorites.filter { checkLiveActivityLife($0) }
        UserDefaults.standard.set(Array(favorites), forKey: key)
    }
    
    // returns true if our set contains this crypto
    func contains(_ crypto: Crypto) -> Bool {
        favorites.contains(crypto.id)
    }
}

// MARK: - Private Methods
private extension FavoritesViewModel {
    
    /// Request add activity
    ///
    /// state: Is the initial ActivityAttributes.ContentState for the Live Activity.
    ///
    /// staleDate: A Date to indicate the OS when the Live Activity will become outdated. If no staleDate is passed, after 8 hours, the OS
    /// will end the Live Activity.
    ///
    /// relevanceScore: If we have more than one Live Activity, relevanceScore will indicate the priority to show on the dynamic island and
    /// the order in the lock screen.
    func addLive(_ crypto: Crypto) {
        let attributes = CryptoLiveActivityWidgetAttributes(id: crypto.id, symbol: crypto.symbol)
        let state = CryptoLiveActivityWidgetAttributes.ContentState(price: crypto.price, pct: crypto.pct)
        let content = ActivityContent(state: state, staleDate: nil, relevanceScore: 1.0)
        do {
            let activity = try Activity<CryptoLiveActivityWidgetAttributes>.request(attributes: attributes, content: content)
            print("LiveActivityService: \(activity.id) Live Activity created.")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    /// Request to dismiss an activity
    func removeLive(_ crypto: Crypto) {
        if let activity = Activity<CryptoLiveActivityWidgetAttributes>.activities.first(where: { $0.attributes.id == crypto.id }) {
            Task {
                await activity.end(nil, dismissalPolicy: .immediate)
            }
        }
    }
    
    /// Check if live activity still showing
    func checkLiveActivityLife(_ id: String) -> Bool {
        let activity = Activity<CryptoLiveActivityWidgetAttributes>.activities.first(where: { $0.attributes.id == id })
        return activity != nil ? true : false
    }
}
