import SwiftUI
import Kingfisher

public struct ProductImage: View {
    private let url: URL?
    private let aspectRatio: CGFloat = 0.67
    private let shape = RoundedRectangle(cornerRadius: 16, style: .continuous)
    
    public init(_ url: URL?) {
        self.url = url
    }
    
    public var body: some View {
        KFImage(url)
            .placeholder { PlaceholderImage(aspectRatio: aspectRatio) }
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
            .clipShape(shape)
            .contentShape(shape)
    }
}

struct ProductImage_Previews: PreviewProvider {
    static let url = URL(string: "https://cache.net-a-porter.com/images/products/1317866/1317866_in_dl.jpg")
    static var previews: some View {
        ProductImage(url)
    }
}
