//
//  File.swift
//  
//
//  Created by Max Chuquimia on 30/11/19.
//

import Foundation

public func rm(_ a: URL) throws { try rm()(a) }

public func rm(R: Bool = false) -> (URL) throws -> Void {{

    var isDir = ObjCBool(true)
    guard FileManager.default.fileExists(atPath: $0.path, isDirectory: &isDir) else {
        throw "\($0) does not exist"
    }

    if R {
        try remove(file: $0)
    } else {
        guard !isDir.boolValue else { throw "\($0) is a directory" }
        try remove(file: $0)
    }
}}

private func remove(file: URL) throws {
    try FileManager.default.removeItem(at: file)
}
