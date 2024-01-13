import Foundation

func dijkstra(start: Int) // start = 시작 노드 {
    var pq: PriorityQueue<(Int, Int)> = PriorityQueue { $0.1 < $1.1 } () // (노드 번호, 노드까지의 거리)
    
    pq.enqueue((start, 0))
    distance[v.0] = 0

    while !pq.isEmpty {
        let (vertex, weight) = pq.dequeue()!
        
        for (v, w) in graph[vertex] {
            if distance[vertex] + w < distance[v] {
                distance[v] = distance[vertex] + w
                pq.enqueue(element: (v, distance[v]))
        }
    }
}
