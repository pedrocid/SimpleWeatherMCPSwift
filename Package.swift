// swift-tools-version:6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
 
import PackageDescription
 
let package = Package(
    name: "swift-weather-mcp",
    platforms: [
        .macOS(.v13),
    ],
    products: [
        .executable(name: "swift-weather-mcp", targets: ["SimpleWeatherMCPSwift"]),
    ],
    dependencies: [
        .package(url: "https://github.com/modelcontextprotocol/swift-sdk", from: "0.7.1"),
    ],
    targets: [
        .executableTarget(name: "SimpleWeatherMCPSwift", dependencies: [
            .product(name: "MCP", package: "swift-sdk")
        ]),
    ]
)
