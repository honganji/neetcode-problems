class Solution {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        let rows = board.count
        let cols = board[0].count
        var word = Array(word)

        // If the board lacks any letter the word needs, it can never match.
        var boardCount: [Character: Int] = [:]
        for row in board {
            for ch in row {
                boardCount[ch, default: 0] += 1
            }
        }
        var wordCount: [Character: Int] = [:]
        for ch in word {
            wordCount[ch, default: 0] += 1
        }
        if wordCount.contains(where: { boardCount[$0.key, default: 0] < $0.value }) {
            return false
        }

        // Start from the rarer end of the word to cut down the branches.
        if boardCount[word[0], default: 0] > boardCount[word[word.count - 1], default: 0] {
            word.reverse()
        }

        func dfs(_ r: Int, _ c: Int, _ i: Int) -> Bool {
            if i == word.count { return true }
            if r < 0 || c < 0 || r >= rows || c >= cols || board[r][c] != word[i] {
                return false
            }

            // Mark the cell as used in place, then restore it on the way back.
            let saved = board[r][c]
            board[r][c] = "#"
            let found = dfs(r + 1, c, i + 1) || dfs(r - 1, c, i + 1) ||
                dfs(r, c + 1, i + 1) || dfs(r, c - 1, i + 1)
            board[r][c] = saved
            return found
        }

        for r in 0..<rows {
            for c in 0..<cols {
                if dfs(r, c, 0) { return true }
            }
        }
        return false
    }
}
