class _TrieNode:
    __slots__ = ("children", "is_end")

    def __init__(self) -> None:
        self.children: dict[str, _TrieNode] = {}
        self.is_end: bool = False


class Trie:
    def __init__(self) -> None:
        self.root = _TrieNode()

    def insert(self, word: str) -> None:
        node = self.root
        for ch in word:
            child = node.children.get(ch)
            if child is None:
                child = _TrieNode()
                node.children[ch] = child
            node = child
        node.is_end = True

    def search(self, word: str) -> bool:
        node = self._find(word)
        return node is not None and node.is_end

    def startsWith(self, prefix: str) -> bool:
        return self._find(prefix) is not None

    def _find(self, key: str) -> _TrieNode | None:
        node = self.root
        for ch in key:
            node = node.children.get(ch)
            if node is None:
                return None
        return node
