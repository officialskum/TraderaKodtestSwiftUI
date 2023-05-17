import UIKit

class HapticService {
    static let shared = HapticService()
    
    private let generator = UIImpactFeedbackGenerator(style: .medium)
    
    func didTap() {
        generator.impactOccurred()
    }
}
