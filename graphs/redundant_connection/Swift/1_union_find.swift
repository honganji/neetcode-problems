class Solution {
    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        let n = edges.count
        var parent = Array(0...n)
        var size = Array(repeating: 1, count: n + 1)

        func find(_ x: Int) -> Int {
            var x = x
            while parent[x] != x {
                parent[x] = parent[parent[x]]  // path halving
                x = parent[x]
            }
            return x
        }

        for edge in edges {
            var ra = find(edge[0])
            var rb = find(edge[1])
            if ra == rb { return edge }  // already connected, so this edge closes a loop
            if size[ra] < size[rb] { swap(&ra, &rb) }
            parent[rb] = ra
            size[ra] += size[rb]
        }

        return []
    }
}
