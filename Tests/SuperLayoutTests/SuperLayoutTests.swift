import XCTest
@testable import SuperLayout

class SuperLayoutTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SuperLayout().text, "Hello, World!")
    }


    static var allTests : [(String, (SuperLayoutTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
