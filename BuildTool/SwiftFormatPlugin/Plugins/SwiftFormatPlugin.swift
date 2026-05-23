import PackagePlugin
import struct Foundation.URL

@main
struct SwiftFormatPlugin: BuildToolPlugin {
    func createBuildCommands(context: PluginContext, target: Target) async throws -> [Command] {
        return []
    }
}

#if canImport(XcodeProjectPlugin)
import XcodeProjectPlugin

extension SwiftFormatPlugin: XcodeBuildToolPlugin {
    // Entry point for creating build commands for targets in Xcode projects.
    func createBuildCommands(context: XcodePluginContext, target: XcodeTarget) throws -> [Command] {
        let directoryURL = context.xcodeProject.directoryURL;
        let swiftFormatFile = directoryURL.appending(path: ".swift-format")
        let sourceFiles = directoryURL.appending(path: "Pomolo")
        return [
          .buildCommand(
            displayName: "Run swift-format",
            executable: try context.tool(named: "swift").url,
            arguments: [
              "format",
              "lint",
              "--strict",
              "--configuration",
              swiftFormatFile.path(),
              "-r",
              sourceFiles.path(),
            ],
            inputFiles: [],
            outputFiles: []
          )
        ]
    }
}

#endif
