import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "TraderaKodtestSwiftUI")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("DEBUG: Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
