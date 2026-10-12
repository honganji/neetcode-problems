class DetectSquares {
    private struct Point: Equatable {
        let x: Int
        let y: Int
    }

    private var points: [Point] = []

    init() {}

    func add(_ point: [Int]) {
        points.append(Point(x: point[0], y: point[1]))
    }

    func count(_ point: [Int]) -> Int {
        let x = point[0]
        let y = point[1]
        var total = 0
        // Each stored point is a candidate for the corner opposite the query point.
        // Find the other two corners by scanning the whole list.
        for p in points {
            if p.x == x || abs(p.x - x) != abs(p.y - y) { continue }
            let corner1 = Point(x: x, y: p.y)
            let corner2 = Point(x: p.x, y: y)
            let count1 = points.filter { $0 == corner1 }.count
            let count2 = points.filter { $0 == corner2 }.count
            total += count1 * count2
        }
        return total
    }
}
