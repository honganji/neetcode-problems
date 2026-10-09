def find_words(board: list[list[str]], words: list[str]) -> list[str]:
    rows, cols = len(board), len(board[0])

    def exists(r: int, c: int, word: str, i: int) -> bool:
        if board[r][c] != word[i]:
            return False
        if i == len(word) - 1:
            return True
        board[r][c] = "#"
        for nr, nc in ((r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)):
            if 0 <= nr < rows and 0 <= nc < cols and exists(nr, nc, word, i + 1):
                board[r][c] = word[i]
                return True
        board[r][c] = word[i]
        return False

    found: list[str] = []
    for word in dict.fromkeys(words):
        if len(word) > rows * cols:
            continue
        if any(exists(r, c, word, 0) for r in range(rows) for c in range(cols)):
            found.append(word)
    return found
