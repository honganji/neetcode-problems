func lastStoneWeight(_ stones: [Int]) -> Int {
    var sorted = stones.sorted()  // ascending, so the heaviest stones are at the end

    while sorted.count > 1 {
        let heaviest = sorted.removeLast()
        let second = sorted.removeLast()
        if heaviest != second {
            let diff = heaviest - second
            // binary search for the first index whose value is >= diff
            var lo = 0
            var hi = sorted.count
            while lo < hi {
                let mid = (lo + hi) / 2
                if sorted[mid] < diff {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            sorted.insert(diff, at: lo)
        }
    }

    return sorted.first ?? 0
}
