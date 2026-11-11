// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "Wild",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "Wild",
            targets: ["Wild"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Wild",
            path: "Wild",
            exclude: [
                "Resources/Info.plist"
            ],
            resources: [
                .process("Resources/Assets.xcassets")
            ]
        )
    ]
)
