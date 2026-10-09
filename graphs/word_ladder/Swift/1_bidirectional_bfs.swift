class Solution {
    func ladderLength(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> Int {
        var unvisited = Set(wordList)
        guard unvisited.contains(endWord) else { return 0 }

        // Search from both ends and always grow the smaller frontier.
        var front: Set<String> = [beginWord]
        var back: Set<String> = [endWord]
        unvisited.remove(beginWord)
        unvisited.remove(endWord)
        var steps = 1 // words in the path so far, counting beginWord
        let letters = Array("abcdefghijklmnopqrstuvwxyz")

        while !front.isEmpty && !back.isEmpty {
            if front.count > back.count {
                swap(&front, &back)
            }

            var nextFront = Set<String>()
            for word in front {
                var chars = Array(word)
                for i in chars.indices {
                    let original = chars[i]
                    for letter in letters where letter != original {
                        chars[i] = letter
                        let candidate = String(chars)
                        if back.contains(candidate) { return steps + 1 } // the two searches meet
                        if unvisited.remove(candidate) != nil {
                            nextFront.insert(candidate)
                        }
                    }
                    chars[i] = original
                }
            }

            front = nextFront
            steps += 1
        }
        return 0
    }
}
