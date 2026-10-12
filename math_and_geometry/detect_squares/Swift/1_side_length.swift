private let maxCoord = 1000

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
        // The query point is one corner. Try every side length d and every
        // direction (dx, dy) the square can extend in from the query point.
        for d in 1...maxCoord {
            for dx in [d, -d] {
                for dy in [d, -d] {
                    // Opposite corner, plus the two corners that touch the query point.
                    let diag = counts[Point(x: x + dx, y: y + dy)] ?? 0
                    if diag == 0 { continue }
                    let side1 = counts[Point(x: x + dx, y: y)] ?? 0
                    let side2 = counts[Point(x: x, y: y + dy)] ?? 0
                    total += diag * side1 * side2
                }
            }
        }
        return total
    }
}
