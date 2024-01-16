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
        .copy("Resources/Img/lord-icon-walkie-talkie.gif"),
        .copy("Resources/Img/lord-icon-reputation.png"),
        .copy("Resources/Img/lord-icon-joystick.gif"),
        .copy("Resources/Img/lord-icon-monster.gif"),
        .copy("Resources/Img/lord-icon-profile.gif"),
        .copy("Resources/Img/lord-icon-stairs.gif"),
        .copy("Resources/Img/lord-icon-money.gif"),
        .copy("Resources/Img/lord-icon-chat.gif"),
        .copy("Resources/Img/lord-icon-coin.gif"),
        .copy("Resources/Img/lord-icon-gift.gif"),
        .copy("Resources/Img/lord-icon-link.gif"),
        .copy("Resources/Img/sifca-app-icon.png"),
        .copy("Resources/Img/lord-icon-eye.gif"),
        .copy("Resources/Img/ios-app-icon.png"),
      ]
    ),
    .testTarget(
      name: "iossifcawidgetTests",
      dependencies: ["iossifcawidget"]),
  ]
)
