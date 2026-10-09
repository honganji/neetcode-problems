class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let seen = Set(nums)
        for i in 0...nums.count {
            if !seen.contains(i) { return i }
        }
        return -1 // unreachable: the constraints guarantee one number is missing
    }
}
