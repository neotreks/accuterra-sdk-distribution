// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AccuTerraSDK",
    platforms: [
        .iOS(.v15),
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "AccuTerraSDKCore",
            targets: ["AccuTerraSDKCore","AccuTerraSDKWrapper"]
        ),
        .library(
            name: "AccuTerraSDK",
            targets: ["AccuTerraSDK", "AccuTerraSDKCore", "AccuTerraSDKWrapper", "AccuTerraSDKMapWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/mapbox/turf-swift", exact: "4.0.0"),
        .package(url: "https://github.com/neotreks/ReachabilitySwift", exact: "5.2.4"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.2")
    ],
    targets: [
        .target(
            name: "AccuTerraSDKWrapper",
            dependencies: [
                "AccuTerraSDKCore",
                .product(name: "Turf", package: "turf-swift"),
                .product(name: "ReachabilitySwift", package: "ReachabilitySwift"),
            ],
            resources: [
                .process("AccuTerraSDK_AccuTerraSDK.bundle"),
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
        .target(
            name: "AccuTerraSDKMapWrapper",
            dependencies: [
                "AccuTerraSDK",
                .product(name: "MapLibre", package: "maplibre-ios-distribution")
            ]
        ),
        .binaryTarget(
            name: "AccuTerraSDKCore",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk-core/0.41.0/AccuTerraSDKCore.zip",
            checksum: "8a3577aa02af6ad230e9bee9901c9a5fa6ccd1543e91d25dd2daa92d91b58da3"
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.41.0/AccuTerraSDK.zip",
            checksum: "cc9dbcc160f37414c991083f620fe28041400ead77858a523e0ef6b57b05b3a6"
        )
    ]
)