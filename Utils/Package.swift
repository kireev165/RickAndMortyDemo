// swift-tools-version:5.5
import PackageDescription


let package = Package(
    name: "Utils",
    products: [
        .library(name: "UIKitReusable", targets: ["UIKitReusable"]),
        .library(name: "UIKitConstraints", targets: ["UIKitConstraints"]),
        .library(name: "SwiftBackwardArrow", targets: ["SwiftBackwardArrow"])
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "UIKitReusable"),
        .target(name: "UIKitConstraints"),
        .target(name: "SwiftBackwardArrow"),
    ]
)
