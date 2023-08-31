// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScienceEtudes",
    defaultLocalization: "en",
    platforms: [.macOS(.v13), .iOS(.v16), .tvOS(.v16), .watchOS(.v9)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "Astronomy", targets: ["Astronomy"]),
        .library(name: "CoreMaths", targets: ["CoreMaths"]),
        .library(name: "UnitsAndMeasurements", targets: ["UnitsAndMeasurements"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/tuparev/SoftwareEtudes", branch: "dev"),

    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        
        .target(name: "Astronomy",          dependencies: [.product(name: "SoftwareEtudesUtilities", package: "SoftwareEtudes"), "CoreMaths",], path: "Sources/Astronomy"),
        .target(name: "CoreMaths",            dependencies: [],            path: "Sources/CoreMaths"),
        .target(name: "UnitsAndMeasurements", dependencies: [],            path: "Sources/UnitsAndMeasurements"),
        
        .testTarget(name: "AstronomyTests", dependencies: ["Astronomy"], path: "Tests/Astronomy"),
        .testTarget(name: "CoreMathsTests", dependencies: ["CoreMaths"], path: "Tests/CoreMaths"),
        .testTarget(name: "UnitsAndMeasurementsTests", dependencies: ["UnitsAndMeasurements"], path: "Tests/UnitsAndMeasurements"),
    ]
)
