//
//  File.swift
//  
//
//  Created by Max Chuquimia on 30/11/19.
//

import Foundation

public func ls(_ a: URL) throws -> [URL] { try ls()(a) }

public func ls() -> (URL) throws -> [URL] {{
    try FileManager.default.contentsOfDirectory(at: $0, includingPropertiesForKeys: nil, options: [])
}}
