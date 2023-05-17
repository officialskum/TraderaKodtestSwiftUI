import SwiftUI

struct ContentView: View {
    @State private var selectedTab: NavigationTab = .products
    @StateObject var dataManager = DataManager()
    
    var body: some View {
        NavigationView {
            VStack {
                selectedTab.view(dataManager: dataManager)
                Spacer()
            }
            .navigationTitle(selectedTab == .products ? "Products" : "Favorites")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    withAnimation(.spring()) {
                        Button(action: {
                            selectedTab = .products
                        }) {
                            Image(systemName: "cart")
                            Text("Product")
                        }
                        .accentColor(selectedTab == .products ? .black : .gray)
                        .scaleEffect(selectedTab == .products ? 1.05 : 1.0)
                    }
                    
                    withAnimation(.spring()){
                        Button(action: {
                                selectedTab = .favorites
                        }) {
                            Image(systemName: "star")
                            Text("Favorite")
                        }
                        .accentColor(selectedTab == .favorites ? .black : .gray)
                        .scaleEffect(selectedTab == .favorites ? 1.05 : 1.0)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
