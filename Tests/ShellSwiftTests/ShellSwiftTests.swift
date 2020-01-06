import XCTest
@testable import ShellSwift

final class ShellSwiftTests: XCTestCase {

    func testWritingAndReading() {

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

    func testConversions() {
        do {
            struct Model: Decodable {
                let a: Int
            }

            let model = try echo("{\"a\":12}") | Data.new() | JSONDecoder().decode(Model.self)
            XCTAssertEqual(model.a, 12)

            XCTAssertEqual(try Data(base64Encoded: "aGVsbG8=")! | String.new(), "hello")

        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testCurl() {
        do {
            struct Model: Decodable {
                let id: Int
            }

            let model = try curl("https://jsonplaceholder.typicode.com/todos/1") | JSONDecoder().decode(Model.self)
            XCTAssertEqual(model.id, 1)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testShell() {
        do {
            let output = try shell("echo x")
            XCTAssertEqual(output, "x\n")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func testShellFails() {
        XCTAssertThrowsError(try shell("test"))
    }

    static var allTests = [
        ("testWritingAndReading", testWritingAndReading),
        ("testConversions", testConversions),
        ("testCurl", testCurl),
    ]
}
