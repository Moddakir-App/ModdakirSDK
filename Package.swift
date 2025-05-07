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
                .product(name: "NetworkManager", package: "NetworkManager"),
                .product(name: "RtcBasic", package: "AgoraAudio_iOS"),
                .product(name: "SwiftyGif-Dynamic", package: "SwiftyGif")

            ],
            path: "./Sources/ModdakirSDKWrapper"
        ),
        
        .binaryTarget(
            name: "ModdakirSDK",
            url: "https://github.com/Moddakir-App/ModdakirSDK/releases/download/0.1.6/ModdakirSDK.xcframework.zip",
            checksum: "4347d66f4c5e2ae3bf6c21f69f78a0caa59a1698a5598f9af90c985b18cfd6ff"
        )
    ]
)
