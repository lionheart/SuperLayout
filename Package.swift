// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "SuperLayout",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "SuperLayout",
            targets: ["SuperLayout"]
        ),
    ],
    targets: [
        .target(
            name: "SuperLayout",
            path: "Sources"
        ),
        .testTarget(
            name: "SuperLayoutTests",
            dependencies: ["SuperLayout"]
        ),
    ]
)
