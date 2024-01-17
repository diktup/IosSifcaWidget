// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "iossifcawidget",
  defaultLocalization: "en",
  platforms: [
    .iOS(.v17)
  ],
  products: [
    .library(
      name: "iossifcawidget",
      targets: ["iossifcawidget"])
  ],
  dependencies: [
    .package(url: "https://github.com/globulus/swiftui-gif.git", from: "1.0.1"),
    .package(url: "https://github.com/dmytro-anokhin/url-image", from: "3.1.1"),
  ],
  targets: [
    .target(
      name: "iossifcawidget",
      dependencies: [
        .product(name: "SwiftUIGIF", package: "swiftui-gif"),
        .product(name: "URLImage", package: "url-image"),

      ],
      resources: [
        .copy("Resources/Localization")
      ]
    ),
    .testTarget(
      name: "iossifcawidgetTests",
      dependencies: ["iossifcawidget"]),
  ]
)