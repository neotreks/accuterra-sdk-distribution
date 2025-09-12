// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "AccuTerraSDK",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "AccuTerraSDK",
            targets: ["AccuTerraSDK"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/neotreks/GRDB.swift", exact: "7.6.1"),
        .package(url: "https://github.com/Alamofire/Alamofire", exact: "5.9.0"),
        .package(url: "https://github.com/neotreks/GzipLib", exact: "renamed-package"),
        .package(url: "https://github.com/mapbox/turf-swift", exact: "2.8.0"),
        .package(url: "https://github.com/neotreks/maplibre-ios-distribution", exact: "6.18.1"),
        .package(url: "https://github.com/neotreks/Reachability.swift", exact: "package-rename"),
        .package(url: "https://github.com/ZipArchive/ZipArchive", exact: "2.4.3"),
        .package(url: "https://github.com/neotreks/sqlcipher-distribution", exact: "4.5.7")
    ],
    targets: [
        .binaryTarget(
            name: "AccuTerraSDK",
            path: "AccuTerraSDK.xcframework"
        )
    ]
)
