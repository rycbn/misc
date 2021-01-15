// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shop",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ShopClient",
            targets: ["ShopClient"]
        ),
        .library(
            name: "ShopClientLive",
            targets: ["ShopClientLive"]
        ),
        .library(
            name: "ShopFeature",
            targets: ["ShopFeature"]
        ),
    ],
    dependencies: [
        .package(path: "Shared"),
        .package(path: "SharedUI"),
        .package(url: "https://github.com/onevcat/Kingfisher", from: "6.0.1"),
    ],
    targets: [
        .target(
            name: "ShopClient",
            dependencies: []
        ),
        .target(
            name: "ShopClientLive",
            dependencies: ["ShopClient"]
        ),
        .target(
            name: "ShopFeature",
            dependencies: [
                "Shared",
                "SharedUI",
                "Kingfisher",
                "ShopClientLive"
            ]
        ),
        .testTarget(
            name: "ShopTests",
            dependencies: [
                "Shared",
                "ShopClient",
                "ShopFeature"
            ],
            resources: [
                .copy("Resources")
            ]
        ),
    ]
)
