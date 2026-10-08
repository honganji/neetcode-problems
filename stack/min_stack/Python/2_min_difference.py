class MinStack:
    def __init__(self) -> None:
        self.stack: list[int] = []
        self.min_val = 0

    def push(self, val: int) -> None:
        if not self.stack:
            self.stack.append(0)
            self.min_val = val
            return
        self.stack.append(val - self.min_val)
        if val < self.min_val:
            self.min_val = val

    def pop(self) -> None:
        diff = self.stack.pop()
        if diff < 0:
            self.min_val -= diff

    def top(self) -> int:
        diff = self.stack[-1]
        if diff < 0:
            return self.min_val
        return self.min_val + diff

    def getMin(self) -> int:
        return self.min_val
