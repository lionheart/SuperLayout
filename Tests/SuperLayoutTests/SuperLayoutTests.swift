import XCTest
@testable import SuperLayout

class SuperLayoutTests: XCTestCase {
    var viewA: UIView!
    var viewB: UIView!

    override func setUp() {
        let viewA = UIView()
        viewA.translatesAutoresizingMaskIntoConstraints = false

        let viewB = UIView()
        viewB.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView()
        container.addSubview(viewA)
        container.addSubview(viewB)
    }

    func testConstraint1() {
        let constraint = viewA.rightAnchor ~~ viewB.leftAnchor
        XCTAssert(constraint.constant == 0)
    }

    func testConstraint2() {
        let constraint = viewA.rightAnchor ~~ viewB.leftAnchor
        XCTAssert(constraint.multiplier == 1)
    }

    func testConstraint3() {
        let constraint = viewA.widthAnchor ~~ viewB.widthAnchor * 1.2
        XCTAssert(constraint.multiplier == 1.2)
    }

    static var allTests : [(String, (SuperLayoutTests) -> () throws -> Void)] {
        return [
            ("testConstraint1", testConstraint1),
            ("testConstraint2", testConstraint2),
            ("testConstraint3", testConstraint3),
        ]
    }
}
