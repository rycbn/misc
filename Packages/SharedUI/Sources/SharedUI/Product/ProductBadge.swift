import SwiftUI

public struct ProductBadge: View {
    private let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .foregroundColor(.secondary)
            .accessibility(label: Text(text))
    }
}

struct ProductBadge_Previews: PreviewProvider {
    static var previews: some View {
        ProductBadge("In Stock")
    }
}
