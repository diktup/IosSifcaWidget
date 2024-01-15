//
//  File.swift
//  iossifcawidget
//
//  Created by Diktup LLC on 15/1/2024.
//

import PackageDescription

let package = Package(
    name: "swift-algorithms",
    products: [
        .library(
            name: "Algorithms",
            targets: ["Algorithms"]),
    ],
    dependencies: [
        .package(url: "https://github.com/globulus/swiftui-gif", from: "1.0.1"),
        .package(url: "https://github.com/dmytro-anokhin/url-image", from: "3.1.1"),
        
    ],
    targets: [
        .target(
            name: "Algorithms",
            dependencies: [
              .product(name: "RealModule", package: "swift-numerics"),
            ]),
        .testTarget(
            name: "SwiftAlgorithmsTests",
            dependencies: ["Algorithms"]),
    ]
)
