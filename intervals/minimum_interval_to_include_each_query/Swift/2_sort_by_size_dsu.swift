func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
    // Handle the smallest intervals first. Each query is answered by the first
    // interval that covers it, and a "next unanswered" pointer skips finished queries.
    let sortedQueries = Array(Set(queries)).sorted()
    let m = sortedQueries.count
    var parent = Array(0...m)  // parent[m] is a sentinel

    func find(_ x: Int) -> Int {
        var v = x
        while parent[v] != v {
            parent[v] = parent[parent[v]]  // path halving
            v = parent[v]
        }
        return v
    }

    var best: [Int: Int] = [:]
    let byShortest = intervals.sorted { ($0[1] - $0[0]) < ($1[1] - $1[0]) }
    for iv in byShortest {
        let left = iv[0]
        let right = iv[1]
        let size = right - left + 1
        var j = find(lowerBound(sortedQueries, left))
        while j < m && sortedQueries[j] <= right {
            best[sortedQueries[j]] = size
            parent[j] = j + 1  // mark answered; skip it from now on
            j = find(j + 1)
        }
    }
    return queries.map { best[$0] ?? -1 }
}

private func lowerBound(_ sorted: [Int], _ x: Int) -> Int {
    var lo = 0
    var hi = sorted.count
    while lo < hi {
        let mid = (lo + hi) / 2
        if sorted[mid] < x {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
