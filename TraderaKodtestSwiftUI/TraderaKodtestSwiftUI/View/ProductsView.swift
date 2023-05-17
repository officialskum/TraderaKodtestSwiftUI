import SwiftUI

struct ProductsView: View {
    @StateObject var dataManager: DataManager
    
    var body: some View {
        Group {
            if dataManager.feed == nil {
                Spacer()
                ProgressView()
                Spacer()
            } else {
                List(dataManager.feed?.products ?? [], id: \.self) { product in
                    ProductItemView(dataManager: dataManager, product: product)
                }
            }
        }
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(dataManager: DataManager())
    }
}
