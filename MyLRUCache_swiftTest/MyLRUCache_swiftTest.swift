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
        
        // 実行 & 検証
        XCTAssertEqual("\(type(of: lru.caches))", "\(Array<(key: String, value: String)>.self)", "キャッシュのデータ型が違います。")
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
    
    func test_dataA_をget_a_で取得()
    {
        // 準備
        lru.put(key: "a", value: "dataA")
        
        // 実行 & 検証
        XCTAssertEqual(lru.get(key: "a"), "dataA", "getメソッドで'dataA'の取得ができていませ。")
    }
    
    func test_dataB_をget_b_で取得()
    {
        // 準備
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
                
        // 実行 & 検証
        XCTAssertEqual(lru.get(key: "b"), "dataB", "getメソッドで'dataB'の取得ができていませ。")
    }
    
    func test_dataC_をget_c_で取得()
    {
        // 準備
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
                
        // 実行 & 検証
        XCTAssertEqual(lru.get(key: "c"), nil, "getメソッドであるはずのないオブジェクトが取得されています。")
    }
}
