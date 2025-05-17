# Swift Weather MCP

A Model Context Protocol (MCP) server written in Swift that provides a weather tool for retrieving current weather conditions for a specified city.

## Features

- Simple MCP server implementation in Swift
- Weather tool that fetches current weather data using the wttr.in API
- Standard I/O transport for integration with MCP clients

## Requirements

- macOS 13.0 or later
- Swift 6.1 or later

## Installation

Clone the repository:

```bash
git clone https://github.com/your-username/swift-version-mcp.git
cd swift-version-mcp
```

Build the project:

```bash
swift build
```

## Usage

Run the server:

```bash
swift run
```

The server provides a `weather` tool that accepts a city name and returns the current weather conditions.

## Adding to Cursor IDE

To add this MCP server to Cursor IDE, follow these steps:

1. Build the project:
   ```bash
   swift build
   ```

2. Add the following configuration to Cursor:
   ```json
   {
     "mcpServers": {
       "swift-weather-server": {
         "type": "stdio",
         "command": "/full/path/to/SimpleWeatherMCPSwift/.build/arm64-apple-macosx/debug/swift-weather-mcp"
       }
     }
   }
   ```

Now you can access the weather tool from within Cursor IDE's AI features by typing `/mcp` in the chat and selecting the weather tool.

## License

[Your License Here]

## Credits

- Uses [wttr.in](https://wttr.in/) for weather data
- Built with [Swift MCP SDK](https://github.com/modelcontextprotocol/swift-sdk)
