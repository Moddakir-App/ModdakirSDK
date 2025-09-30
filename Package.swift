// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModdakirSDK",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "ModdakirSDK",
            targets: ["ModdakirSDKWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Amin-0-1/NetworkManager", .upToNextMajor(from: "1.6.2")),
        .package(url: "https://github.com/AgoraIO/AgoraAudio_iOS", .upToNextMajor(from: "4.3.1")),
        .package(url: "https://github.com/alexiscreuzot/SwiftyGif", .upToNextMajor(from: "5.4.5"))
    ],
    
    targets: [
        .target(
            name: "ModdakirSDKWrapper",
            dependencies: [
                .target(name: "ModdakirSDK"),
                .target(name: "AgoraRtmKit"),
                .product(name: "NetworkManager", package: "NetworkManager"),
                .product(name: "RtcBasic", package: "AgoraAudio_iOS"),
                .product(name: "SwiftyGif-Dynamic", package: "SwiftyGif")

            ],
            path: "./Sources/ModdakirSDKWrapper"
        ),
        .binaryTarget(
            name: "AgoraRtmKit",
            path: "Sources/AgoraRtmKit.xcframework"
        ),
        
        .binaryTarget(
            name: "ModdakirSDK",
            url: "https://github.com/Moddakir-App/ModdakirSDK/releases/download/0.1.8/ModdakirSDK.xcframework.zip",
            checksum: "ba280a7b99d34c02f9a71d2e19d564e56afffddee1d6ddd240d3aca137476256"
        )
    ]
)
