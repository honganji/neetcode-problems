class Solution {
    func canJump(_ nums: [Int]) -> Bool {
        let n = nums.count
        // canReach[i] is true if the last index can be reached from index i
        var canReach = [Bool](repeating: false, count: n)
        canReach[n - 1] = true
        for i in stride(from: n - 2, through: 0, by: -1) {
            let furthest = min(i + nums[i], n - 1)
            // stride yields no values when nums[i] is 0
            for j in stride(from: i + 1, through: furthest, by: 1) {
                if canReach[j] {
                    canReach[i] = true
                    break
                }
            }
        }
        return canReach[0]
    }
}
