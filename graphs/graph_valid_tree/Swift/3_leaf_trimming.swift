class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        if edges.count != n - 1 { return false }

        var adj = Array(repeating: [Int](), count: n)
        var degree = Array(repeating: 0, count: n)
        for edge in edges {
            adj[edge[0]].append(edge[1])
            adj[edge[1]].append(edge[0])
            degree[edge[0]] += 1
            degree[edge[1]] += 1
        }

        // Repeatedly strip leaves (degree <= 1). A tree gets fully stripped;
        // a cycle keeps its nodes at degree >= 2 forever.
        // The queue is an array plus a head index, so dequeuing is O(1).
        var queue: [Int] = []
        for i in 0..<n where degree[i] <= 1 {
            queue.append(i)
        }

        var head = 0
        var removed = Array(repeating: false, count: n)
        var removedCount = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            removed[node] = true
            removedCount += 1
            for nei in adj[node] where !removed[nei] {
                degree[nei] -= 1
                if degree[nei] == 1 {
                    queue.append(nei)
                }
            }
        }

        return removedCount == n
    }
}
