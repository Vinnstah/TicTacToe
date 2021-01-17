// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
//Importing packages. ArgParser parses input from the command-line
let package = Package(
    name: "TicTacToe",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.4"),
    ],
    targets: [
        .target(
            name: "TicTacToe",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ]
        ),
        .testTarget(
            name: "TicTacToeTests",
            dependencies: ["TicTacToe"]),
    ]
)
