import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { self }
}

extension URL: ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    public init(stringLiteral value: Self.StringLiteralType) {
        if value.starts(with: "http") {
            self.init(string: value)!
        } else {
            self.init(fileURLWithPath: value)
        }
    }
}

