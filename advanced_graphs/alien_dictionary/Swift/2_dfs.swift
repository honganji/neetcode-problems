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

        // 0 = not visited, 1 = on the current DFS path, 2 = finished
        var state = [Int](repeating: 0, count: 26)
        var postorder: [Int] = []

        func dfs(_ u: Int) -> Bool {
            state[u] = 1
            for v in 0..<26 where adj[u][v] {
                // Reaching a letter that is still on the path means a cycle
                if state[v] == 1 { return false }
                if state[v] == 0 && !dfs(v) { return false }
            }
            state[u] = 2
            postorder.append(u)
            return true
        }

        for c in 0..<26 where present[c] && state[c] == 0 {
            if !dfs(c) { return "" }
        }

        // A letter finishes only after every letter it points to, so reversing finish order works
        let order = postorder.reversed().map { UInt8($0 + 97) }
        return String(decoding: order, as: UTF8.self)
    }
}
