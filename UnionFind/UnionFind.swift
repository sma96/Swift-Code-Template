//
//  UnionFind.swift
//  cote
//
//  Created by 마석우 on 3/13/24.
//

import Foundation

func find(x: Int) -> Int {
    if parent[x] == x {
        return x
    }
    
    parent[x] = find(x: parent[x])
    return parent[x]
}

func union(a: Int, b: Int) {
    let a = find(x: a)
    let b = find(x: b)
    
    parent[a] = b
}
