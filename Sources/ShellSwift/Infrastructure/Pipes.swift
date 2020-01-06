//
//  File.swift
//  
//
//  Created by Max Chuquimia on 2/12/19.
//

import Foundation

@discardableResult
public func |<X,Y>(a: () throws -> X, b: (X) throws -> (Y)) rethrows -> Y {
    try b(a())
}

@discardableResult
public func |<X,Y>(a: X, b: (X) throws -> (Y)) rethrows -> Y {
    try b(a)
}

public func |<X>(a: X, b: (X) throws -> ()) rethrows {
    try b(a)
}

public func >(a: String, b: URL) throws {
    try a.data(using: .utf8)?.write(to: b)
}

public func >(a: Data, b: URL) throws {
    try a.write(to: b)
}
