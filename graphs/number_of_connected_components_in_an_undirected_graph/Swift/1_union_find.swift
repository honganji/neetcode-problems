class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        var parent = Array(0..<n)
        var size = Array(repeating: 1, count: n)
        var components = n

        func find(_ x: Int) -> Int {
            var node = x
            // Path halving: point each visited node at its grandparent.
            while parent[node] != node {
                parent[node] = parent[parent[node]]
                node = parent[node]
            }
            return node
        }

        for edge in edges {
            var rootA = find(edge[0])
            var rootB = find(edge[1])
            if rootA == rootB { continue } // already in the same group

            // Attach the smaller group under the bigger one.
            if size[rootA] < size[rootB] {
                swap(&rootA, &rootB)
            }
            parent[rootB] = rootA
            size[rootA] += size[rootB]
            components -= 1 // two groups became one
        }

        return components
    }
}
