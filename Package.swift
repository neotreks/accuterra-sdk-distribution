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
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk-core/0.40.2/AccuTerraSDKCore.zip",
            checksum: "5db4260fb11be063a21a6c4de04ff02a2238200fc7df739606af7110ceb67fe4"
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.40.2/AccuTerraSDK.zip",
            checksum: "db60e3226bf12d141feb892651fa1c93e16dbafe13feb54e77d13a26cffddf1b"
        )
    ]
)