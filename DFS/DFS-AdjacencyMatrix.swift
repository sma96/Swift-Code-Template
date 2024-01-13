import Foundation

func dfs(v: (Int, Int)) {
    guard graph[v.0][v.1] == 1 else { return }
    let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    graph[v.0][v.1] = 0 // 0으로 방문 처리
    
    for move in moves {
        let x = v.0 + move.0
        let y = v.1 + move.1
        
        if x >= 0 && x < row && y >= 0 && y < column && graph[x][y] == 1 {
            dfs(v: (x, y))
        }
    }
}
