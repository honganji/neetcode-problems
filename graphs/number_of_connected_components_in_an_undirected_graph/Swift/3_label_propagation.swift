class Solution {
    func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
        // Every node starts out labeled with its own number.
        var label = Array(0..<n)

        // Keep letting edge endpoints adopt the smaller label until nothing changes.
        var changed = true
        while changed {
            changed = false
            for edge in edges {
                let a = edge[0]
                let b = edge[1]
                let low = min(label[a], label[b])
                if label[a] != low || label[b] != low {
                    label[a] = low
                    label[b] = low
                    changed = true
                }
            }
        }

        // Each component ends up labeled with its smallest node,
        // so the nodes still holding their own number are one per component.
        return (0..<n).filter { label[$0] == $0 }.count
    }
}
