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
        _caches.append((key: key, value: val))
    }
    
    public func get(key key: String) -> String?
    {
        for i in 0 ..< _caches.count
        {
            if (_caches[i].key == key)
            {
                return _caches[i].value
            }
        }
        
        return nil
    }
    
    public func pop(key key: String)
    {
        _caches = _caches.filter { $0.key != key }
    }
    
    public func isMax() -> Bool
    {
        return _caches.count >= _maxSize
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
