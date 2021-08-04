// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YandexMapsMobileWrapper",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "YandexMapsMobileWrapper",
            targets: ["YandexMapsMobileWrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        //.binaryTarget(name: "YandexMapsMobileBinary", path: "YandexMapsMobile.xcframework"),
        .binaryTarget(
            name: "YandexMapsMobileBinary",
            url: "https://github.com/Nyakit/YandexMapsMobileWrapper/releases/download/1.0.0/YandexMapsMobile.xcframework.zip",
            checksum: "90b4402623a7a10ec57538db320ff132414a59e8a517e205181d8ae97f7c166e"
        ),
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(
            name: "YandexMapsMobileWrapper",
            dependencies: [
                .target(name: "YandexMapsMobileBinary"),
            ],
            linkerSettings: [
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"]),
            ]),
    ]
)
