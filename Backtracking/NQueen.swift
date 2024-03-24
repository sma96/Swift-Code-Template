//
//  NQueen.swift
//  cote
//
//  Created by 마석우 on 3/24/24.
//

import Foundation

var queenPos: [Int] = Array(repeating: -1, count: N)
var result = 0

func checkQueen(x: Int, y: Int) -> Bool {
    for (qx, qy) in queenPos.enumerated() {
        if qy > -1 && (x == qx || y == qy || abs(x-qx) - abs(y-qy) == 0) {
            return false
        }
    }
    return true
}

func nQueen(start: Int, count: Int) {
    if count == N {
        result += 1
        return
    }
    
    for i in 0..<N {
        if checkQueen(x: start, y: i) {
            queenPos[start] = i
            nQueen(start: start+1, count: count+1)
            queenPos[start] = -1
        }
    }
}

