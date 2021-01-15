import SwiftUI

public struct PlaceholderImage: View {
    
    public init() {}
    
    public var body: some View {
        Image("placeholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
    }
}

struct PlaceholderImage_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderImage()
    }
}
