import SwiftUI

public struct ProductFavoriteButton: View {
    let isFavorite: Bool
    let action: () -> Void
    
    public init(isFavorite: Bool, action: @escaping () -> Void) {
        self.isFavorite = isFavorite
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Image(systemName: isFavorite ? "heart.fill" : "heart")
                .resizable()
                .imageScale(.large)
                .frame(width: 22, height: 22)
                .padding()
                .contentShape(Rectangle())
        }
        .accessibility(label: Text("\(isFavorite ? "Remove from" : "Add to") favorites"))
        .buttonStyle(PlainButtonStyle())
    }
}

struct ProductFavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        ProductFavoriteButton(isFavorite: true, action: {})
            .previewLayout(.sizeThatFits)
    }
}
