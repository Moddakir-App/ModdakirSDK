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
        .package(url: "https://github.com/Amin-0-1/NetworkManager", .upToNextMajor(from: "1.4.0")),
        .package(url: "https://github.com/AgoraIO/AgoraRtm_iOS", .upToNextMajor(from: "1.5.1")),
        .package(url: "https://github.com/AgoraIO/AgoraAudio_iOS", .upToNextMajor(from: "4.3.1")),
        .package(url: "https://github.com/alexiscreuzot/SwiftyGif", .upToNextMajor(from: "5.4.5"))
    ],
    
    targets: [
        .target(
            name: "ModdakirSDKWrapper",
            dependencies: [
                .target(name: "ModdakirSDK"),
                .product(name: "NetworkManager", package: "NetworkManager"),
                .product(name: "AgoraRtmKit", package: "AgoraRtm_iOS"),
                .product(name: "RtcBasic", package: "AgoraAudio_iOS"),
                .product(name: "SwiftyGif-Dynamic", package: "SwiftyGif")

            ],
            path: "./Sources/ModdakirSDKWrapper"
        ),
        
        .binaryTarget(
            name: "ModdakirSDK",
            url: "https://github.com/Moddakir-App/ModdakirSDK/releases/download/0.0.15/ModdakirSDK.xcframework.zip",
            checksum: "abe455f380fb33d13f2ea2431f1eb4d705902504d494638a02f3276d3b33b669"
        )
    ]
)
