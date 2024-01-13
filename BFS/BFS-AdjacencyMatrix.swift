import Foundation

func bfs(v: (Int, Int)) {
    var queue: Queue<(Int, Int)> = Queue()
    
    queue.enqueue(v)
    graph[v.0][v.1] = 0 // 0으로 방문 처리
    
    while !queue.isEmpty {
        let n = queue.dequeue()!
        let move = [(-1, 0), (1, 0), (0, 1), (0, -1)] // 상하좌우 이동 가능일 경우
        
        for move in moves {
            let x = n.0 + move.0
            let y = n.1 + move.1
            
            if x >= 0 && x < row && y >= 0 && y < column && graph[x][y] == 1 {
                graph[x][y] = 0
                queue.enqueue((x, y))
            }
        }
    }
}
