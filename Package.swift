// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "EthicalGrow",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "EthicalGrow",
            targets: ["EthicalGrow"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "EthicalGrow",
            path: "EthicalGrow",
            exclude: [
                "Resources/Info.plist"
            ],
            resources: [
                .process("Resources/Assets.xcassets")
            ]
        )
    ]
)
