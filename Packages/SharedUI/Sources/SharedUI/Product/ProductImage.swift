import SwiftUI
import Kingfisher

public struct ProductImage: View {
    private let url: URL?
    
    public init(_ url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        KFImage(url)
            .placeholder { PlaceholderImage() }
            .resizable()
            .aspectRatio(contentMode: .fit)
            .cornerRadius(8)
            .padding(.leading, 8)
    }
}

struct ProductImage_Previews: PreviewProvider {
    static let url = URL(string: "https://cache.net-a-porter.com/images/products/1317866/1317866_in_dl.jpg")
    static var previews: some View {
        ProductImage(url)
    }
}
