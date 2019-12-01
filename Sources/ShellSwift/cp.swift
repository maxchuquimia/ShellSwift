//
//  File.swift
//  
//
//  Created by Max Chuquimia on 29/11/19.
//

import Foundation

public func cp(_ a: URL, to b: URL) throws { try cp()(a, b) }

public func cp() -> (URL, URL) throws -> Void {{
    try FileManager.default.copyItem(at: $0, to: $1)
}}
