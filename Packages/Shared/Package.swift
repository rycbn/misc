// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Shared",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "Shared",
            targets: ["Shared"]),
    ],
    dependencies: [
        //.package(path: "Shop/Sources/Product")
    ],
    targets: [
        .target(
            name: "Shared",
            dependencies: []),
        .testTarget(
            name: "SharedTests",
            dependencies: [
                .target(name: "Shared")
            ],
            resources: [
                .copy("Resources")
            ]
        ),
    ]
)
