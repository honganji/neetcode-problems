func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    func canFinish(_ k: Int) -> Bool {
        var hours = 0
        for pile in piles {
            hours += (pile + k - 1) / k
            if hours > h { return false }
        }
        return true
    }

    var low = 1
    var high = piles.max()!
    while low < high {
        let mid = (low + high) / 2
        if canFinish(mid) {
            high = mid
        } else {
            low = mid + 1
        }
    }
    return low
}
