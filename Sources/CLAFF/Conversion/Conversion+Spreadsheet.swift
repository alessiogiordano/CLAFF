//
//  Conversion+Spreadsheet.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 23/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

extension Conversion {
    enum Spreadsheet {
        enum toHTML: ConversionProtocol {
            static let filter_name: String = "HTML (StarCalc)"
        }
        enum toPDF: ConversionProtocol {
            static let filter_name: String = "calc_pdf_Export"
        }
        enum toOpenDocument: ConversionProtocol {
            static let filter_name: String = "calc8"
        }
        enum toNumbers: ConversionProtocol {
            static let filter_name: String = "Apple Numbers"
        }
        enum toExcel: ConversionProtocol {
            static let filter_name: String = "Calc MS Excel 2007 XML"
        }
        enum toLegacyExcel: ConversionProtocol {
            static let filter_name: String = "MS Excel 97"
        }
        enum toCSV: ConversionProtocol {
            static let filter_name: String = "Text - txt - csv (StarCalc)"
        }
    }
}
