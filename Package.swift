// swift-tools-version: 6.4
import PackageDescription
let package = Package(
    name: "swift-search",
    platforms: [.macOS(.v27), .iOS(.v27), .tvOS(.v27), .watchOS(.v27), .visionOS(.v27)],
    products: [.library(name: "Search", targets: ["Search"])],
    targets: [.target(name: "Search"), .testTarget(name: "Search Tests", dependencies: ["Search"])],
    swiftLanguageModes: [.v6]
)
for target in package.targets {
    target.swiftSettings = [.enableExperimentalFeature("Lifetimes"), .enableUpcomingFeature("ExistentialAny"), .enableUpcomingFeature("InferIsolatedConformances")]
}
