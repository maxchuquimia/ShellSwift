//
//  File.swift
//  
//
//  Created by Max Chuquimia on 1/12/19.
//

import Foundation

public func cd(_ a: URL) throws { try cd()(a) }

public func cd() -> (URL) throws -> Void {{
    if !FileManager.default.changeCurrentDirectoryPath($0.path) {
        throw "Could not change directory to \($0.path)"
    }
}}
