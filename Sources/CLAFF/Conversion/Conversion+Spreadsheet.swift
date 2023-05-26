//
//  Conversion+Spreadsheet.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 23/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

public extension Conversion {
    enum Spreadsheet {}
}

public extension Conversion.Spreadsheet {
    enum toHTML: ConversionProtocol {
        public static let filter_name: String = "HTML (StarCalc)"
        public static let filter_options: String? = "EmbedImages" // "SkipImages"
    }
    enum toPDF: ConversionProtocol {
        public static let filter_name: String = "calc_pdf_Export"
    }
    enum toOpenDocument: ConversionProtocol {
        public static let filter_name: String = "calc8"
    }
    enum toNumbers: ConversionProtocol {
        public static let filter_name: String = "Apple Numbers"
    }
    enum toExcel: ConversionProtocol {
        public static let filter_name: String = "Calc MS Excel 2007 XML"
    }
    enum toLegacyExcel: ConversionProtocol {
        public static let filter_name: String = "MS Excel 97"
    }
    enum toCSV: ConversionProtocol {
        public static let filter_name: String = "Text - txt - csv (StarCalc)"
    }
}
