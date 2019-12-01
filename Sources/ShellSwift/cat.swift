//
//  File.swift
//  
//
//  Created by Max Chuquimia on 29/11/19.
//

import Foundation

public func cat(_ a: URL) throws -> Data { try cat()(a) }

public func cat() -> (URL) throws -> Data {{
    try Data(contentsOf: $0)
}}
