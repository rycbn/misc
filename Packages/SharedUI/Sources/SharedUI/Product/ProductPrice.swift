import SwiftUI

public struct ProductPrice: View {
    private let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .fontWeight(.bold)
            .accessibility(label: Text("total price" + text))
    }
}

struct ProductPrice_Previews: PreviewProvider {
    static var previews: some View {
        ProductPrice("GBP 100")
    }
}
