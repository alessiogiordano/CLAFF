//
//  Conversion+Parse.swift
//  
//
//  Created by Alessio Giordano on 23/05/23.
//

import Foundation

public extension Conversion {
    static func parse(sourceExtension: String, targetExtension: String) -> (any ConversionProtocol.Type)? {
        switch targetExtension {
        /// HTML
        case "html", "htm":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toHTML.self
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toHTML.self
            default: return nil
            }
        /// PDF
        case "pdf":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toPDF.self
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toPDF.self
            case "ppt", "pptx", "odp", "keynote":
                return Conversion.Presentation.toPDF.self
            default: return nil
            }
        /// Text formats
        case "doc":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toLegacyWord.self
            default: return nil
            }
        case "docx":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toWord.self
            default: return nil
            }
        case "odt":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toOpenDocument.self
            default: return nil
            }
        case "pages":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toPages.self
            default: return nil
            }
        case "rtf":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toRTF.self
            default: return nil
            }
        case "epub":
            switch sourceExtension {
            case "doc", "docx", "odt", "pages", "rtf", "txt", "epub":
                return Conversion.Text.toEPUB.self
            default: return nil
            }
        /// Spreadsheet formats
        case "xls":
            switch sourceExtension {
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toLegacyExcel.self
            default: return nil
            }
        case "xlsx":
            switch sourceExtension {
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toExcel.self
            default: return nil
            }
        case "ods":
            switch sourceExtension {
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toOpenDocument.self
            default: return nil
            }
        case "numbers":
            switch sourceExtension {
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toNumbers.self
            default: return nil
            }
        case "csv":
            switch sourceExtension {
            case "xls", "xlsx", "ods", "numbers", "csv":
                return Conversion.Spreadsheet.toCSV.self
            default: return nil
            }
        /// Presentation formats
        case "ppt":
            switch sourceExtension {
            case "ppt", "pptx", "odp", "keynote":
                return Conversion.Presentation.toLegacyPowerPoint.self
            default: return nil
            }
        case "pptx":
            switch sourceExtension {
            case "ppt", "pptx", "odp", "keynote":
                return Conversion.Presentation.toPowerPoint.self
            default: return nil
            }
        case "odp":
            switch sourceExtension {
            case "ppt", "pptx", "odp", "keynote":
                return Conversion.Presentation.toOpenDocument.self
            default: return nil
            }
        case "keynote":
            switch sourceExtension {
            case "ppt", "pptx", "odp", "keynote":
                return Conversion.Presentation.toKeynote.self
            default: return nil
            }
        ///
        default: return nil
        }
    }
}
