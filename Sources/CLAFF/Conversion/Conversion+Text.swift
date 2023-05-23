//
//  Conversion+Text.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 22/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

public extension Conversion {
    enum Text {}
}

public extension Conversion.Text {
    enum toHTML: ConversionProtocol {
        public static let filter_name: String = "HTML (StarWriter)"
        public static let filter_options: String? = "EmbedImages"
    }
    enum toPDF: ConversionProtocol {
        public static let filter_name: String = "writer_pdf_Export"
    }
    enum toOpenDocument: ConversionProtocol {
        public static let filter_name: String = "writer8"
    }
    enum toPages: ConversionProtocol {
        public static let filter_name: String = "Apple Pages"
    }
    enum toWord: ConversionProtocol {
        public static let filter_name: String = "MS Word 2007 XML"
    }
    enum toLegacyWord: ConversionProtocol {
        public static let filter_name: String = "MS Word 97"
    }
    enum toRTF: ConversionProtocol {
        public static let filter_name: String = "Rich Text Format"
    }
    enum toPlainText: ConversionProtocol {
        public static let filter_name: String = "Text"
    }
    enum toEPUB: ConversionProtocol {
        public static let filter_name: String = "EPUB"
    }
}
