// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ScienceEtudes",
    defaultLocalization: "en",
    platforms: [.macOS(.v13), .iOS(.v15), .tvOS(.v11), .watchOS(.v5)],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "Coordinates", targets: ["Coordinates"]),
        .library(name: "CoreMaths", targets: ["CoreMaths"]),
        .library(name: "CoreAstronomy", targets: ["CoreAstronomy"]),
        .library(name: "Time", targets: ["Time"]),
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
        
        .target(name: "Coordinates",          dependencies: ["CoreMaths", "Time"], path: "Sources/Astronomy/Coordinates"),
        .target(name: "CoreMaths",            dependencies: [],            path: "Sources/CoreMaths"),
        .target(name: "CoreAstronomy",        dependencies: ["CoreMaths"], path: "Sources/Astronomy/CoreAstronomy"),
        .target(name: "Time",        dependencies: [.product(name: "SoftwareEtudesUtilities", package: "SoftwareEtudes"), "CoreMaths", "CoreAstronomy"], path: "Sources/Astronomy/Time"),
        .target(name: "UnitsAndMeasurements", dependencies: [],            path: "Sources/UnitsAndMeasurements"),
        
        .testTarget(name: "CoordinatesTests", dependencies: ["Coordinates", "Time"], path: "Tests/Coordinates"),
        .testTarget(name: "CoreMathsTests", dependencies: ["CoreMaths"], path: "Tests/CoreMaths"),
//        .testTarget(name: "CoreAstronomyTests", dependencies: ["CoreAstronomy"], path: "Tests/CoreAstronomy"),
        .testTarget(name: "TimeTests", dependencies: ["Time"], path: "Tests/Time"),
        .testTarget(name: "UnitsAndMeasurementsTests", dependencies: ["UnitsAndMeasurements"], path: "Tests/UnitsAndMeasurements"),
    ]
)
