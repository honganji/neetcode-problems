class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        let words = Array(Set(wordList).union([beginWord]))
        var index: [String: Int] = [:]
        for (i, word) in words.enumerated() {
            index[word] = i
        }
        guard let start = index[beginWord], let end = index[endWord] else { return 0 }

        // Build the full graph: connect every pair of words that differ by one letter.
        var graph = Array(repeating: [Int](), count: words.count)
        for i in words.indices {
            for j in (i + 1)..<words.count {
                if oneLetterApart(words[i], words[j]) {
                    graph[i].append(j)
                    graph[j].append(i)
                }
            }
        }

        // Plain BFS on the explicit graph.
        var dist = Array(repeating: 0, count: words.count) // 0 = unvisited
        dist[start] = 1
        var queue = [start]
        var head = 0
        while head < queue.count {
            let node = queue[head]
            head += 1
            if node == end { return dist[node] }
            for next in graph[node] where dist[next] == 0 {
                dist[next] = dist[node] + 1
                queue.append(next)
            }
        }
        return 0
    }

    private func oneLetterApart(_ a: String, _ b: String) -> Bool {
        var diff = 0
        for (x, y) in zip(a, b) where x != y {
            diff += 1
        }
        return diff == 1
    }
}
