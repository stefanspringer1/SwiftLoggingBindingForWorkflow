// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLoggingBindingForWorkflow",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SwiftLoggingBindingForWorkflow",
            targets: ["SwiftLoggingBindingForWorkflow"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/stefanspringer1/SwiftWorkflow", from: "0.0.34"),
        .package(url: "https://github.com/apple/swift-log.git", from: "1.4.4"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "SwiftLoggingBindingForWorkflow",
            dependencies: [
                .product(name: "Workflow", package: "SwiftWorkflow"),
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "SwiftLoggingBindingForWorkflowTests",
            dependencies: ["SwiftLoggingBindingForWorkflow"]),
    ]
)
