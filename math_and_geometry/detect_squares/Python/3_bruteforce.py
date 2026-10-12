class DetectSquares:
    def __init__(self):
        self.points = []

    def add(self, point):
        self.points.append((point[0], point[1]))

    def count(self, point):
        x, y = point
        total = 0
        # Each stored point is a candidate for the corner opposite the query point.
        # Find the other two corners by scanning the whole list.
        for px, py in self.points:
            if px == x or abs(px - x) != abs(py - y):
                continue
            total += self.points.count((x, py)) * self.points.count((px, y))
        return total
