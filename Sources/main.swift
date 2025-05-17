import Foundation
import MCP
 
let server = Server(
    name: "Swift Version Server",
    version: "1.0.0",
    capabilities: .init(tools: .init(listChanged: false))
)
 
let transport = StdioTransport()
try await server.start(transport: transport)
 
await server.withMethodHandler(ListTools.self) { params in
    
    let weather =  Tool(
        name: "weather",
        description: "Get current weather for a location",
        inputSchema: .object([
            "type": .string("object"),
            "properties": .object([
                "city": .string("City name")
            ])
        ])
    )

    return ListTools.Result(tools: [weather])
}

await server.withMethodHandler(CallTool.self) { params in
   if params.name == "weather" {
        guard let city = params.arguments?["city"]?.stringValue else {
            throw MCPError.invalidParams("City parameter missing")
        }
        let weather = await weatherInCity(city: city)
        return CallTool.Result(content: [.text(weather)])
    } else {
        throw MCPError.invalidParams("Wrong tool name: \(params.name)")
    }
}

func weatherInCity(city: String) async -> String {
    let cityEncoded = city.replacingOccurrences(of: " ", with: "%20")
    let urlString = "https://wttr.in/\(cityEncoded)?format=3&lang=en"
    guard let url = URL(string: urlString) else {
        return "URL invalid"
    }
    do {
        let (data, _) = try await URLSession.shared.data(from: url)
        return String(data: data, encoding: .utf8) ?? "Response invalid"
    } catch {
        return "Error getting weather: \(error)"
    }
}

await server.waitUntilCompleted()
