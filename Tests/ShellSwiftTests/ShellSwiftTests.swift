import XCTest
@testable import ShellSwift

final class ShellSwiftTests: XCTestCase {

    func testExample() {

        let originalPath = URL("test")
        let newPath = URL("test2")

        do {

            echo(n: true)("This is a test")

            try cd("/tmp")

            XCTAssertNil(try? cat(originalPath))

            try echo("Test") > originalPath

            try ls(".") | echo(n: true)

            try mv(originalPath, newPath)

            XCTAssertNil(try? cat(originalPath))

            try cat(newPath) | echo()

            try rm(newPath)
            XCTAssertNil(try? rm(newPath))

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
