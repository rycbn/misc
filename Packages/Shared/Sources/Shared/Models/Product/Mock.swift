import Foundation

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
            shots: [
                "in",
                "ou",
                "bk",
                "cu",
                "e1"
            ],
            sizes: [
                "dl",
                "l"
            ],
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
    
    public static let placeholder = (0...11).map { number in
        Self(
            id: number,
            name: String(repeating: " ", count: 20),
            price: Product.Price(currency: "GBP", divisor: 100, amount: 10000),
            images: Product.Images(shots: ["in"], sizes: ["dl"], urlTemplate: "{{scheme}}//cache.net-a-porter.com/images/products/\(number))/\(number)_{{shot}}_{{size}}.jpg"),
            badges: ["In_Stock"]
        )
    }
}
