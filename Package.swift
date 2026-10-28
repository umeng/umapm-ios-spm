// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "UMAPM",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "UMAPM", targets: ["UMAPM", "UMAPMDependencies"]),
    ],
    targets: [
        .binaryTarget(
            name: "UMAPM",
            path: "UMAPM.xcframework"
        ),
        // Binary targets cannot declare linker settings.
        .target(
            name: "UMAPMDependencies",
            dependencies: ["UMAPM"],
            linkerSettings: [.linkedLibrary("c++")]
        ),
    ]
)
