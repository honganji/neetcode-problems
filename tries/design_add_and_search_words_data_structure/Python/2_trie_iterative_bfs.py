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
        stack: list[tuple[_TrieNode, int]] = [(self.root, 0)]
        while stack:
            node, i = stack.pop()
            if i == len(word):
                if node.is_word:
                    return True
                continue
            ch = word[i]
            if ch == ".":
                for child in node.children:
                    if child is not None:
                        stack.append((child, i + 1))
            else:
                child = node.children[ord(ch) - ord("a")]
                if child is not None:
                    stack.append((child, i + 1))
        return False
