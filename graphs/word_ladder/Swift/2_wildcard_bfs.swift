class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        // Group words by wildcard patterns: "h*t" holds hit, hot, ...
        var buckets: [String: [String]] = [:]
        for word in wordList {
            let chars = Array(word)
            for i in chars.indices {
                buckets[pattern(chars, i), default: []].append(word)
            }
        }

        // Level-by-level BFS.
        var visited: Set<String> = [beginWord]
        var level = [beginWord]
        var count = 1
        while !level.isEmpty {
            var next: [String] = []
            for word in level {
                if word == endWord { return count }
                let chars = Array(word)
                for i in chars.indices {
                    // remove so each bucket is expanded only once
                    guard let bucket = buckets.removeValue(forKey: pattern(chars, i)) else { continue }
                    for neighbor in bucket {
                        if visited.insert(neighbor).inserted {
                            next.append(neighbor)
                        }
                    }
                }
            }
            level = next
            count += 1
        }
        return 0
    }

    private func pattern(_ chars: [Character], _ i: Int) -> String {
        var copy = chars
        copy[i] = "*"
        return String(copy)
    }
}
