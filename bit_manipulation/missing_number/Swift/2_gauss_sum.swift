class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 0..n should add up to n(n+1)/2; the gap to the actual sum is the missing number.
        let n = nums.count
        return n * (n + 1) / 2 - nums.reduce(0, +)
    }
}
