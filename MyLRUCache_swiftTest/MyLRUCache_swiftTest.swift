import XCTest
@testable import MyLRUCache_swift

class MyLRUCache_swiftTest : XCTestCase
{
    class Mapのような仕組み : XCTestCase
    {
        class キャッシュのタプルの配列を用意する : XCTestCase
        {
            func typeで_String_String_になるか()
            {
                // 準備
                let lru: MyLRUCache_swift = MyLRUCache_swift()
                
                // 実行 & 検証
                XCTAssertEqual("\(type(of: lru.cache))", "\(Array<(String, String)>.self)", "キャッシュのデータ型が違います。")
            }
        }
    }
}
