// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shop",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "VanillaShopFeature",
            targets: ["VanillaShopFeature"]
        ),
        .library(
            name: "ComposableShopFeature",
            targets: ["ComposableShopFeature"]
        ),
        .library(
            name: "Product",
            targets: ["Product"]
        ),
    ],
    dependencies: [
        .package(path: "Shared"),
        .package(path: "SharedUI"),
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "0.10.0"
        )
    ],
    targets: [
        .target(
            name: "VanillaShopFeature",
            dependencies: [
                .target(name: "Product"),
                .product(name: "Shared", package: "Shared"),
                .product(name: "SharedUI", package: "SharedUI")
            ]
        ),
        .target(
            name: "ComposableShopFeature",
            dependencies: [
                .target(name: "Product"),
                .product(name: "Shared", package: "Shared"),
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "Product",
            dependencies: [
                .product(name: "SharedUI", package: "SharedUI"),
            ]
        ),
        .testTarget(
            name: "ShopTests",
            dependencies: [
                .target(name: "VanillaShopFeature"),
                .product(name: "Shared", package: "Shared")
            ]
        ),
    ]
)
