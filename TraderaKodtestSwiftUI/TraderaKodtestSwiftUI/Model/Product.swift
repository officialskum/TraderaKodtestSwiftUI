import Foundation

struct ProductFeed: Codable {
    let products: [ProductJSON]
}

struct ProductJSON: Codable, Identifiable, Hashable {
    let id: Int
    let title: String
    let price: Int
    let currency: Currency
    let image: String
    var isFavorite: Bool = false
    
    private enum CodingKeys: String, CodingKey {
            case id, title, price, currency, image
        }
}

enum Currency: String, Codable {
    case sek = "SEK"
    case dollar = "$"
    case euro = "€"
}
