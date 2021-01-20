import SwiftUI

public struct ProductFavorite: View {
    let isFavorite: Bool
    
    public init(isFavorite: Bool) {
        self.isFavorite = isFavorite
    }
    
    public var body: some View {
        Image(systemName: isFavorite ? "heart.fill" : "heart")
            .resizable()
            .frame(width: 20, height: 20)
            .padding()
    }
}

struct ProductFavorite_Previews: PreviewProvider {
    static var previews: some View {
        ProductFavorite(isFavorite: true)
    }
}
