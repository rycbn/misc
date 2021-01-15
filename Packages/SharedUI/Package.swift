// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "SharedUI",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SharedUI",
            targets: ["SharedUI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "SharedUI",
            dependencies: []),
        .testTarget(
            name: "SharedUITests",
            dependencies: ["SharedUI"]),
    ]
)
