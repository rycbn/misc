import Foundation

public struct Product: Codable, Equatable, Hashable, Identifiable {
    public let id: Int
    public let name: String
    public let price: Price
    public let images: Images
    public let badges: [String]
    
    public var isFavorite: Bool = false
    
    public var badge: String {
        badges.first?.replacingOccurrences(of: "_", with: " ") ?? ""
    }
    
    public init(id: Int, name: String, price: Price, images: Images, badges: [String]) {
        self.id = id
        self.name = name
        self.price = price
        self.images = images
        self.badges = badges
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Price.self, forKey: .price)
        images = try container.decode(Images.self, forKey: .images)
        badges = try container.decode([String].self, forKey: .badges)
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
        
        public var urls: [URL?] {
            shots.map {
                URL(
                    string: urlTemplate
                        .replacingOccurrences(of: "{{scheme}}", with: "https:")
                        .replacingOccurrences(of: "{{shot}}", with: $0)
                        .replacingOccurrences(of: "{{size}}", with: sizes.first ?? "dl")
                )
            }
        }
    }
}
