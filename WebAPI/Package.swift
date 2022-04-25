// swift-tools-version:5.5
import PackageDescription


let package = Package(
    name: "WebAPI",
    products: [
        .library(name: "RestAPI", targets: ["RestAPI"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(name: "RestAPI"),
        .testTarget(name: "RestAPITests", dependencies: ["RestAPI"]),
    ]
)
