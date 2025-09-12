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
            targets: ["AccuTerraSDKWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/neotreks/GRDB.swift", exact: "7.6.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.9.0"),
        .package(url: "https://github.com/neotreks/GzipLib", branch: "renamed-package"),
        .package(url: "https://github.com/mapbox/turf-swift", exact: "2.8.0"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.1"),
        .package(url: "https://github.com/neotreks/Reachability.swift", branch: "package-rename"),
        .package(url: "https://github.com/ZipArchive/ZipArchive", exact: "2.4.3"),
        .package(url: "https://github.com/neotreks/sqlcipher-distribution", exact: "4.5.7")
    ],
    targets: [
        .target(
            name: "AccuTerraSDKWrapper",
            dependencies: [
                .target(name: "AccuTerraSDK"),
                .product(name: "GRDB", package: "GRDB.swift"),
                .product(name: "Alamofire", package: "Alamofire"),
                .product(name: "GzipLib", package: "GzipLib"),
                .product(name: "Turf", package: "turf-swift"),
                .product(name: "MapLibre", package: "maplibre-ios-distribution"),
                .product(name: "ReachabilityLib", package: "Reachability.swift"),
                .product(name: "ZipArchive", package: "ZipArchive"),
                .product(name: "AccuTerraSQLCipher", package: "sqlcipher-distribution")
            ]
        ),
        .binaryTarget(
            name: "AccuTerraSDK",
            url: "https://distribution.accuterra.com/com/accuterra/accuterra-ios-sdk/0.30.0/AccuTerraSDK.zip",
            checksum: "d0efb957597c65ff2c13e35826fd458b9c4f5f35801a7250955d28cad972256b"
        )
    ]
)
