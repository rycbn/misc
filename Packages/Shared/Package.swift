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
    ],
    targets: [
        .target(
            name: "Shared",
            resources: [
                .process("Resources")
            ]
        ),
        .testTarget(
            name: "SharedTests",
            dependencies: [
                .target(name: "Shared")
            ]
        ),
    ]
)
