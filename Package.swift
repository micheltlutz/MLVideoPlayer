// swift-tools-version:4.2
//
//  MLVideoPlayer.swift
//  MLVideoPlayer
//
//  Created by Michel Lutz on 23/10/15.
//  Copyright © 2017 micheltlutz. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MLVideoPlayer",
    products: [
        .library(
            name: "MLVideoPlayer",
            targets: ["MLVideoPlayer"]),
        ],
    dependencies: [],
    targets: [
        .target(
            name: "MLVideoPlayer",
            dependencies: ["UIKit", "AVKit", "AVFoundation"],
            path: "Sources"),
        .testTarget(
            name: "MLVideoPlayerTests",
            dependencies: ["MLVideoPlayer"],
            path: "Tests")
    ]
)
