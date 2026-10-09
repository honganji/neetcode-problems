class LRUCache:
    def __init__(self, capacity: int) -> None:
        self.capacity = capacity
        self.items: list[tuple[int, int]] = []

    def _find(self, key: int) -> int:
        for i, (k, _) in enumerate(self.items):
            if k == key:
                return i
        return -1

    def get(self, key: int) -> int:
        i = self._find(key)
        if i == -1:
            return -1
        pair = self.items.pop(i)
        self.items.append(pair)
        return pair[1]

    def put(self, key: int, value: int) -> None:
        i = self._find(key)
        if i != -1:
            self.items.pop(i)
        elif len(self.items) == self.capacity:
            self.items.pop(0)
        self.items.append((key, value))
