// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AccuTerraSDK",
    platforms: [
        .iOS(.v14),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AccuTerraSDK",
            targets: ["AccuTerraSDK","AccuTerraSDKWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/turf-swift", exact: "4.0.0"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.2"),
        .package(url: "https://github.com/neotreks/ReachabilitySwift", exact: "5.2.4"),
    ],
    targets: [
        .target(
            name: "AccuTerraSDKWrapper",
            dependencies: [
                "AccuTerraSDK",
                .product(name: "MapLibre", package: "maplibre-ios-distribution"),
                .product(name: "Turf", package: "turf-swift"),
                .product(name: "ReachabilitySwift", package: "ReachabilitySwift"),
            ],
            resources: [
                .process("AccuTerraSDK_AccuTerraSDK.bundle"),
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.30.3/AccuTerraSDK.zip",
            checksum: "fd1c3f1122e6cabf64e756118ffd003acc9a608ce7da46bae21437e4a4fc3a30"
        )
    ]
)