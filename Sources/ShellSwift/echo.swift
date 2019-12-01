//
//  File.swift
//  
//
//  Created by Max Chuquimia on 29/11/19.
//

import Foundation

public func echo(_ a: Any) -> String { echo()(a) }

public func echo(n: Bool = false) -> (Any) -> String {{
    let suffix = n ? "" : "\n"

    if let a = $0 as? [Any] {
        let isf = suffix.isEmpty ? " " : " \n"
        return a.map { "\($0)" }.joined(separator: isf) + suffix
    }
    if let a = $0 as? Data {
        return String(data: a, encoding: .utf8) ?? "\(a)"
    } else {
        return "\($0)" + suffix
    }
}}

// Special case for echo to print when not piping to anything
// Ambiguity ensues when using Any instead of String :(
public func echo(n: Bool = false) -> ((Any) -> Void) {{
    let s: String = echo(n: n)($0)
    print(s, terminator: "")
}}

public func echo(n: Bool = false) -> ((String) -> Void) {{
    let s: String = echo(n: n)($0)
    print(s, terminator: "")
}}
