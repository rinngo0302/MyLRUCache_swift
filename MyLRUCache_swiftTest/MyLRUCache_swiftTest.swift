import XCTest
@testable import MyLRUCache_swift

class Mapのような仕組み : XCTestCase
{
    var lru: MyLRUCache_swift!
    
    override func setUp()
    {
        super.setUp()
        lru = MyLRUCache_swift()
    }
    
    func test_typeで_String_String_になるか()
    {
        // 準備
        //let lru: MyLRUCache_swift = MyLRUCache_swift()
        
        // 実行 & 検証
        XCTAssertEqual("\(type(of: lru.caches))", "\(Array<(String, String)>.self)", "キャッシュのデータ型が違います。")
    }
    
    func test_a_dataA_を追加()
    {
        // 準備
        
        // 実行
        lru.put(key: "a", value: "dataA")
        
        // 検証
        XCTAssertEqual(lru.caches[0].value, "dataA", "('a', 'dataA')の追加ができていません。")
    }
    
    func test_a_dataA_と_b_dataB_を追加()
    {
        // 準備
        
        // 実行
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        
        // 検証
        XCTAssertEqual(lru.caches[0].value, "dataA", "('a', 'dataA')の追加ができていません。")
        XCTAssertEqual(lru.caches[1].value, "dataB", "('b', 'dataB')の追加ができていません。")
    }
}
