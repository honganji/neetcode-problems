func findTargetSumWays(_ nums: [Int], _ target: Int) -> Int {
    let half = nums.count / 2
    let left = Array(nums[..<half])
    let right = Array(nums[half...])

    func allSignedSums(_ values: [Int]) -> [Int] {
        var sums = [0]
        for v in values {
            // every sum so far can take either +v or -v
            sums = sums.map { $0 + v } + sums.map { $0 - v }
        }
        return sums
    }

    // For each right-half sum, the left half must produce target - that sum.
    var leftCounts: [Int: Int] = [:]
    for s in allSignedSums(left) {
        leftCounts[s, default: 0] += 1
    }

    var ways = 0
    for s in allSignedSums(right) {
        ways += leftCounts[target - s, default: 0]
    }
    return ways
}
