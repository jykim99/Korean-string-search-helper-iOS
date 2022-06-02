// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    
    name: "KoreanStringSearchHelper",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "KoreanStringSearchHelper",
                 targets: ["KoreanStringSearchHelper"])
    ],
    targets: [
        .target(name: "KoreanStringSearchHelper",
                path: "KoreanStringSearchHelper/Classes")
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
