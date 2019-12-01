//
//  File.swift
//  
//
//  Created by Max Chuquimia on 29/11/19.
//

import Foundation

//private struct echo: Pipeable {
//    typealias Input = Any
//    typealias Output = String
//
//    let n: Bool
//
//    init(n: Bool = false) {
//        self.n = n
//    }
//
//    func echo(_ a: Any) -> String {
//        let suffix = n ? "" : "\n"
//
//        if let a = a as? [Any] {
//            return a.reduce("", { $0 + "\($1)" + suffix})
//        } else {
//            return "\(a)" + suffix
//        }
//    }
//
//    func pipe(_ x: echo.Input) throws -> echo.Output {
//        echo(x)
//    }
//}

public func echo(_ a: Any) -> String { echo()(a) }

public func echo(n: Bool = false) -> (Any) -> String {{
    let suffix = n ? "" : "\n"

    if let a = $0 as? [Any] {
        let isf = suffix.isEmpty ? " " : " \n"
        return a.map { "\($0)" }.joined(separator: isf) + suffix
    }
    if let a = $0 as? Data {
        return String(data: a, encoding: .utf8)
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

//func echo(_ options: EchoOptions...) -> (Any) -> String {
//    ECHO(
//        n: options.contains(.n)
//    ).echo
//}
//
//func echo(_ a: Any) -> String {
//    ECHO(
//        n: false
//    )
//    .echo(a)
//}

// Special
//func echo(_ a: Any) {
//    let s: String = echo(a)
//    print(s)
//}
