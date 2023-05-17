import Foundation
import CoreData
import Combine

class DataManager: ObservableObject {
    @Published var feed: ProductFeed? = nil
    @Published var favorites: [ProductJSON] = [] {
        didSet {
            saveFavorites()
        }
    }
    
    init() {
        fetchData()
        loadFavorites()
    }
    
    func fetchData() {
        guard let url = URL(string: "https://www.tradera.com/static/images/NO_REV/frontend-task/ProductFeedResult.json") else {
            print("DEBUG: Invalid URL")
            return
        }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let self = self else { return }
            
            guard let data = data else {
                print("DEBUG: Invalid data")
                return
            }
            do {
                let decoder = JSONDecoder()
                let feed = try decoder.decode(ProductFeed.self, from: data)
                DispatchQueue.main.async {
                    self.feed = feed
                }
            } catch {
                print("DEBUG: Failed to decode JSON: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func toggleFavorite(_ product: ProductJSON) {
        if favorites.contains(product) {
            favorites.removeAll(where: { $0 == product })
        } else {
            favorites.append(product)
            print("DEBUG: favorites = \(favorites.count)")
        }
    }
    
    // MARK: - Sparar ner data i UserDefaults
    
    private func saveFavorites() {
        do {
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: "favorites")
        } catch {
            print("Error saving favorites: \(error)")
        }
    }
    
    func loadFavorites() {
        guard let data = UserDefaults.standard.data(forKey: "favorites") else {
            return
        }
        do {
            let favorites = try JSONDecoder().decode([ProductJSON].self, from: data)
            self.favorites = favorites
        } catch {
            print("Error loading favorites: \(error)")
        }
    }
}
