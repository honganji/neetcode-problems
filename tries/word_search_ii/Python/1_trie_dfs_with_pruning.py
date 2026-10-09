class _TrieNode:
    __slots__ = ("children", "word")

    def __init__(self) -> None:
        self.children: dict[str, _TrieNode] = {}
        self.word: str | None = None


def find_words(board: list[list[str]], words: list[str]) -> list[str]:
    root = _TrieNode()
    for word in words:
        node = root
        for ch in word:
            node = node.children.setdefault(ch, _TrieNode())
        node.word = word

    rows, cols = len(board), len(board[0])
    found: list[str] = []

    def dfs(r: int, c: int, parent: _TrieNode) -> None:
        ch = board[r][c]
        node = parent.children.get(ch)
        if node is None:
            return
        if node.word is not None:
            found.append(node.word)
            node.word = None
        board[r][c] = "#"
        for nr, nc in ((r + 1, c), (r - 1, c), (r, c + 1), (r, c - 1)):
            if 0 <= nr < rows and 0 <= nc < cols:
                dfs(nr, nc, node)
        board[r][c] = ch
        # Every word below this node has been collected, so cut the branch.
        if not node.children:
            del parent.children[ch]

    for r in range(rows):
        for c in range(cols):
            dfs(r, c, root)
    return found
