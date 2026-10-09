func minInterval(_ intervals: [[Int]], _ queries: [Int]) -> [Int] {
    // Each interval "paints" the compressed query positions it covers with its size,
    // keeping the minimum. Painting is a range update; reading a query is a point read.
    let sortedQueries = Array(Set(queries)).sorted()
    let m = sortedQueries.count
    let inf = 1 << 30
    var tree = [Int](repeating: inf, count: 2 * m)  // bottom-up tree; leaves at m..2m-1

    for iv in intervals {
        let size = iv[1] - iv[0] + 1
        var lo = lowerBound(sortedQueries, iv[0]) + m
        var hi = upperBound(sortedQueries, iv[1]) + m  // exclusive
        while lo < hi {
            if lo % 2 == 1 {
                tree[lo] = min(tree[lo], size)
                lo += 1
            }
            if hi % 2 == 1 {
                hi -= 1
                tree[hi] = min(tree[hi], size)
            }
            lo >>= 1
            hi >>= 1
        }
    }

    var answer = [Int](repeating: -1, count: queries.count)
    for i in queries.indices {
        // Walk from the leaf up to the root; the best size painted on the path wins.
        var p = lowerBound(sortedQueries, queries[i]) + m
        var best = inf
        while p >= 1 {
            best = min(best, tree[p])
            p >>= 1
        }
        if best != inf {
            answer[i] = best
        }
    }
    return answer
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

private func upperBound(_ sorted: [Int], _ x: Int) -> Int {
    var lo = 0
    var hi = sorted.count
    while lo < hi {
        let mid = (lo + hi) / 2
        if sorted[mid] <= x {
            lo = mid + 1
        } else {
            hi = mid
        }
    }
    return lo
}
