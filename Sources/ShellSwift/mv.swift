//
//  File.swift
//  
//
//  Created by Max Chuquimia on 29/11/19.
//

import Foundation

public func mv(_ a: URL, _ b: URL) throws { try mv()(a, b) }

public func mv() -> (URL, URL) throws -> Void {{
    try FileManager.default.moveItem(at: $0, to: $1)
}}
