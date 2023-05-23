//
//  Conversion+Presentation.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 23/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

public extension Conversion {
    enum Presentation {}
}

public extension Conversion.Presentation {
    enum toPDF: ConversionProtocol {
        public static let filter_name: String = "impress_pdf_Export"
    }
    enum toOpenDocument: ConversionProtocol {
        public static let filter_name: String = "impress8"
    }
    enum toKeynote: ConversionProtocol {
        public static let filter_name: String = "Apple Keynote"
    }
    enum toPowerPoint: ConversionProtocol {
        public static let filter_name: String = "Impress MS PowerPoint 2007 XML"
    }
    enum toLegacyPowerPoint: ConversionProtocol {
        public static let filter_name: String = "MS PowerPoint 97"
    }
}
