// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MeteorologicalServiceOfCanada",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12)
    ],
    products: [
        .library(
            name: "MeteorologicalServiceOfCanada",
            targets: ["MeteorologicalServiceOfCanada"]),
    ],
    dependencies: [
        .package(url: "https://github.com/MaxDesiatov/XMLCoder.git", from: "0.11.1"),
        .package(url: "https://github.com/GEOSwift/GEOSwift.git", from: "7.0.0"),
        .package(url: "https://github.com/GEOSwift/geos.git", from: "5.0.0")
    ],
    targets: [
        .target(
            name: "MeteorologicalServiceOfCanada",
            dependencies: [
                .product(name: "XMLCoder", package: "XMLCoder"),
                .product(name: "GEOSwift", package: "GEOSwift"),
                .product(name: "geos", package: "geos")
            ]),
        .testTarget(
            name: "MeteorologicalServiceOfCanadaTests",
            dependencies: ["MeteorologicalServiceOfCanada"])
    ]
)
