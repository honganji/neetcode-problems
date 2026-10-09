class Solution {
    func rob(_ nums: [Int]) -> Int {
        // robPrev: best total using the houses before the last one
        // robLast: best total using all houses seen so far
        var robPrev = 0
        var robLast = 0
        for money in nums {
            // either skip this house, or rob it and add it to robPrev
            (robPrev, robLast) = (robLast, max(robLast, robPrev + money))
        }
        return robLast
    }
}
