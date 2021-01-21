import SwiftUI

public struct PlaceholderImage: View {
    public init() {}
    
    public var body: some View {
        Image("placeholder", bundle: .module)
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}

struct PlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImage()
    }
}
