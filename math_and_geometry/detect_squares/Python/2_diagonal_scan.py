from collections import Counter


class DetectSquares:
    def __init__(self):
        self.counts = Counter()

    def add(self, point):
        self.counts[(point[0], point[1])] += 1

    def count(self, point):
        x, y = point
        total = 0
        # Treat each stored point as the corner opposite the query point.
        # It only works if it lies on the same diagonal (equal distance in x and y).
        for (px, py), c in self.counts.items():
            dx = abs(px - x)
            if dx == 0 or dx != abs(py - y):
                continue
            total += c * self.counts[(x, py)] * self.counts[(px, y)]
        return total
