from collections import Counter

MAX_COORD = 1000


class DetectSquares:
    def __init__(self):
        self.counts = Counter()

    def add(self, point):
        self.counts[(point[0], point[1])] += 1

    def count(self, point):
        x, y = point
        total = 0
        # The query point is one corner. Try every side length d and every
        # direction (dx, dy) the square can extend in from the query point.
        for d in range(1, MAX_COORD + 1):
            for dx in (d, -d):
                for dy in (d, -d):
                    # Opposite corner, plus the two corners that touch the query point.
                    diag = self.counts[(x + dx, y + dy)]
                    if diag:
                        total += diag * self.counts[(x + dx, y)] * self.counts[(x, y + dy)]
        return total
