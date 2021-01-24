import SwiftUI

public struct PlaceholderImage: View {
    private let aspectRatio: CGFloat
    
    public init(aspectRatio: CGFloat) {
        self.aspectRatio = aspectRatio
    }
    
    public var body: some View {
        Image("placeholder", bundle: .module)
            .resizable()
            .aspectRatio(aspectRatio, contentMode: .fit)
    }
}

struct PlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImage(aspectRatio: 0.67)
    }
}
