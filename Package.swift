// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SensorGraph",
    platforms: [
        .iOS("17.0")
    ],
    products: [
        .iOSApplication(
            name: "SensorGraph",
            targets: ["AppModule"],
            bundleIdentifier: "com.quinto.SensorGraph",
            teamIdentifier: "CH6WB3TNKQ",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .boat),
            accentColor: .presetColor(.brown),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/AppPear/ChartView", "1.5.5"..<"2.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "SwiftUICharts", package: "chartview")
            ],
            path: "."
        )
    ]
)
