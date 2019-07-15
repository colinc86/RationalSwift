// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RationalSwift",
    products: [
        .library(
            name: "RationalSwift",
            targets: ["RationalSwift"]),
    ],
    targets: [
        .target(
            name: "RationalSwift",
            dependencies: []),
        .testTarget(
            name: "RationalSwiftTests",
            dependencies: ["RationalSwift"]),
    ]
)
