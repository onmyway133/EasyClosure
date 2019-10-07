// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "EasyClosure",
    platforms: [
        .macOS(.v10_13),
        .iOS(.v10),
        .tvOS(.v11)
    ],
    products: [
        .library(
            name: "EasyClosure",
            targets: ["EasyClosure"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "EasyClosure",
            dependencies: [],
            path: "Sources"),
        .testTarget(
            name: "EasyClosureTests",
            dependencies: ["EasyClosure"],
            path: "EasyClosureTests"),
    ]
)
