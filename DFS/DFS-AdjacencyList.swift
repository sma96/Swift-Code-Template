import Foundation

func dfs(v: Int) {
    guard !visited[v] else { return }
    
    visited[v] = true

    for n in graph[v] {
        if !visited[n] {
            dfs(v: n)
        }
    }
}
