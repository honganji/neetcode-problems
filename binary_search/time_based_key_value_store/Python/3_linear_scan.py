class TimeMap:
    def __init__(self) -> None:
        self.store: dict[str, list[tuple[int, str]]] = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        self.store.setdefault(key, []).append((timestamp, value))

    def get(self, key: str, timestamp: int) -> str:
        for stamp, value in reversed(self.store.get(key, [])):
            if stamp <= timestamp:
                return value
        return ""
