// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "EasyClosure",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "EasyClosure",
            targets: ["EasyClosure"]),
    ],
    targets: [
        .target(
            name: "EasyClosure",
            path: "Sources"
        ),
        .testTarget(
            name: "EasyClosureTests",
            dependencies: ["EasyClosure"]),
    ],
    swiftLanguageVersions: [.v5]
)
