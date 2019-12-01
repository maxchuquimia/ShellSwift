import Foundation

struct ShellSwift {
    var text = "Hello, World!"
}

extension String: LocalizedError {
    public var errorDescription: String? { self }
}

extension URL: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: Self.StringLiteralType) {
        self.init(fileURLWithPath: value)
    }
}

//precedencegroup PipeOperatorPrecedence {
//    associativity: left
//}

//infix operator |: PipeOperatorPrecedence

@discardableResult
func |<X,Y>(a: () -> X, b: (X) -> (Y)) -> Y { b(a()) }

@discardableResult
func |<X,Y>(a: X, b: (X) -> (Y)) -> Y { b(a) }

func |<X>(a: X, b: (X) -> ()) { b(a) }

func >(a: String, b: URL) throws {
    try a.data(using: .utf8)?.write(to: b)
}
