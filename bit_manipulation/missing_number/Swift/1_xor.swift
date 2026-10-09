class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // XOR every index and every value: matching pairs cancel out,
        // leaving only the missing number.
        var missing = nums.count
        for (i, num) in nums.enumerated() {
            missing ^= i ^ num
        }
        return missing
    }
}
