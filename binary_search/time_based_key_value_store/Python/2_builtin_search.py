from bisect import bisect_right


class TimeMap:
    def __init__(self) -> None:
        self.timestamps: dict[str, list[int]] = {}
        self.values: dict[str, list[str]] = {}

    def set(self, key: str, value: str, timestamp: int) -> None:
        self.timestamps.setdefault(key, []).append(timestamp)
        self.values.setdefault(key, []).append(value)

    def get(self, key: str, timestamp: int) -> str:
        stamps = self.timestamps.get(key)
        if not stamps:
            return ""
        index = bisect_right(stamps, timestamp)
        if index == 0:
            return ""
        return self.values[key][index - 1]
