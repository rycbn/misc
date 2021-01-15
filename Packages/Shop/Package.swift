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
        .library(
            name: "ProductList",
            targets: ["ProductList"]
        ),
        .library(
            name: "ProductDetail",
            targets: ["ProductDetail"]
        ),
        .library(
            name: "Product",
            targets: ["Product"]
        ),
    ],
    dependencies: [
        .package(path: "Shared"),
        .package(path: "SharedUI"),
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
                "ShopClientLive",
                "ProductList"
            ]
        ),
        .target(
            name: "ProductList",
            dependencies: [
                "ShopClient",
                "ProductDetail",
                "Product"
            ]
        ),
        .target(
            name: "ProductDetail",
            dependencies: [
                "ShopClient",
                "SharedUI"
            ]
        ),
        .target(
            name: "Product",
            dependencies: [
                "ShopClient",
                "SharedUI"
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
