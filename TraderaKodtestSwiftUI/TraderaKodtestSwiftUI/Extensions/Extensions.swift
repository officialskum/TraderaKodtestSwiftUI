import Foundation
import SwiftUI

// MARK: - FrameSize 

struct FrameSize {
    static let IMAGE_WIDTH: CGFloat = 80
    static let IMAGE_HEIGHT: CGFloat = 100
}

extension View {
    func staticFrame() -> some View {
        self.frame(width: FrameSize.IMAGE_WIDTH, height: FrameSize.IMAGE_HEIGHT)
    }
}

// MARK: - Navigation

enum NavigationTab {
    case products
    case favorites
}

extension NavigationTab {
    @ViewBuilder
    func view(dataManager: DataManager) -> some View {
        switch self {
        case .products:
            ProductsView(dataManager: dataManager)
        case .favorites:
            FavoritesView(dataManager: dataManager)
        }
    }
}

// MARK: - Colors

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue)
    }

    static let midnightBlue = Color(hex: "41729F")
    static let blueGray = Color(hex: "5885AF")
    static let darkBlue = Color(hex: "274472")
    static let babyBlue = Color(hex: "C3E0E5")
}

