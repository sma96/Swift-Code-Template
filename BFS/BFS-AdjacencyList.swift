import Foundation

func bfs(v: Int) {
    var queue: Queue<Int> = Queue()

    queue.enqueue(v)
    visited[v] = true
    
    while !queue.isEmpty {
        let n = queue.dequeue()!
       
        for i in graph[n] {
            if !visited[i] {
                visited[v] = true
                queue.enqueue(i)
            }
        }
    }
}

