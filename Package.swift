// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "Coffee",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "Coffee",
            targets: ["Coffee"]),
    ],
    targets: [
        .target(
            name: "Coffee",
            path: "Sources")
    ]
)
