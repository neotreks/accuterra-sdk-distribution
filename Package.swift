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
        .package(url: "https://github.com/neotreks/GRDB.swift", exact: "7.6.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.10.2"),
        .package(url: "https://github.com/1024jp/GzipSwift", exact: "6.1.0"),
        .package(url: "https://github.com/neotreks/turf-swift", exact: "4.0.0"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.1"),
        .package(url: "https://github.com/neotreks/ReachabilitySwift", exact: "5.2.4"),
        .package(url: "https://github.com/ZipArchive/ZipArchive", exact: "2.4.3"),
        .package(url: "https://github.com/neotreks/sqlcipher-distribution", exact: "4.5.7")
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
                .process("AccuTerraSDK_AccuTerraSDKWrapper.bundle"),
                .process("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.30.1/AccuTerraSDK.zip",
            checksum: "c2908a5b2f59dfa11192fb5cd98a6ba4afee36bf7e12683d9027b62c965ffa67"
        )
    ]
)