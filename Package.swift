// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "MiniKit",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "MiniKit",
            targets: ["MiniKit"]
        )
    ],
    targets: [
        .target(
            name: "MiniKit",
            path: "Sources/MiniKit"
        ),
        .testTarget(
            name: "MiniKitTests",
            dependencies: ["MiniKit"],
            path: "Tests/MiniKitTests"
        )
    ]
)
