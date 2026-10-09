class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        // tails[k] = smallest value that can end an increasing subsequence of length k + 1.
        // This array stays sorted, so we can binary search it.
        var tails: [Int] = []
        for x in nums {
            // Find the first index where tails[i] >= x.
            var lo = 0
            var hi = tails.count
            while lo < hi {
                let mid = (lo + hi) / 2
                if tails[mid] < x {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            if lo == tails.count {
                tails.append(x)  // x extends the longest subsequence so far
            } else {
                tails[lo] = x  // x makes a smaller tail for this length
            }
        }
        return tails.count
    }
}
