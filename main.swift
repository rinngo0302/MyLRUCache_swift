//
//  main.swift
//  MyLRUCache_swift
//
//  Created by 齋藤祐希 on 2025/01/05.
//

var lru1 = MyLRUCache_swift(size: 2)

lru1.put(key: "a", value: "dataA")
lru1.put(key: "b", value: "dataB")
lru1.put(key: "c", value: "dataC")
print(lru1.get(key: "a"))

var lru2 = MyLRUCache_swift(size: 2)

lru2.put(key: "a", value: "dataA")
lru2.put(key: "b", value: "dataB")
print("a: \(lru2.get(key: "a"))")
lru2.put(key: "c", value: "dataC")
print("b: \(lru2.get(key: "b"))")
