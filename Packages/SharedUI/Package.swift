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
        .package(url: "https://github.com/onevcat/Kingfisher", from: "6.1.0"),
    ],
    targets: [
        .target(
            name: "SharedUI",
            dependencies: ["Kingfisher"]
        ),
        .testTarget(
            name: "SharedUITests",
            dependencies: ["SharedUI"]),
    ]
)
