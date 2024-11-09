// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SuperLayout",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "SuperLayout",
            targets: ["SuperLayoutCore"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "SuperLayoutCore",
            path: "Sources",
            sources: ["*"],
            swiftSettings: [
                .define("SWIFT_VERSION", to: "5.0")
            ]
        ),
        .testTarget(
            name: "SuperLayoutTests",
            dependencies: ["SuperLayoutCore"]
        ),
    ]
)
