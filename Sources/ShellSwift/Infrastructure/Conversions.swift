//
//  File.swift
//  
//
//  Created by Max Chuquimia on 2/12/19.
//

import Foundation

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
