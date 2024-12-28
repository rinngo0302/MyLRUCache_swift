//
//  MyLRUCache_swift.swift
//  MyLRUCache_swift
//
//  Created by 齋藤祐希 on 2024/12/27.
//

import Foundation

class MyLRUCache_swift
{
    // キャッシュ
    private var _caches: Array<(key: String, value: String)>
    
    // 最大サイズ
    private var _maxSize: Int
    
    init()
    {
        _caches = []
        _maxSize = 10
    }
    
    convenience init(size maxsize: Int)
    {
        self.init()
        _maxSize = maxsize
    }
    
    public func put(key key: String, value val: String)
    {
        if (isMax())
        {
            pop()
        }
        
        _caches.append((key: key, value: val))
    }
    
    public func get(key key: String) -> String?
    {
        for i in 0 ..< _caches.count
        {
            if (_caches[i].key == key)
            {
                let value = _caches[i].value
                
                swapNewCache(index: i)
                
                return value
            }
        }
        
        return nil
    }
    
    public func pop()
    {
        if (_caches.isEmpty)
        {
            print("削除する要素がありません。")
            return;
        }
        _caches.removeFirst()
    }
    
    public func isMax() -> Bool
    {
        return _caches.count >= _maxSize
    }
    
    private func swapNewCache(index newIndex: Int)
    {
        if (newIndex >= _caches.count)
        {
            print("このindexは範囲外です。")
            return;
        }
        
        let cache = _caches[newIndex]
        for i in newIndex ..< _caches.count - 1
        {
            _caches[i] = _caches[i + 1]
        }
        _caches[_caches.count - 1] = cache
    }
    
    public var caches: Array<(key: String, value: String)>
    {
        get
        {
            _caches
        }
    }
    
    public var maxSize: Int
    {
        get
        {
            _maxSize
        }
        
        set
        {
            if (newValue < 0)
            {
                print("キャッシュのサイズは0以上です。")
                return;
            }
            
            _maxSize = newValue
            
            while (_caches.count > newValue)
            {
                _caches.removeFirst()
            }
        }
    }
}
