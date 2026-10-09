class Solution {
    func alienOrder(_ words: [String]) -> String {
        // Letters are numbered 0..25 (a..z). adj[u][v] is true when u must come before v.
        var present = [Bool](repeating: false, count: 26)
        var adj = [[Bool]](repeating: [Bool](repeating: false, count: 26), count: 26)
        let bytes = words.map { Array($0.utf8) }

        for word in bytes {
            for ch in word {
                present[Int(ch) - 97] = true
            }
        }

        for i in 0..<max(bytes.count - 1, 0) {
            let first = bytes[i]
            let second = bytes[i + 1]
            let limit = min(first.count, second.count)
            var j = 0
            while j < limit && first[j] == second[j] {
                j += 1
            }
            if j == limit {
                // "abc" before "ab" can never be sorted
                if first.count > second.count { return "" }
                continue
            }
            adj[Int(first[j]) - 97][Int(second[j]) - 97] = true
        }

        // Count how many letters must come right before each letter
        var indegree = [Int](repeating: 0, count: 26)
        for u in 0..<26 {
            for v in 0..<26 where adj[u][v] {
                indegree[v] += 1
            }
        }

        // Letters with nothing blocking them can go first
        var queue: [Int] = []
        var total = 0
        for c in 0..<26 where present[c] {
            total += 1
            if indegree[c] == 0 { queue.append(c) }
        }

        var head = 0
        var order: [UInt8] = []
        while head < queue.count {
            let u = queue[head]
            head += 1
            order.append(UInt8(u + 97))
            for v in 0..<26 where adj[u][v] {
                indegree[v] -= 1
                if indegree[v] == 0 { queue.append(v) }
            }
        }

        // Letters stuck with blockers form a cycle, so no valid order exists
        return order.count == total ? String(decoding: order, as: UTF8.self) : ""
    }
}
