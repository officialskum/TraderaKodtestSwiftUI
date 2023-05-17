import SwiftUI

struct ProductItemView: View {
    let dataManager: DataManager
    @State var product: ProductJSON
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            let isFavorite = dataManager.favorites.contains(product)
            HStack(spacing: 16) {
                let url = URL(string: product.image)
                AsyncImage(url: url, content: { returnedImage in
                    returnedImage
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 100)
                        .cornerRadius(12)
                }, placeholder: {
                    if let url = url, !url.absoluteString.isEmpty {
                        Color.gray
                            .opacity(0.5)
                            .frame(width: 100, height: 100)
                            .cornerRadius(12)
                            .padding(.leading)
                    } else {
                        ProgressView()
                    }
                })
                
                VStack(alignment: .leading, spacing: 35) {
                    Text(product.title)
                        .font(.headline)
                        .lineLimit(nil)
                        .fixedSize(horizontal: false, vertical: true)
                    
                    Text("\(product.price) \(product.currency.rawValue)")
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
            }
            .padding()
            .background(background)
            .cornerRadius(12)
            
            HeartView(isFavorite: isFavorite) {
                dataManager.toggleFavorite(product)
                product.isFavorite.toggle()
                dataManager.loadFavorites()
            }
            .padding(15)
        }
    }
    
    var background: some View {
        Rectangle()
            .fill(LinearGradient(colors: [
                Color.white,
                Color.gray.opacity(0.5)
            ], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: UIScreen.main.bounds.width, height: FrameSize.IMAGE_HEIGHT * 1.2)
            .cornerRadius(12)
    }
}
