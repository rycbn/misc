// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shop",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "VanillaShopClient",
            targets: ["VanillaShopClient"]
        ),
        .library(
            name: "VanillaShopClientLive",
            targets: ["VanillaShopClientLive"]
        ),
        .library(
            name: "VanillaShopFeature",
            targets: ["VanillaShopFeature"]
        ),
        .library(
            name: "ComposableShopClient",
            targets: ["ComposableShopClient"]
        ),
        .library(
            name: "ComposableShopClientLive",
            targets: ["ComposableShopClientLive"]
        ),
        .library(
            name: "ComposableShopFeature",
            targets: ["ComposableShopFeature"]
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
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", from: "0.10.0")
    ],
    targets: [
        .target(
            name: "VanillaShopClient",
            dependencies: ["Product"]
        ),
        .target(
            name: "VanillaShopClientLive",
            dependencies: [
                "VanillaShopClient",
                "Product"
            ]
        ),
        .target(
            name: "VanillaShopFeature",
            dependencies: [
                "Shared",
                "VanillaShopClientLive",
                "Product",
                "ProductList"
            ]
        ),
        .target(
            name: "ComposableShopClient",
            dependencies: [
                "Product",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "ComposableShopClientLive",
            dependencies: [
                "ComposableShopClient",
                "Product"
            ]
        ),
        .target(
            name: "ComposableShopFeature",
            dependencies: [
                "Shared",
                "ComposableShopClientLive",
                "Product",
                "ProductList"
            ]
        ),
        .target(
            name: "ProductList",
            dependencies: [
                "VanillaShopClient",
                "ProductDetail",
                "Product"
            ]
        ),
        .target(
            name: "ProductDetail",
            dependencies: [
                "VanillaShopClient",
                "SharedUI"
            ]
        ),
        .target(
            name: "Product",
            dependencies: [
                "SharedUI"
            ]
        ),
        .testTarget(
            name: "ShopTests",
            dependencies: [
                "Shared",
                "VanillaShopClient",
                "VanillaShopFeature"
            ],
            resources: [
                .copy("Resources")
            ]
        ),
    ]
)
