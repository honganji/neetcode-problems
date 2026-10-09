func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    func dist(_ p: [Int]) -> Int {
        p[0] * p[0] + p[1] * p[1]
    }

    var pts = points  // copy, so the caller's array is left alone
    var left = 0
    var right = pts.count - 1
    while left <= right {
        // Pick a random pivot and move it to the end of the range.
        let pivotIdx = Int.random(in: left...right)
        let pivot = dist(pts[pivotIdx])
        pts.swapAt(pivotIdx, right)

        // Move every point closer than the pivot to the front of the range.
        var store = left
        for i in left..<right where dist(pts[i]) < pivot {
            pts.swapAt(store, i)
            store += 1
        }

        // The pivot is now in its final place; everything before it is closer.
        pts.swapAt(store, right)

        if store == k {
            break
        }
        if store < k {
            left = store + 1
        } else {
            right = store - 1
        }
    }
    return Array(pts[0..<k])
}
