//
//  CLAFF.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 22/03/23.
//  soffice -headless -accept="socket,host=localhost,port=2002;urp"

import Foundation

/*
MARK: Example Usage
if let desktop = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask).first {
    try await Conversion.Text.toPDF.execute(from: try Data(contentsOf: desktop.appending(component: "Test.docx"))).write(to: desktop.appending(component: "Test-Doc-\(Date().iso8601).pdf"))
    try await Conversion.Spreadsheet.toHTML.execute(from: try Data(contentsOf: desktop.appending(component: "Test.xlsx"))).write(to: desktop.appending(component: "Test-Xls-\(Date().iso8601).html"))
    try await Conversion.Presentation.toPDF.execute(from: try Data(contentsOf: desktop.appending(component: "Test.ppt"))).write(to: desktop.appending(component: "Test-Ppt-\(Date().iso8601)
}
*/

public struct CLAFF: Codable, Equatable {
    
    // MARK: Error code thrown
    enum Error: Swift.Error, LocalizedError {
        // Errors thrown when suitable executables are not found
        case libreOfficeExecutableNotFound, unoCapablePythonExecutableNotFound
        var errorDescription: String? {
            switch self {
                case .libreOfficeExecutableNotFound: return "The LibreOffice executable (soffice) was not found in the user defined (if any), /Application (macOS only) or the standard Unix directories"
                case .unoCapablePythonExecutableNotFound: return "The Python 3 executable (python3) was not found in the user defined (if any), /Application (macOS only) or the standard Unix directories"
            }
        }
    }
    
    // MARK: Soffice executable for starting the server
    static private var findLibreOfficeExecutable: String? {
        return [
            // Mac OS Paths
            "/Applications/LibreOffice.app/Contents/MacOS/soffice",
            // Unix Paths
            "/lib/libreoffice/program/soffice",
            "/usr/lib/libreoffice/program/soffice"
        ].first(where: {
            FileManager.default.fileExists(atPath: $0)
        })
    }
    static var userDefinedLibreOfficeExecutable: String?
    static var libreOfficeExecutable: String {
        get throws {
            if let userDefinedLibreOfficeExecutable, FileManager.default.fileExists(atPath: userDefinedLibreOfficeExecutable) == true {
                return userDefinedLibreOfficeExecutable
            } else if let systemLibreOfficeExecutable = findLibreOfficeExecutable {
                return systemLibreOfficeExecutable
            } else {
                throw Error.libreOfficeExecutableNotFound
            }
        }
    }
    
    // MARK: Python3 executable for speaking the UNO Remote Protocol
    static private var findUnoCapablePythonExecutable: String? {
        return [
            // Mac OS Paths
            "/Applications/LibreOffice.app/Contents/Resources/python",
            // Unix Paths
            "/bin/python3",
            "/usr/bin/python3"
        ].first(where: {
            FileManager.default.fileExists(atPath: $0)
        })
    }
    static var userDefinedUnoCapablePythonExecutable: String?
    static var unoCapablePythonExecutable: String {
        get throws {
            if let userDefinedUnoCapablePythonExecutable, FileManager.default.fileExists(atPath: userDefinedUnoCapablePythonExecutable) == true {
                return userDefinedUnoCapablePythonExecutable
            } else if let systemUnoCapablePythonExecutable = findUnoCapablePythonExecutable {
                return systemUnoCapablePythonExecutable
            } else {
                throw Error.unoCapablePythonExecutableNotFound
            }
        }
    }
}
