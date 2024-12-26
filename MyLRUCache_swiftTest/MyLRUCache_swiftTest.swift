import XCTest
@testable import MyLRUCache_swift

class MyCommandLineToolTests : XCTestCase
{
    func test()
    {
        let expected = 5
        let actual = 2 + 2
        
        XCTAssertEqual(expected, actual, "計算が間違えています。")
    }
}
