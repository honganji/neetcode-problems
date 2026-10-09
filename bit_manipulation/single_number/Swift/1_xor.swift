class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var result = 0
        for n in nums {
            result ^= n  // pairs cancel out: a ^ a == 0
        }
        return result
    }
}
