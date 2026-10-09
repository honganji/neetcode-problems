from collections import Counter
from typing import List


class Solution:
    def exist(self, board: List[List[str]], word: str) -> bool:
        rows, cols = len(board), len(board[0])

        # If the board lacks any letter the word needs, it can never match.
        board_count = Counter(ch for row in board for ch in row)
        word_count = Counter(word)
        if any(board_count[ch] < n for ch, n in word_count.items()):
            return False

        # Start from the rarer end of the word to cut down the branches.
        if board_count[word[0]] > board_count[word[-1]]:
            word = word[::-1]

        def dfs(r: int, c: int, i: int) -> bool:
            if i == len(word):
                return True
            if r < 0 or c < 0 or r >= rows or c >= cols or board[r][c] != word[i]:
                return False

            # Mark the cell as used in place, then restore it on the way back.
            saved = board[r][c]
            board[r][c] = "#"
            found = (dfs(r + 1, c, i + 1) or dfs(r - 1, c, i + 1)
                     or dfs(r, c + 1, i + 1) or dfs(r, c - 1, i + 1))
            board[r][c] = saved
            return found

        return any(dfs(r, c, 0) for r in range(rows) for c in range(cols))
