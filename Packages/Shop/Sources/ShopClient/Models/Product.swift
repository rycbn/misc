import Foundation

public struct Product: Codable, Equatable, Hashable, Identifiable {
    public let id: Int
    public let name: String
    public let price: Price
    public let images: Images
    public let badges: [String]
    
    public var badge: String {
        badges.first?.replacingOccurrences(of: "_", with: " ") ?? ""
    }
    
    public struct Price: Codable, Hashable, Equatable {
        public let currency: String
        public let divisor: Int
        public let amount: Int
        
        private var price: Int {
            amount / divisor
        }
        
        public var totalAmount: String {
            currency + " \(price)"
        }
        
        public init(currency: String, divisor: Int, amount: Int) {
            self.currency = currency
            self.divisor = divisor
            self.amount = amount
        }
    }
    
    public struct Images: Codable, Hashable, Equatable {
        public let shots: [String]
        public let sizes: [String]
        public let urlTemplate: String
        
        public var url: URL? {
            URL(
                string: urlTemplate
                    .replacingOccurrences(of: "{{scheme}}", with: "https:")
                    .replacingOccurrences(of: "{{shot}}", with: shots.first ?? "in")
                    .replacingOccurrences(of: "{{size}}", with: sizes.first ?? "dl")
            )
        }
        
        public init(shots: [String], sizes: [String], urlTemplate: String) {
            self.shots = shots
            self.sizes = sizes
            self.urlTemplate = urlTemplate
        }
    }
}

extension Product {
    public static let miniDress = Self(
        id: 1317866,
        name: "Mini dress",
        price: Product.Price(
            currency: "GBP",
            divisor: 100,
            amount: 10000
        ),
        images: Product.Images(
            shots: ["in", "ou"],
            sizes: ["dl", "l"],
            urlTemplate: "{{scheme}}//cache.net-a-porter.com/images/products/1317866/1317866_{{shot}}_{{size}}.jpg"
        ),
        badges: ["In_Stock"]
    )
    
    public static let cashmereCardigan = Self(
        id: 1304125,
        name: "Cashmere cardigan",
        price: Product.Price(
            currency: "GBP",
            divisor: 100,
            amount: 150000
        ),
        images: Product.Images(
            shots: ["in", "ou"],
            sizes: ["dl", "l"],
            urlTemplate: "{{scheme}}//cache.net-a-porter.com/images/products/1304125/1304125_{{shot}}_{{size}}.jpg"
        ),
        badges: ["In_Stock"]
    )
}
