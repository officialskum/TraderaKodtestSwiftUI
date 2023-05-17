import SwiftUI

struct HeartView: View {
    @State var isFilled: Bool
    let isFavorite: Bool 
    let heartAction: () -> Void
    
    init(isFavorite: Bool, heartAction: @escaping () -> Void) {
            self.isFavorite = isFavorite
            self._isFilled = State(initialValue: isFavorite)
            self.heartAction = heartAction
        }
    
    var body: some View {
        ZStack {
            Image(systemName: "heart")
                .resizable()
                .foregroundColor(Color.black.opacity(0.7))
                .frame(width: 30, height: 30)
            
            Image(systemName: isFilled ? "heart.fill" : "heart")
                .resizable()
                .frame(width: 26, height: 26)
                .foregroundColor(isFilled ? Color.red : Color.black.opacity(0.1))
                .onTapGesture {
                    heartAction()
                    withAnimation {
                        isFilled.toggle()
                    }
                    HapticService.shared.didTap()
                }
        }
    }
}
