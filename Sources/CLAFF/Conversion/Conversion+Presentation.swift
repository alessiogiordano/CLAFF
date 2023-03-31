//
//  Conversion+Presentation.swift
//  The Conversion of LibreOffice Accepted File Formats
//
//  Created by Alessio Giordano on 23/03/23.
//
//  For a complete filter reference
//  https://help.libreoffice.org/latest/en-US/text/shared/guide/convertfilters.html

import Foundation

extension Conversion {
    enum Presentation {
        enum toPDF: ConversionProtocol {
            static let filter_name: String = "impress_pdf_Export"
        }
        enum toOpenDocument: ConversionProtocol {
            static let filter_name: String = "impress8"
        }
        enum toKeynote: ConversionProtocol {
            static let filter_name: String = "Apple Keynote"
        }
        enum toPowerPoint: ConversionProtocol {
            static let filter_name: String = "Impress MS PowerPoint 2007 XML"
        }
        enum toLegacyPowerPoint: ConversionProtocol {
            static let filter_name: String = "MS PowerPoint 97"
        }
    }
}
