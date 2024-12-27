//
//  MyLRUCache_swift.swift
//  MyLRUCache_swift
//
//  Created by 齋藤祐希 on 2024/12/27.
//

import Foundation

class MyLRUCache_swift
{
    private var _caches: Array<(key: String, value: String)>
    
    init()
    {
        _caches = []
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
    
    public var caches: Array<(key: String, value: String)>
    {
        get
        {
            _caches
        }
    }
}
