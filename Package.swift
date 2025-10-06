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
        .package(url: "https://github.com/neotreks/turf-swift", exact: "4.0.0"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.1"),
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
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.30.1/AccuTerraSDK.zip",
            checksum: "df975e5192a83d3c7ba6775fc9284b74ab49f4f77985463e3d42c5de7c4bdcde"
        )
    ]
)