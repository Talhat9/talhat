// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Search",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "Search",
            targets: ["Search"]),
    ],
    dependencies: [
        .package(name: "Overture",
                 url: "https://github.com/pointfreeco/swift-overture", .exact("0.5.0")),
    ],
    targets: [
        .target(
            name: "Search",
            dependencies: ["Overture"],
            resources: [
                .process("Storyboard.storyboard"),
                .process("Views/PlaceholderView.xib"),
                .process("Views/PlaceholderItemView.xib"),
                .process("Views/RecentSearchesHeaderView.xib"),
                .process("Cells/RecentSearchCell.xib"),
                .process("Cells/CountryCell.xib"),
                .process("Cells/ServerCell.xib"),
                .process("Resources")
            ])
    ]
)