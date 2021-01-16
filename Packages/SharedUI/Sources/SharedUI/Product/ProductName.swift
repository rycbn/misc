import SwiftUI

public struct ProductName: View {
    private let text: String
    
    public init(_ text: String) {
        self.text = text
    }
    
    public var body: some View {
        Text(text)
            .accessibility(label: Text(text))
            .padding(.bottom, 2)
    }
}

struct ProductName_Previews: PreviewProvider {
    static var previews: some View {
        ProductName("Mini dress")
    }
}
