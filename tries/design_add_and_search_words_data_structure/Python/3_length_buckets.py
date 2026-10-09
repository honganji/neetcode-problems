class WordDictionary:
    def __init__(self) -> None:
        self.buckets: dict[int, list[str]] = {}

    def addWord(self, word: str) -> None:
        self.buckets.setdefault(len(word), []).append(word)

    def search(self, word: str) -> bool:
        for candidate in self.buckets.get(len(word), []):
            if all(p == "." or p == c for p, c in zip(word, candidate)):
                return True
        return False
