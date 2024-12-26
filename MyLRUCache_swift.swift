//
//  MyLRUCache_swift.swift
//  MyLRUCache_swift
//
//  Created by 齋藤祐希 on 2024/12/27.
//

import Foundation

class MyLRUCache_swift
{
    private var _cache: Array<(String, String)>
    
    init()
    {
        _cache = []
    }
    
    public var cache: Array<(String, String)>
    {
        get
        {
            _cache
        }
    }
}
