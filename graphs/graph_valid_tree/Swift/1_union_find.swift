class Solution {
    func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
        // A tree on n nodes has exactly n - 1 edges.
        if edges.count != n - 1 { return false }

        var parent = Array(0..<n)
        var size = Array(repeating: 1, count: n)

        func find(_ x: Int) -> Int {
            var node = x
            while parent[node] != node {
                parent[node] = parent[parent[node]]  // path halving
                node = parent[node]
            }
            return node
        }

        for edge in edges {
            var rootA = find(edge[0])
            var rootB = find(edge[1])
            if rootA == rootB { return false }  // this edge would close a cycle
            if size[rootA] < size[rootB] {
                swap(&rootA, &rootB)
            }
            parent[rootB] = rootA
            size[rootA] += size[rootB]
        }

        return true
    }
}
