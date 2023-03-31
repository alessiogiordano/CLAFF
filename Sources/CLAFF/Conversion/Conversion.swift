//
//  Conversion.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 22/03/23.
//

import Foundation

enum Conversion {}

struct ConversionServer {
    let interface: String
    let port: String
    
    init(interface: String = "localhost", port: Int = 2002) {
        self.interface = interface
        self.port = String(port)
    }
    
    static func interface(_ string: String) -> Self {
        return .init(interface: string)
    }
    static func port(_ int: Int) -> Self {
        return .init(port: int)
    }
}

protocol ConversionProtocol {
    static var filter_name: String { get }
    static func execute(from sourcePath: String, to destinationPath: String, on server: ConversionServer) async throws
    static func execute(from sourceData: Data, on server: ConversionServer) async throws -> Data
}

extension ConversionProtocol {
    static func execute(from sourcePath: String, to destinationPath: String, on server: ConversionServer = .init()) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            Task.detached {
                let script = """
                import uno
                from com.sun.star.beans import PropertyValue
                import os
                
                component_context = uno.getComponentContext()
                resolver = component_context.ServiceManager.createInstanceWithContext("com.sun.star.bridge.UnoUrlResolver", component_context)
                context = resolver.resolve("uno:socket,host=\(server.interface),port=\(server.port);urp;StarOffice.ComponentContext")
                desktop = context.ServiceManager.createInstanceWithContext("com.sun.star.frame.Desktop", context)
                
                input_props = (PropertyValue(Name="ReadOnly", Value=True),)
                import_path = uno.systemPathToFileUrl(os.path.abspath("\(sourcePath)"))
                document = desktop.loadComponentFromURL(import_path, "_default", 0, input_props)
                
                export_path = uno.systemPathToFileUrl(os.path.abspath("\(destinationPath)"))
                output_props = (PropertyValue(Name="FilterName", Value="\(filter_name)"), PropertyValue(Name="Overwrite", Value=True))
                
                document.storeToURL(export_path, output_props)
                document.close(True)
                """
                do {
                    let task = Process()
                    task.executableURL = URL(fileURLWithPath: try CLAFF.unoCapablePythonExecutable)
                    task.arguments = ["-c", script]
                    try task.run()
                    task.waitUntilExit()
                    continuation.resume()
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    static func execute(from sourceData: Data, on server: ConversionServer = .init()) async throws -> Data {
        return try await withCheckedThrowingContinuation { continuation in
            Task.detached {
                let workingDirectory = FileManager.default.temporaryDirectory.appending(path: UUID().uuidString, directoryHint: .isDirectory)
                try? FileManager.default.createDirectory(at: workingDirectory, withIntermediateDirectories: true)
                defer {
                    try? FileManager.default.removeItem(at: workingDirectory)
                }
                do {
                    let sourceFile = workingDirectory.appending(path: "source")
                    let destinationFile = workingDirectory.appending(path: "destination")
                    try sourceData.write(to: sourceFile)
                    try await execute(from: sourceFile.path(), to: destinationFile.path(), on: server)
                    continuation.resume(returning: try Data(contentsOf: destinationFile))
                } catch {
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}
