func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
    // Sort by squared distance, then keep the first k.
    let sorted = points.sorted { a, b in
        a[0] * a[0] + a[1] * a[1] < b[0] * b[0] + b[1] * b[1]
    }
    return Array(sorted.prefix(k))
}
