// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "CSStickyHeaderFlowLayout",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "CSStickyHeaderFlowLayout", targets: ["CSStickyHeaderFlowLayout"])
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "CSStickyHeaderFlowLayout",
            dependencies: [],
            path: ".",
            sources: [
                "Classes"
            ],
            publicHeadersPath: "Classes",
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        )
    ],
    swiftLanguageVersions: [.v5]
)
