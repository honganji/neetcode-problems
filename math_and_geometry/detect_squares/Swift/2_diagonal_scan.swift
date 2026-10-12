class DetectSquares {
    private struct Point: Hashable {
        let x: Int
        let y: Int
    }

    private var counts: [Point: Int] = [:]

    init() {}

    func add(_ point: [Int]) {
        counts[Point(x: point[0], y: point[1]), default: 0] += 1
    }

    func count(_ point: [Int]) -> Int {
        let x = point[0]
        let y = point[1]
        var total = 0
        // Treat each stored point as the corner opposite the query point.
        // It only works if it lies on the same diagonal (equal distance in x and y).
        for (p, c) in counts {
            let dx = abs(p.x - x)
            if dx == 0 || dx != abs(p.y - y) { continue }
            let corner1 = counts[Point(x: x, y: p.y)] ?? 0
            let corner2 = counts[Point(x: p.x, y: y)] ?? 0
            total += c * corner1 * corner2
        }
        return total
    }
}
