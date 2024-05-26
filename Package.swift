// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModdakirSDK",
    platforms: [.iOS(.v13)],
    products: [
        .library(
            name: "ModdakirSDK",
            targets: ["ModdakirSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Amin-0-1/NetworkManager", .upToNextMajor(from: "1.3.1")),
        .package(url: "https://github.com/AgoraIO/AgoraRtm_iOS", .upToNextMajor(from: "1.5.1")),
        .package(url: "https://github.com/AgoraIO/AgoraAudio_iOS", .upToNextMajor(from: "4.3.1"))
    ],
    
    targets: [
        .target(
            name: "ModdakirSDKWrapper",
            dependencies: [
                .target(name: "ModdakirSDK"),
                .product(name: "NetworkManager", package: "NetworkManager"),
                .product(name: "AgoraRtmKit", package: "AgoraRtm_iOS"),
                .product(name: "RtcBasic", package: "AgoraAudio_iOS"),
            ],
            path: "./Sources/ModdakirSDKWrapper",
            linkerSettings: [
                .linkedFramework("ModdakirSDK")
            ]
        ),
//        .binaryTarget(
//            name: "ModdakirSDK",
//            url: "https://github.com/Moddakir-App/ModdakirSDK/releases/download/v0.0.1/ModdakirSDK.xcframework.zip",
//            checksum: "fbd9487b2d92e5cdcfd895bf475eccb1b6ef6e6e44495f4e9ef7cc5f69361605"
//        )
        .binaryTarget(
            name: "ModdakirSDK",
            path: "./Frameworks/ModdakirSDK.xcframework"
        )
    ]
)
