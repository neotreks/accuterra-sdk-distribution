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
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk-core/0.40.0/AccuTerraSDKCore.zip",
            checksum: "761542e85587ad6fa452859be230f3e3a75373433608563f6653e38499066491"
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.40.0/AccuTerraSDK.zip",
            checksum: "9b68bfa9e9013ee076b3262c7f391913ef2a7b34e59631707ecfa020f16b02c4"
        )
    ]
)