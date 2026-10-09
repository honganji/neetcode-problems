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

        // Floyd-Warshall: afterwards adj[u][v] is true if u must come before v, even indirectly
        for k in 0..<26 {
            for i in 0..<26 where adj[i][k] {
                for j in 0..<26 where adj[k][j] {
                    adj[i][j] = true
                }
            }
        }

        // A letter that must come before itself means a cycle
        if (0..<26).contains(where: { adj[$0][$0] }) { return "" }

        // A letter that must come later has strictly more letters forced before it,
        // so sorting by that count gives a valid order
        var ancestorCount = [Int](repeating: 0, count: 26)
        for u in 0..<26 {
            for v in 0..<26 where adj[u][v] {
                ancestorCount[v] += 1
            }
        }

        let letters = (0..<26)
            .filter { present[$0] }
            .sorted { ancestorCount[$0] < ancestorCount[$1] }
        return String(decoding: letters.map { UInt8($0 + 97) }, as: UTF8.self)
    }
}
