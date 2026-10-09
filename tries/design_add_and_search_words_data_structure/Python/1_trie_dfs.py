class _TrieNode:
    __slots__ = ("children", "is_word")

    def __init__(self) -> None:
        self.children: list["_TrieNode | None"] = [None] * 26
        self.is_word = False


class WordDictionary:
    def __init__(self) -> None:
        self.root = _TrieNode()

    def addWord(self, word: str) -> None:
        node = self.root
        for ch in word:
            idx = ord(ch) - ord("a")
            if node.children[idx] is None:
                node.children[idx] = _TrieNode()
            node = node.children[idx]
        node.is_word = True

    def search(self, word: str) -> bool:
        return self._dfs(self.root, word, 0)

    def _dfs(self, node: _TrieNode, word: str, i: int) -> bool:
        if i == len(word):
            return node.is_word
        ch = word[i]
        if ch == ".":
            return any(
                child is not None and self._dfs(child, word, i + 1)
                for child in node.children
            )
        child = node.children[ord(ch) - ord("a")]
        return child is not None and self._dfs(child, word, i + 1)
