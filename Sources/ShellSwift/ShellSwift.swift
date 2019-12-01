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

@discardableResult
public func |<X,Y>(a: () -> X, b: (X) -> (Y)) -> Y { b(a()) }

@discardableResult
public func |<X,Y>(a: X, b: (X) -> (Y)) -> Y { b(a) }

public func |<X>(a: X, b: (X) -> ()) { b(a) }

public func >(a: String, b: URL) throws {
    try a.data(using: .utf8)?.write(to: b)
}
