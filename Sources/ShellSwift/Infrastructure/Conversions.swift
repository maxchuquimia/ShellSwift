//
//  File.swift
//  
//
//  Created by Max Chuquimia on 2/12/19.
//

import Foundation
import Cocoa

public extension String {

    static func new() -> (Data) throws -> String {{
        guard let s = String(data: $0, encoding: .utf8) else {
            throw "Cannot convert '\($0)' to String"
        }
        return s
    }}
}

public extension Data {

    static func new() -> (String) throws -> Data {{
        guard let data = $0.data(using: .utf8) else {
            throw "Cannot convert '\($0)' to Data"
        }
        return data
    }}

    static func new() -> (NSImage) throws -> Data {{
        guard let tiffRepresentation = $0.tiffRepresentation,
            let bitmapImage = NSBitmapImageRep(data: tiffRepresentation),
            let png = bitmapImage.representation(using: .png, properties: [:]) else {
                throw "Cannot convert '\($0)' to Data"
        }
        return png
    }}
}

public extension JSONDecoder {

    func decode<T: Decodable>(_ type: T.Type) -> (Data) throws -> T {{
        try self.decode(type, from: $0)
    }}
}

public extension JSONEncoder {

    func encode<T: Encodable>() -> (T) throws -> Data {{
        try self.encode($0)
    }}
}

public extension NSImage {

    static func new() -> (Data) throws -> NSImage {{
        guard let image = NSImage(data: $0) else {
            throw "Cannot convert '\($0)' to NSImage"
        }
        return image
    }}

    static func new() -> (URL) throws -> NSImage {{
        guard let image = NSImage(contentsOf: $0) else {
            throw "Cannot get NSImage from '\($0)'"
        }
        return image
    }}
}

