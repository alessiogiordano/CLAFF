//
//  Conversion+Text.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 22/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

extension Conversion {
    enum Text {
        enum toHTML: ConversionProtocol {
            static let filter_name: String = "HTML (StarWriter)"
        }
        enum toPDF: ConversionProtocol {
            static let filter_name: String = "writer_pdf_Export"
        }
        enum toOpenDocument: ConversionProtocol {
            static let filter_name: String = "writer8"
        }
        enum toPages: ConversionProtocol {
            static let filter_name: String = "Apple Pages"
        }
        enum toWord: ConversionProtocol {
            static let filter_name: String = "MS Word 2007 XML"
        }
        enum toLegacyWord: ConversionProtocol {
            static let filter_name: String = "MS Word 97"
        }
        enum toRTF: ConversionProtocol {
            static let filter_name: String = "Rich Text Format"
        }
        enum toPlainText: ConversionProtocol {
            static let filter_name: String = "Text"
        }
        enum toEPUB: ConversionProtocol {
            static let filter_name: String = "EPUB"
        }
    }
}
