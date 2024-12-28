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
        lru.maxSize = 2
        
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
    
    func test_a_dataA_を削除()
    {
        // 準備
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        
        // 実行
        lru.pop()
        
        // 検証
        XCTAssertNil(lru.get(key: "a"), "(a, dataA)の削除ができていません。")
    }
    
    func test_ないはずの_a_dataA_を取得しようとしたらnilを返すか()
    {
        // 準備
        // 実行 & 検証
        XCTAssertNil(lru.get(key: "a"), "データがないときnilを返していません。")
    }
}

class キャッシュの最大サイズに達した時最も使われていないデータから順に消される : XCTestCase
{
    var lru: MyLRUCache_swift!
    
    override func setUp()
    {
        super.setUp()
        lru = MyLRUCache_swift()
    }
    
    func test_キャッシュの最大サイズを3に設定()
    {
        // 準備
        
        // 実行
        lru.maxSize = 3
        
        // 検証
        XCTAssertEqual(lru.maxSize, 3, "キャッシュの最大サイズが3ではないです。")
    }
    
    func test_キャッシュの最大サイズを4に設定()
    {
        // 準備
        
        // 実行
        lru.maxSize = 4
        
        // 検証
        XCTAssertEqual(lru.maxSize, 4, "キャッシュの最大サイズが3ではないです。")
    }
    
    func test_キャッシュの最大サイズを3にして達したらtrueになるか()
    {
        // 準備
        lru.maxSize = 3
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        lru.put(key: "c", value: "dataC")
                
        // 実行 & 検証
        XCTAssertTrue(lru.isMax(), "最大サイズに達しても検出できていません。")
    }
    
    func test_キャッシュの最大サイズを3にしてサイズが2のときはfalseになるか()
    {
        // 準備
        lru.maxSize = 3
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        
        // 実行 & 検証
        XCTAssertTrue(!lru.isMax(), "最大サイズの誤検知しています。")
    }
    
    func test_a_dataA_と_b_dataB_を追加してaをgetしたらaをキャッシュの一番後ろに移動()
    {
        // 準備
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        
        // 実行
        lru.get(key: "a")
        
        // 検証
        XCTAssertEqual(lru.caches[1].key, "a", "put時の入れ替えができていません。")
    }
    
    func test_最大サイズを3にして4つ目を追加する直前にaをgetしてからputする()
    {
        // 準備
        lru.maxSize = 3
        
        // 実行
        lru.put(key: "a", value: "dataA")
        lru.put(key: "b", value: "dataB")
        lru.put(key: "c", value: "dataC")
        print("key: a, value: \(lru.get(key: "a")!)")
        lru.put(key: "d", value: "dataD")
        
        print(lru.caches)
        
        // 検証
        XCTAssertEqual(lru.caches[0].key, "c", "一番使われていないデータが削除されていません。")
    }
}
